<?php

class DocumentController extends BaseController {

	public function docUpload(){
		if (Auth::check()){
			$user = User::find(Auth::user()->id); 

			$file = Input::get('file'); 
			$name = Input::get('name');
			$filetype = Input::get('filetype');
			$group = Input::get('group');

			
			//randomising the name of the document so that duplicate names are not possible
			function randString($length){
			    $str = '';
			    $charset='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
			    $count = strlen($charset);
			    while ($length--) {
			        $str .= $charset[mt_rand(0, $count-1)];
			    }
			    return $str;
			}
			$documentName = randString(40); //string size - 40 characters

			if(is_dir('documents')){
				if($filetype == "txt") $result=file_put_contents('documents/'.$documentName.'.'.$filetype, base64_decode(str_replace("data:text/plain;base64,",'', $file)));
				else $result=file_put_contents('documents/'.$documentName.'.'.$filetype, $file);
			}
			else{
				$old = umask(0);
				mkdir('documents', 0777);
				umask($old);
				if($filetype == "txt") $result=file_put_contents('documents/'.$documentName.'.'.$filetype, base64_decode(str_replace("data:text/plain;base64,",'', $file)));
				else $result=file_put_contents('documents/'.$documentName.'.'.$filetype, $file);
			}

			if($result){ //i.e. if all goes well uploading the document
				$doc = new Document;
				$doc->user_id= $user->id;
				$doc->name = $name;
				$doc->group_id = $group;
				$doc->filetype = $filetype;
				$doc->storage_name = $documentName;
				$doc->save();

				if($doc->save()){
					return Response::json(array('message'=>"Document saved"));
				}
			}else{
				return Response::json(array('message'=>"Document not saved"));
			}

		}else return Redirect::route('home')->with('global', 'Please Sign In');
	}

	public function loadDoc($d_name){
		if (Auth::check()){
			$user = User::find(Auth::user()->id); 
			$doc = fopen('documents/'.$d_name, "r");
			// Read line by line until end of file
			$count = 0;
			while (!feof($doc)) { 

			// Make an array using comma as delimiter
			   $arrM[$count] = explode("\r\n",fgets($doc)); 
			   $count++;
			}

			$d_sName = substr($d_name, 0, -4);
			$document = Document::where('storage_name','=',$d_sName)->get()->first();
			$d_id = $document->id;
			$ann = Annotation::where('doc_id','=',$d_id)->get();
			$annotations = array();
			foreach ($ann as $a) {
			
				$annotations[$a->id] = array(
								"a_id" => $a->id,
								"a_text" => $a->a_text,
								"annotation" => $a->annotation,
								"tags" => $a->tags,
								"user_id" => $a->user_id,
								"userFn" => $user->firstnames,
								"userSn" => $user->surname,
								"paragraph_id"=>$a->paragraph_id);
			}
			$data = array("doc"=>  $arrM, "docName" =>$d_name, "annotations" =>$annotations);
			return View::make('document',$data);

		}else return Redirect::route('home')->with('global', 'Please Sign In');
	}
}
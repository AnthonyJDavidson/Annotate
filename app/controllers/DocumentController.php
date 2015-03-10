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
				// Make an array using return as delimiter
				$arrM[$count] = explode("\r\n",fgets($doc));
				$wordCount = 0;
				$noMorewords = false;
				while($noMorewords != true){
					$arrM[$count][$wordCount] = strstr($arrM[$count][0], ' ', true);
					if($arrM[$count][$wordCount] == NULL) $noMorewords = true;
					$wordCount++;
				}

				$count++;
			}

			$d_sName = substr($d_name, 0, -4);
			$document = Document::where('storage_name','=',$d_sName)->get()->first();
			$d_id = $document->id;
			$ann = Annotation::where('doc_id','=',$d_id)->get();
			$annotations = array();

			$all_tags = array(); // array to store all tags in a document ---MESSY--- New db Table?
			$all_Tags_index = 0;
			foreach ($ann as $a) {
				$ann_tags = array();//tags for current annotation (1 by 1)
				$tags = $a->tags; //tags in stored format "tag1, tag2" etc
				$moretags = true;
				$index = 0;
				while($moretags == true){
					$pos = strrpos($tags, ",");
					if($pos === true){
						$foundTag = substr($tags, 0, $pos - 1);
						$ann_tags[$index] = $foundTag;
						$index++;
						if(in_array($foundTag, $all_tags) ==false ){
							$all_tags[$all_Tags_index] = $foundTag;
							$all_Tags_index++;
						}
						$tags = substr($tags, $pos + 2, strlen($tags) - 1);
					}else{
						$ann_tags[$index] = $tags;//only 1 tag
						$moretags = false;
						if(in_array($tags, $all_tags) == false){
							$all_tags[$all_Tags_index] = $tags;
							$all_Tags_index++;
						}
					}
				}
				$annotations[$a->id] = array(
								"a_id" => $a->id,
								"a_text" => $a->a_text,
								"annotation" => $a->annotation,
								"tags" => $ann_tags,
								"user_id" => $a->user_id,
								"userFn" => $user->firstnames,
								"userSn" => $user->surname,
								"paragraph_id"=>$a->paragraph_id
								);
			}

			$data = array("doc"=>  $arrM, "docName" =>$d_name, "annotations" =>$annotations, "tags" => $all_tags);
			return View::make('document',$data);

		}else return Redirect::route('home')->with('global', 'Please Sign In');
	}
}
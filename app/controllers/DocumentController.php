<?php

class DocumentController extends BaseController {

	public function docUpload(){
			$user = User::find(Auth::user()->id); 
			if(!$user)return 'Please Log in';

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

			//Check if logo directory exists
			if(is_dir('documents')){
				/*if($filetype == "txt")*/ $result=file_put_contents('documents/'.$documentName.'.'.$filetype, base64_decode(str_replace("data:text/plain;base64,",'', $file)));
				//else if ($filetype == "docx")  $result=file_put_contents('documents/'.$documentName.'.'.$filetype, base64_decode(str_replace("data:text/plain;base64,",'', $file)));
				//else if ($filetype == "doc")  $result=file_put_contents('documents/'.$documentName.'.'.$filetype, base64_decode(str_replace("data:text/plain;base64,",'', $file)));
			}
			else{
				$old = umask(0);
				mkdir('documents', 0777);
				umask($old);
				/*if($filetype == "txt")*/ $result=file_put_contents('documents/'.$documentName.'.'.$filetype, base64_decode(str_replace("data:text/plain;base64,",'', $file)));
				//else if ($filetype == "docx")  $result=file_put_contents('documents/'.$documentName.'.'.$filetype, base64_decode(str_replace("data:text/plain;base64,",'', $file)));
				//else if ($filetype == "doc")  $result=file_put_contents('documents/'.$documentName.'.'.$filetype, base64_decode(str_replace("data:text/plain;base64,",'', $file)));
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
		}
}
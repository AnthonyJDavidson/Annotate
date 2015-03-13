<?php

class AnnotationController extends BaseController {

	public function saveAnnotation(){
		if (Auth::check()){
			$user = User::find(Auth::user()->id);
			$docName = Input::get('docName');
			$annotatedText = Input::get('annotatedText');
			$annotationText =  Input::get('annotationText');
			$annotationTag = Input::get('annotationTag');
			$paragraphId = Input::get('paragraphId');
			$line_id = Input::get('lineId');
			$wordsCovered = Input::get('wordsCovered');

			$document = Document::where('storage_name','=',$docName)->get()->first(); 
			$docId = $document->id;
			$annotation = New Annotation;
			$annotation->user_id= $user->id;
			$annotation->doc_id = $docId;
			$annotation->paragraph_id = $paragraphId;
			$annotation->line_id = $line_id;
			$annotation->words_Covered = $wordsCovered;
			$annotation->annotation = $annotationText;
			$annotation->a_text = $annotatedText;
			$annotation->tags = $annotationTag;
			$annotation->save();
			$newAnn = array(
				'new_u_id' => $annotation->user_id,
				'new_p_id' => $annotation->paragraph_id,
				'new_l_id' => $annotation->line_id,
				'new_ann' => $annotation->annotation,
				'new_a_text' => $annotation->a_text,
				'new_tags' => $annotation->tags,
				'new_a_id' => $annotation->id,
				'new_words' => $annotation->words_Covered
							);
			if($annotation->save()){
				return Response::json(array('message'=>"Annotation Saved",'newAnn'=>$newAnn));
			}else return Response::json("You are not the correct user", 500);
	  
        }else return Redirect::route('home')->with('global', 'Please Sign In');
	}

	public function deleteAnn(){
		if (Auth::check()){
			$user = User::find(Auth::user()->id);
			$annID = Input::get('annID');
			$annotation = Annotation::where('id','=',$annID)->get()->first();
			if($annotation->user_id == Auth::user()->id){
				$annotation->delete();
				return Response::json(array('message'=>"Annotation deleted"));
			}else {
				Redirect::route('home')->with('global', 'Wrong User');
			}
		}else return Redirect::route('home')->with('global', 'Please Sign In');
	}

	public function editAnnotation(){
		if (Auth::check()){
			$user = User::find(Auth::user()->id);
			$annID = Input::get('annChanged');
			$newAnn = Input::get('newAnnotation');
			$newT = Input::get('newTag');
			$annotation = Annotation::where('id','=',$annID)->get()->first();
			if($annotation->user_id == $user->id){
				$annotation->annotation = $newAnn;
				$annotation->tags = $newT;
				$annotation->save();
				return Response::json(array('message'=>"Annotation Edited"));
			}else Redirect::route('home')->with('global', 'Incorrect User id');
		}else return Redirect::route('home')->with('global', 'Please Sign In');
	}
}
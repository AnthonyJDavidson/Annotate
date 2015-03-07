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

			$document = Document::where('storage_name','=',$docName)->get()->first(); 
			$docId = $document->id;
			$annotation = New Annotation;
			$annotation->user_id= $user->id;
			$annotation->doc_id = $docId;
			$annotation->paragraph_id = $paragraphId;
			$annotation->annotation = $annotationText;
			$annotation->a_text = $annotatedText;
			$annotation->tags = $annotationTag;
			$annotation->save();
			if($annotation->save()){
				return Response::json(array('message'=>"Annotation Saved"));
			}else return Response::json(array('message'=>"Annotation not saved"));
	  
        }else return Redirect::route('home')->with('global', 'Please Sign In');
	}
}
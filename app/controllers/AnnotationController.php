<?php

class AnnotationController extends BaseController {

	public function createAnnotation(){
		$annot = Input::get('id');
		return Redirect::route('home')->with('global', $id);
	}
}
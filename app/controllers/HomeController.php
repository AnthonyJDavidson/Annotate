<?php

class HomeController extends BaseController {

	/*
	|--------------------------------------------------------------------------
	| Default Home Controller
	|--------------------------------------------------------------------------
	|
	| You may wish to use controllers instead of, or in addition to, Closure
	| based routes. That's great! Here is an example controller method to
	| get you started. To route to this controller, just add the route:
	|
	|	Route::get('/', 'HomeController@showWelcome');
	
	*/

	public function getIndex(){
		if (Auth::check()){
			$user = User::find(Auth::user()->id);
			$userGroups = UserGroup::where('user_id','=',$user->id)->get();
			$groups = array();
			foreach($userGroups as $uGroup){
				$groups[$uGroup->group_id] = Group::where('id','=',$uGroup->group_id)->get();
			}
			$documents = array();
			foreach ($groups as $group => $value){
				$documents[$group] = Document::where('group_id','=',$group)->get();
			}
			$data = array('groups'=>$groups,'documents'=>$documents);
			return View::make('myProfile',$data);

		}else return View::make('home');
	}
}
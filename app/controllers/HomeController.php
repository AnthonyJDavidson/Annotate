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
				//find all groups
				$groups[$uGroup->group_id] = Group::where('id','=',$uGroup->group_id)->get()->first();
			}
			$documents = array();
			$gs = array();
			foreach ($groups as $g){
				//find all correspondin documents
				$documents[$g->id] = Document::where('group_id','=',$g->id)->get();
				//sort groups for array to send back ($data)
				$gs[$g->id] = array('id' => $g->id, 'name' => $g->name);
				//above quicker/more intuitive way?
			}
			//Doc array for send back $data
			$ds = array();
			foreach ($documents as $doc){
				foreach ($doc as $d ) {
					$ds[$d->id] = array('id' => $d->id, 'group_id' => $d->group_id, "name" => $d->name,"storage_name" =>$d->storage_name);
				}
			}

			

			$data = array('groups'=>$gs,'documents'=>$ds);
			return View::make('myProfile',$data);

		}else return View::make('home');
	}
}
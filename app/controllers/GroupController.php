<?php

class GroupController extends BaseController {

	

	public function getEditGroup($g_id){
		if (Auth::user()->permission_level == 2){
			
			$group = Group::where('id','=',$g_id)->get()->first();
			$gInfo = array(
						'id' => $group->id,
						'name' => $group->name
						);
			$data = array('groupInfo'=>$gInfo);
			return View::make('editGroup',$data);

		}else return Redirect::route('home')
				->with('global', 'Insufficient permissions');
	}
}
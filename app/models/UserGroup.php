<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;
class UserGroup extends Eloquent {


	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'user_groups';
	protected $softDelete = true;


}

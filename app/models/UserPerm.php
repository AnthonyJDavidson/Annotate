<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;
class UserPerm extends Eloquent {


	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'user_perms';
	protected $softDelete = true;


}

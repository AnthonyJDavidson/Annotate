<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;
class Group extends Eloquent {


	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'groups';
	protected $softDelete = true;


}

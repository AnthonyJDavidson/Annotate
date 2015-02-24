<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;
class Annotation extends Eloquent {


	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'annotations';
	protected $softDelete = true;


}

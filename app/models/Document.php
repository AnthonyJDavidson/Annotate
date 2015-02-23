<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;
class Document extends Eloquent {


	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'documents';
	protected $softDelete = true;


}

<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;
class Document extends Eloquent {

	use SoftDeletingTrait;
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'documents';


}

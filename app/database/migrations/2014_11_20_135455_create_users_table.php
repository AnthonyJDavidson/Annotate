<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;


/* this is used by someone who would use the console to build all tables 
 (using artisan migrate) 
 For the purposes of this project I will be using pgAdmin in the browser from localhost/phpmyadmin
 */
class CreateUsersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		//
		schema::create('users', function(Blueprint $table){
			$table->increments('id');
			$table->string('name');
			$table->string('email');
			$table->softDeletes();
			$table->timestamp();
		});
	}
	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		//
		schema::drop('users');
	}

}

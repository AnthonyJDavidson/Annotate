<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/


Route::get('/', array('as' => 'home', 'uses' => 'HomeController@getIndex'));
Route::get('/home',array('as' => 'home', 'uses' => 'HomeController@getIndex'));

/* Route::get('/literature',function(){ return View::make('literature'); }); */
//Route::get('/literature',array('before' => 'auth', function(){ return View::make('literature'); })); 
//Route::get('/documentUpload',array('before' => 'auth', function(){ return View::make('documentUpload'); }));
Route::get('/about',function(){ return View::make('about'); });
Route::get('/account',array('as' => 'account', 'uses' => 'AccountController@getAccount'));
/*Route::get('/login',function(){ return View::make('login'); });*/

//TODO hide in admin functionality
// create new User
Route::get('/create',array('as' => 'account-create', 'uses' =>'UserController@getCreate'));
Route::post('create',array('as' => 'account-create-post', 'uses' =>'UserController@postCreate'));

// Activate Account
Route::get('activate/{code}',array('as' => 'account-activate', 'uses' => 'UserController@getActivate'));

//Sign In
Route::get('signIn', array('as' => 'account-signIn', 'uses' => 'UserController@getSignIn'));
Route::post('signIn', array('as' => 'account-signIn-post', 'uses' => 'UserController@postSignIn'));

//Sign Out
Route::get('signOut', array('before' => 'auth', 'as' => 'account-signOut', 'uses' => 'UserController@getSignOut'));

//Change Password
Route::get('changePassword', array('before' => 'auth', 'as'	=> 'changePassword', 'uses' => 'UserController@getChangePassword'));
Route::post('changePassword', array('before' => 'auth', 'as'	=> 'changePassword-post', 'uses' => 'UserController@postChangePassword'));

//Document Upload
Route::post('docUpload',array('as'=>'docUpload','uses'=>'DocumentController@docUpload'));

//Edit group page
Route::get('/editGroup{g_id}',array('as'=>'getEditGroup','uses'=>'GroupController@getEditGroup'));
Route::get('/doc-{d_name}',array('as'=>'getEditGroup','uses'=>'DocumentController@loadDoc'));
Route::post('/saveAnnotation',array('as'=>'saveAnnotation','uses'=>'AnnotationController@saveAnnotation'));
Route::post('/deleteAnn',array('as'=>'deleteAnn','uses'=>'AnnotationController@deleteAnn'));
Route::post('/editAnnotation',array('as'=>'deleteAnn','uses'=>'AnnotationController@editAnnotation'));
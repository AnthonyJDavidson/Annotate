<?php

class UserController extends BaseController {


	/* test function, useless */
	public function getUsers(){

		$users = User::find(1);
		$users->delete();

	}


	//Sign In/Out

	public function getSignIn(){
		return View::make('account.signIn');

	}

	public function postSignIn(){
		$validator = Validator::make(Input::all(),
			array(
				'email' => 'required|email',
				'password' => 'required',
			)
		);
		if($validator->fails()){
			return Redirect::route('account-signIn')->withErrors($validator)->withInput();
		}else{

			$remember = (Input::has('remember')) ? true : false;

			$auth = Auth::attempt(array(
				'email' => Input::get('email'),
				'password' => Input::get('password'),
				'active' => 1
				), $remember );
			if($auth){
				return Redirect::intended('/');
			}else{
				return Redirect::route('account-signIn')
					->with('global','Wrong email/password OR account not activated');
			}
		}
		return Redirect::route('account-signIn')
			->with('global','Problem signing in, have you activated your account?');
	}

	public function getSignOut(){
		Auth::logout();
		return Redirect::route('home');
	}


	//Change Password
	public function getChangePassword(){
		return View::make('account.changePassword');
	}

	public function postChangePassword(){
		$validator = Validator::make(Input::all(),
			array(
				'current_password' => 'required',			
				'new_password' => 'required|min:6',
				'password_again' => 'required|same:new_password'
			)
		);
		if($validator->fails()){
			return Redirect::route('changePassword')->withErrors($validator);
		}else{
			$user = User::find(Auth::user()->id);
			$curPassword = Input::get('current_password');
			$newPassword = Input::get('new_password');

			if(Hash::check( $curPassword, $user->getAuthPassword() ) ){ //match
				$user->password = Hash::make($newPassword);
				if($user->save()){
					return Redirect::route('home')->with('global','password changed');
				}
			}else{
				return Redirect::route('changePassword')->with('global','Current Password incorrect');
			}
		}

		return Redirect::route('changePassword')->with('global','Password could not be changed');
	}

	/* User Account Creation */

	//viewing create form
	public function getCreate(){
		return View::make('account.create');
	}

	//process form information
	public function postCreate(){
		$validator = Validator::make(Input::all(),
			array(
				'email' => 'required|email|unique:users',
				'firstnames' => 'required',
				'surname' => 'required',
				'password' => 'required|min:6',
				'password_again' => 'required|same:password'
			)

		);

		if($validator->fails()){
			//TODO
			//expand error feedback
			return Redirect::route('account-create')->withErrors($validator)->withInput();
		}else{
			$email = Input::get('email');
			$firstnames = Input::get('firstnames');
			$surname = Input::get('surname');
			$password = Input::get('password');

			//Activation Code
			$code =	str_random(60);

			$user = User::create(array(
				'email' => $email,
				'firstnames' => $firstnames,
				'surname' => $surname,
				'password' => Hash::make($password),
				'code' => $code,
				'active' => 0
			));

			if($user){
				//send email
				Mail::send('emails.auth.activate', 
					array(
						'link'=> URL::route('account-activate',$code), 
						'firstnames' => $firstnames, 
						'surname' => $surname),
					function( $message ) use ($user) {
					$message->to($user->email, $user->firstnames)->subject('Activate Your Account');
					});

				return Redirect::route('home')
				->with('global', 'Account Created, Email sent for activation');
			}
		}
	}

	// Account activation
	public function getActivate($code){
		$user = User::where('code', '=', $code)->where('active', '=', 0);
		if($user->count()){
			$user = $user->first();
			//activate
			$user->active = 1;
			$user->code = '';

			if($user->save()){
				return Redirect::route('home')
					->with('global','Activated');
			}

			return Redirect::route('home')
			->with('global','Could not activate account, contant admin');
		}
	}


}
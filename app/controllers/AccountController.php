<?php
class AccountController extends BaseController{






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
			// expand error feedback
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
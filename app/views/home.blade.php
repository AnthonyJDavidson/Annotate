@extends('layouts.main')

@section('content')
		<div class="page-content">
			<div id="homePage">
				<div class="homeTitle">Welcome to Annotate, the collaborative annotation tool</div>
				<br />
				<div id="loginTitle">Pleave Log in</div>
				<form action="{{ URL::route('account-signIn-post') }}" method="post">
					<span class="field">
						<span class="control-label">Email</span> <input type="text" name="email" {{ Input::old('email') ? 'value= "' . Input::old('email') . '"' : ''}} >
						@if($errors->has('email'))
							{{ $errors->first('email') }}

						@endif
					</span>

					<span class="field">
						<span class="control-label">Password</span> <input type="password" name="password">
						@if($errors->has('password'))
							{{ $errors->first('password') }}

						@endif
					</span>
					<div class="field">
						<input type="checkbox" name="remember" id="rembemer">
						<label for="remember">
							Remember Me
						</label>
					</div>

					<input type="submit" value="Sign In"> 	
					{{ Form::token() }}
				</form>
			</div>
		</div>

@stop
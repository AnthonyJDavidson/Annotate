@extends('layouts.main')

@section('content')

	<form action="{{ URL::route('changePassword-post') }}" method="post">
		
		<div class="field">
			Current Password: <input type="password" name="current_password">
			@if($errors->has('current_password'))
				{{ $errors->first('current_password') }}
			@endif	
		</div>
		<div>
			New Password:  <input type="password" name="new_password">
			@if($errors->has('new_password'))
				{{ $errors->first('new_password') }}
			@endif	
		</div>
		<div>
			Password Again:  <input type="password" name="password_again">
			@if($errors->has('password_again'))
				{{ $errors->first('password_again') }}
			@endif	
		</div>

		<input type="submit" value"Change Password">

		{{ Form::token()}}
	</form>
@stop
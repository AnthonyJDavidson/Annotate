@extends('layouts.main')

@section('content')

	<pre>{{ print_r($errors) }}</pre>

	<form action="{{ URL::route('account-create-post') }}" method="post">
		<div class="field">
			Email: <input type="text" name="email">
		</div>

		<div class="field">
			First Name(s): <input type="text" name="firstnames">
		</div>

		<div class="field">
			Surname: <input type="text" name="surname">
		</div>

		<div class="field">
			Password: <input type="password" name="password">
		</div>

		<div class="field">
			Password again: <input type="password" name="password_again">
		</div>

		<input type="submit" value="Create Account"> 	
		{{ Form::token() }}
	</form>

@stop
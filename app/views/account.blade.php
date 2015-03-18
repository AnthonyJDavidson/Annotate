@extends('layouts.main')

@section('content')
<div class="page-content">
	<div id="acc_Page">
		<div id="account_myGroups">
			<div class="homeTitle">My groups</div>
			@foreach($groups as $group)
				<div class="groupInfo">{{$group["name"]}}</div>
			@endforeach
		</div>
		<br />
		<div id="changePasswordForm">
			<div class="homeTitle">Change Password</div>
			<form action="{{ URL::route('changePassword-post') }}" method="post">
				
				<div class="cP_field">
					<span>Current Password </span><input type="password" name="current_password">
					@if($errors->has('current_password'))
						{{ $errors->first('current_password') }}
					@endif	
				</div>
				<div class="cP_field">
					<span>New Password </span><input type="password" name="new_password">
					@if($errors->has('new_password'))
						{{ $errors->first('new_password') }}
					@endif	
				</div>
				<div class="cP_field">
					<span>Password Again </span><input type="password" name="password_again">
					@if($errors->has('password_again'))
						{{ $errors->first('password_again') }}
					@endif	
				</div>
				<input type="submit" value"Change Password">

				{{ Form::token()}}
			</form>
		</div>
	</div>
</div>

@stop
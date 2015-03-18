@extends('layouts.main')

@section('content')
		<div class="page-content">
		<div id="editGroup">
				<div class="groupName">{{$groupInfo["name"]}}</div>
				<div id="createUser">
					<h2>Create User</h2>
					<!-- fix error feedback (late on in proj) <pre>{{ print_r($errors) }}</pre> !-->
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
							Password*: <input type="password" name="password">
						</div>

						<div class="field">
							Password again: <input type="password" name="password_again">
						</div>
						<span style="font-size: .9em">*Be Sure to make a note of this password to send to student</span>
						<br />

						<input type="submit" value="Create Account"> 	
						{{ Form::token() }}
					</form>
				</div>


				<div id="documentUpload">
					<div class="uploadDocument" data-group="{{$groupInfo["id"]}}">
						Upload A Document  
						<input type="file" name="file" id="uploadDoc"/><br>
					</div>
					
				</div>
			</div>
		</div>

@stop
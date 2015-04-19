@extends('layouts.main')

@section('content')
		<div class="page-content">
		<div id="editGroup">
				<div class="groupName">Edit Group</div>
				<div id="createUser">
					<h2>Create User</h2>
					<!-- <pre>{{ print_r($errors) }}</pre> !-->
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
						<div class="field">
							Please confirm Group: {{$groupInfo["name"]}} <input type="checkbox" name="groupId" value="{{$groupInfo["id"]}}">
						</div><br />
						<input type="submit" value="Create Account"> 	
						{{ Form::token() }}
					</form>
				</div>


				<div id="documentUpload">
					<div class="uploadDocument" data-group="{{$groupInfo["id"]}}">
						<h2>Upload A Document</h2>  
						<input type="file" name="file" id="uploadDoc"><br>
					</div>
					
				</div>
			</div>
		</div>

@stop
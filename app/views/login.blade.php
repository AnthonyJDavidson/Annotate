@extends('layouts.main')

@section('content')
		<div class="page-content">
			<div id="loginBase" class="bootstrapit">
				<span id="loginTitle">Please Log In</span>
					{{Form::open(array('url'=>'login','method'=>'post','id'=>'loginSubmit'))}}
					<div class="control-group">
						{{Form::label('inputEmail','Email',array('class'=>'control-label'))}}
						<div class="controls">

						{{--Form::text('email')--}}
						<?php echo Form::text('email',''); ?>
							<span class="help-inline">{{$errors->first('email')}}</span>
						</div>
					</div>
					<div class="control-group">
							{{Form::label('inputPassword','Password',array('class'=>'control-label'))}}
						<div class="controls">
							{{Form::password('password')}}
							<span class="help-inline">{{$errors->first('password')}}</span>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							{{Form::submit('Login',array('class'=>'btn'))}}
						</div>
					</div>
				{{Form::close()}}
			</div>
		</div>

@stop
<div id="navigation">
	<ul>	
		@if(Auth::check())
			<li><a href="home">Home</a></li>
			<li><a href="literature">Literature</a></li>
			<li><a href="{{ URL::route('changePassword')}}">Change Password</a></li> 
		@else

			<li><a href="home">Home</a></li>
			<li><a href="{{ URL::route('account-signIn')}}">Sign In</a></li>
			<!-- <li><a href="{{ URL::route('account-create')}}">Create</a></li> -->
			<li><a href="about">About</a></li>
		@endif
	</ul>
</div>


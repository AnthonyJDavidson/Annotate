<div id="navigation">
	<ul>	
		@if(Auth::check())
			<li><a href="home">Home</a></li>
			<li><a href="account">Account</a></li> 
		@else

			<li><a href="home">Home</a></li>
			<li><a href="about">About</a></li>
		@endif
	</ul>
</div>


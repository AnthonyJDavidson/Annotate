<div class="header">
	<span id="title">Annotate</span>
	@if(Auth::check())
		<span id="welcomeM">Hello, <span id="nameofUser">{{ Auth::user()->firstnames }} {{ Auth::user()->surname }}</span> <a href="{{ URL::route('account-signOut')}}">Sign Out</a></span>
	@else
		<span id="welcomeM">Not Signed In</span>
	@endif

	<span id="title_descrip">"Collaborative Annotation"</span>
</div>
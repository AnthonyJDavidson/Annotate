<div class="header">
			  <span id="title">Annotate</span>
			  @if(Auth::check())
			  	<span id="nameofUser">Hello, {{ Auth::user()->firstnames }} {{ Auth::user()->surname }} <a href="{{ URL::route('account-signOut')}}">Sign Out</a></span>
			  @else
			  	<span>Not Signed In</span>
			  @endif

			  <span id="title_descrip">A Collaborative Annotation Tool</span>
			</div>
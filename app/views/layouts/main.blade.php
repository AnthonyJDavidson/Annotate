
<html>
	<head>
		<title>Annotate</title>
		{{ HTML::style('css/style.css') }}
		{{ HTML::script('scripts/jquery-2.1.3.min.js')}}
		{{ HTML::style('css/annotator.min.css')}}
		{{ HTML::script('scripts/annotator-full.min.js')}}
		{{ HTML::script('scripts/mainScript.js')}}

	</head>
	<body>
		@if(Session::has('global'))
			<p> {{ Session::get('global') }} </p>
		@endif

		@include('layouts.header')
		@include('layouts.navigation')
		@yield('content')
		@include('layouts.footer')
	</body>
</html>
@extends('layouts.main')

@section('content')
		<div class="page-content">
		
			<div id="left_Col">
				<ul id="filters">
					<li>filter 1</li>
					<li>filter 2</li>
					<li>filter 3</li>
					<li>filter 4</li>
					<li>filter 5</li>

				</ul>
			</div>
			<div id="annotation_text" data-file="{{$docName}}"> 
				@foreach($doc as $d =>$value)
				<p id="paragraph{{$d}}">{{$value[0]}}</p>
				@endforeach
				
			</div>
		</div>

@stop
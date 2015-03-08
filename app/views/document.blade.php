@extends('layouts.main')

@section('content')
		<div class="page-content">
			<div>
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

			@foreach($annotations as $ann)
			<div class="annotationL">
				<span data-user="{{$ann["user_id"]}}">{{$ann["userFn"]}} {{$ann["userSn"]}}</span>
				<br />
				<span id="ann{{$ann["a_id"]}}" class="annotationList">Annotation: {{$ann["annotation"]}}</span>
				<br />
				<span id="annotatedText{{$ann["a_id"]}}" class="annotatedText">Related To: {{$ann["a_text"]}}</span>
				<br />
				<span id="tags{{$ann["a_id"]}}" class="annotationTag">Tags: {{$ann["tags"]}}</span>
				<br />
			</div>
			@endforeach
		</div>

@stop
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
					<div class="annotationTool">
						<textarea id="annotationInput" rows="4" cols="30" placeholder="Annotation"></textarea>
						<br />
						<textarea id="annotationTag" rows="1" cols="30" placeholder="Tag(s)" ></textarea>
						<br />
						<button type="button" id="button" class="cancelAnn">Cancel</button>
						<button type="button" class="saveAnn">Save</button>
					</div>
					<img id="commentImg" src="images/comment.png" height="20" width="20" alt="comment">
				</div>
			</div>

			@foreach($annotations as $ann)
			<div id="ann{{$ann["a_id"]}}" class="annotationL" data-paragraph="{{$ann["paragraph_id"]}}">
				<span data-user="{{$ann["user_id"]}}" class="annotation_user">{{$ann["userFn"]}} {{$ann["userSn"]}}</span>
				<br />
				<span>Annotation: </span>
				<span class="annotation_annotation">{{$ann["annotation"]}}</span>
				<br />
				<span>Related To: </span>
				<span class="annotation_annotatedText">{{$ann["a_text"]}}</span>
				<br />
				<span>Tags: </span>
				<span id="tags{{$ann["a_id"]}}" class="annotation_Tag">{{$ann["tags"]}}</span>
				<br />
			</div>
			@endforeach
		</div>

@stop
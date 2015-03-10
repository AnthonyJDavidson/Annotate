@extends('layouts.main')

@section('content')
		<div class="page-content">
			<div>
				<div id="left_Col">
					<ul id="filters">
						<div>Filters</div>
						<div>-By Annotation</div>
						@foreach($tags as $t)
						<li><input type="checkbox" name="show_tag" value="{{$t}}" checked="true">{{$t}}</li>
						@endforeach
						<br	/>
						<div>By User</div>
						<div>To Be Done</div>

					</ul>
				</div>
				<div id="annotation_text" data-file="{{$docName}}"> 
					@foreach($doc as $d =>$value)
						@for($i = 0;$i <= (sizeof($value) -1); $i++)
							<p id="paragraph{{$d}}">{{$value[$i]}}</p>
						@endfor
					@endforeach
					<div class="annotationTool">
						<textarea id="annotationInput" rows="4" cols="30" placeholder="Annotation"></textarea>
						<br />
						<textarea id="annotationTag" rows="1" cols="30" placeholder="Tag(s)" ></textarea>
						<br />
						<button type="button" id="button" class="cancelAnn">Cancel</button>
						<button type="button" class="saveAnn">Save</button>
					</div>
				</div>
			</div>
		</div>
		<div class="annotationList">
			@foreach($annotations as $ann)
			<div class="annotationL" id="ann{{$ann["a_id"]}}" data-paragraph="{{$ann["paragraph_id"]}}">
				<span data-user="{{$ann["user_id"]}}" class="annotation_user">{{$ann["userFn"]}} {{$ann["userSn"]}}</span>
				<br />
				<span>Annotation: </span>
				<span class="annotation_annotation">{{$ann["annotation"]}}</span>
				<br />
				<span>Related To: </span>
				<span class="annotation_annotatedText">{{$ann["a_text"]}}</span>
				<br />
				<span>Tags: </span>

				<span id="tags{{$ann["a_id"]}}" class="annotation_Tag">@foreach($ann["tags"] as $tag){{$tag}} @endforeach</span>
				
				<br />
			</div>
			@endforeach
		</div>

@stop
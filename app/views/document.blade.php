@extends('layouts.main')

@section('content')
		<div class="page-content">
			<div>
				<div id="left_Col">
					<ul class="filters" id="tagsFilter">
						<div>Filters</div>
						<div>-By Annotation</div>
						@foreach($tags as $t)
						<li><input type="checkbox" name="show_tag" value="{{$t}}" checked="true">{{$t}}</li>
						@endforeach
					</ul>
					<ul class="filters">
						<div>By User</div>
						<div>To Be Done</div>

					</ul>
				</div>
				<div id="annotation_text" data-file="{{$docName}}"> 
					@foreach($doc as $d =>$value)
						<p id="paragraph{{$d}}">
						@foreach($value[0] as $wID => $w)<span class="word{{$wID}}" data-annotation="" >{{$w}}</span><span class="wordSpace word{{$wID}}" data-annotation=""> </span>@endforeach</p>
					@endforeach
					<div class="annotationTool">
						<textarea id="annotationInput" rows="4" cols="30" placeholder="Annotation"></textarea>
						<br />
						<textarea id="annotationTag" rows="1" cols="30" placeholder="Tag1, tag2, etc." ></textarea>
						<br />
						<button type="button" id="button" class="cancelAnn">Cancel</button>
						<button type="button" class="saveAnn">Save</button>
					</div>
				</div>
			</div>
		</div>
		<div class="annotationList">
			@foreach($annotations as $ann)
			<div class="annotationL" id="ann{{$ann["a_id"]}}" data-paragraph="{{$ann["paragraph_id"]}}" data-words="{{$ann["wordsData"]}}">
				<span data-user="{{$ann["user_id"]}}" class="annotation_user">{{$ann["userFn"]}} {{$ann["userSn"]}}</span>
				<br />
				<span>Annotation: </span>
				<span class="annotation_annotation">{{$ann["annotation"]}}</span>
				<br />
				<span>Related To: </span>
				<span class="annotation_annotatedText">{{$ann["a_text"]}}</span>
				<br />
				<span>Tags: </span>
				<div id="tags{{$ann["a_id"]}}" >@foreach($ann["tags"] as $tag)<span class="annotation_Tag">{{$tag}} </span>@endforeach</div>
				
				<br />
			</div>
			@endforeach
		</div>

@stop
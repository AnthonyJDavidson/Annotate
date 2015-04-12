@extends('layouts.main')

@section('content')
        <div class="page-content">
            <div id="annotationsDiv">
                <div id="left_Col" class="mCustomScrollbar">
                    <ul class="filters" id="tagsFilter">
                    	<h3 style="font-weight: bold">Layout</h3>
                    	<img class="align" id="ta_left" src="images/ta_left.png" height="25" width="25" alt="left">
                    	<img class="align" id="ta_center" src="images/ta_center.png" height="25" width="25" alt="center">
                    	<img class="align" id="ta_right" src="images/ta_right.png" height="25" width="25" alt="right">
                        <h3 style="font-weight: bold">Filters</h3>
                        <div><input type="checkbox" id="hideAnnotations" value="hideAnn">Hide all</div>
                        <h4 style="font-weight: bold">-By Tag</h4>
                        @foreach($tags as $t)
                        <li><input type="checkbox" class="hideMe" value="{{$t}}" checked="true">{{$t}}</li>
                        @endforeach
                    </ul>
                    <ul class="filters"  id="userNameFilter">
                        <h4 style="font-weight: bold">-By User</h4>
                        <span style="font-size: 12px">*** denotes Mentor</span>
                        @foreach($userNames as $uN)
                        <li><input type="checkbox" class="hideUser" value="{{$uN["id"]}}" checked="true">{{$uN["name"]}}@if($uN["perm"] == 2) ***@endif</li>
                        @endforeach
                    </ul>
                </div>
                <div id="annotationDiv">
	                <div id="annotation_text"  class="mCustomScrollbar" data-file="{{$docName}}"> 
	                    <div id="nameOfText">{{$nameofDoc}}</div>
	                    <br />
	                    @foreach($doc as $paragraph =>$lines)
	                        <div id="paragraph{{$paragraph}}">
	                        @foreach($lines as $l => $words)
	                            <div class="line{{$l}}" data-linewordcount="{{sizeof($words)}}">@foreach($words as $w =>$word)<span class="word{{$w}}" data-annotation="" data-perm="0">{{$word}}</span><span class="wordSpace word{{$w}}" data-annotation="" data-perm="0"> </span>@endforeach</div>
	                        @endforeach
	                        </div>
	                        <br />
	                    @endforeach
	                </div>
	            </div>
            </div>
            <div id="annotationStats">
            	<span class="a_stats" id="stats_annotators">Annotators: 0</span>
		    	<span class="a_stats" id="stats_annotations" >Annotations: 0</span>
		    	<span class="a_stats" id="stats_nested">My Annotations: 0</span>
		    	<span class="a_stats" id="stats_tags">Tags: 0</span>
	    	</div>
	    </div>
	    <div class="annotationList">
	    	<div class="homeTitle myProfileTitle" style="text-align:center">Annotation List</div>
	    	<br />
            @foreach($annotations as $ann)
            <div class="annotationL" id="ann{{$ann["a_id"]}}" data-paragraph="{{$ann["paragraph_id"]}}" data-line="{{$ann["line_id"]}}" data-words="{{$ann["wordsData"]}}">
                @if($curUser == $ann["user_id"] )
                <img class="deleteAnn" src="images/cancel.png" height="12" width="12" alt="can">
                <img class="editAnn" src="images/edit.png" height="12" width="12" alt="edt">
                @endif
                <span data-perm="{{$ann["perm"]}}" data-user="{{$ann["user_id"]}}" class="annotation_user" id="userNameAnnotation">{{$ann["userN"]}}</span>
                <br />
                <span>Annotation: </span>
                <span class="annotation_annotation">{{$ann["annotation"]}}</span>
                <br />
                <div>Related To: </div>
                <span class="annotation_annotatedText">{{$ann["a_text"]}}</span>
                <br />
                <span>Tag: </span>
                <span id="tags{{$ann["a_id"]}}" >@foreach($ann["tags"] as $tag)<span class="annotation_Tag">{{$tag}}</span>@endforeach</span><br />

            </div>
            @endforeach
	       </div>
	    <div class="annotationTool">
	        <textarea id="annotationInput" rows="4" cols="30" placeholder="Annotation"></textarea>
	        <br />
	        Choose A Tag
	        <select id="tagSelection">
	        </select>
	        <br />
	        <textarea id="annotationTag" rows="1" cols="30" placeholder="Add a new Tag"></textarea>
	        <br />
	        <button type="button" id="button" class="cancelAnn">Cancel</button>
	        <button type="button" class="saveAnn">Save</button>
	    </div>


@stop
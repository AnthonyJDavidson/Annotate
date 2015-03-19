@extends('layouts.main')

@section('content')
        <div class="page-content">
            <div id="annotationsDiv">
                <div id="left_Col" class="mCustomScrollbar">
                    <ul class="filters" id="tagsFilter">
                        <h3 style="font-weight: bold">Filters</h3>
                        <div><input type="checkbox" id="hideAnnotations" value="hideAnn">Hide all</div>
                        <h4 style="font-weight: bold">-By Tag</h4>
                        @foreach($tags as $t)
                        <li><input type="checkbox" class="hideMe" value="{{$t}}" checked="true">{{$t}}</li>
                        @endforeach
                    </ul>
                    <ul class="filters"  id="userNameFilter">
                        <h4 style="font-weight: bold">-By User</h4>
                        @foreach($userNames as $uN)
                        <li><input type="checkbox" class="hideUser" value="{{$uN["id"]}}" checked="true">{{$uN["name"]}}</li>
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
	                            <div class="line{{$l}}" data-linewordcount="{{sizeof($words)}}">@foreach($words as $w =>$word)<span class="word{{$w}}" data-annotation="" >{{$word}}</span><span class="wordSpace word{{$w}}" data-annotation=""> </span>@endforeach</div>
	                        @endforeach
	                        </div>
	                        <br />
	                    @endforeach
	                </div>
	            </div>
            </div>
	    </div>
	    <div class="annotationList ">
	    	<h4 style="text-align: center">Annotation List</h4>
            @foreach($annotations as $ann)
            <div class="annotationL" id="ann{{$ann["a_id"]}}" data-paragraph="{{$ann["paragraph_id"]}}" data-line="{{$ann["line_id"]}}" data-words="{{$ann["wordsData"]}}">
                <span data-user="{{$ann["user_id"]}}" class="annotation_user" id="userNameAnnotation">{{$ann["userN"]}}</span>
                <br />
                <span>Annotation: </span>
                <span class="annotation_annotation">{{$ann["annotation"]}}</span>
                <br />
                <div>Related To: </div>
                <span class="annotation_annotatedText">{{$ann["a_text"]}}</span>
                <br />
                <span>Tag:</span>
                <span id="tags{{$ann["a_id"]}}" >@foreach($ann["tags"] as $tag)<span class="annotation_Tag">{{$tag}}</span>@endforeach</span><br />
                <button type="button" class="editAnn">Edit</button>
                <button type="button" class="deleteAnn">Delete</button>
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
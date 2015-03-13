@extends('layouts.main')

@section('content')
        <div class="page-content">
            <div>
                <div id="left_Col">
                    <ul class="filters" id="tagsFilter">
                        <div>Annotation Filters</div>
                        <div><input type="checkbox" id="hideAnnotations" value="hideAnn">Hide all</div>
                        <div>-By Tag</div>
                        @foreach($tags as $t)
                        <li><input type="checkbox" name="show_tag" value="{{$t}}" checked="true">{{$t}}</li>
                        @endforeach
                    </ul>
                    <ul class="filters"  id="userNameFilter">
                        <div>-By User</div>
                        @foreach($userNames as $uN)
                        <li><input type="checkbox" name="show_tag" value="{{$uN["id"]}}" checked="true">{{$uN["name"]}}</li>
                        @endforeach
                    </ul>
                </div>
                <div id="annotation_text" data-file="{{$docName}}"> 
                    <h3>{{$nameofDoc}}</h3>
                    @foreach($doc as $paragraph =>$lines)
                        <div id="paragraph{{$paragraph}}">
                        @foreach($lines as $l => $words)
                            <div class="line{{$l}}" data-linewordcount="{{sizeof($words)}}">@foreach($words as $w =>$word)<span class="word{{$w}}" data-annotation="" >{{$word}}</span><span class="wordSpace word{{$w}}" data-annotation=""> </span>@endforeach</div>
                        @endforeach
                        </div>
                        <br />
                    @endforeach
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
                </div>
            </div>
        </div>
        <div class="annotationList">
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
                <span id="tags{{$ann["a_id"]}}" >@foreach($ann["tags"] as $tag)<span class="annotation_Tag">{{$tag}} </span>@endforeach</span><br />
                <button type="button" class="editAnn">Edit</button>
                <button type="button" class="deleteAnn">Delete</button>
                <br />
            </div>
            @endforeach
        </div>

@stop
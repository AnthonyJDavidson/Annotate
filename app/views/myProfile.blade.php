@extends('layouts.main')

@section('content')
<div class="page-content">
	<div id="myProfile" class="mCustomScrollbar">
		<br />
		<div class="homeTitle myProfileTitle">My Groups</div>
		@foreach($groups as $group)
		<div class="groupName">{{$group["name"]}}	
				@if(Auth::user()->permission_level == 2)
					<a href="editGroup{{$group["id"]}}">Edit</a>
				@endif
		</div>
		<br />
		<div class="groupInfo">
			<div>Available Documents</div>
			<div>
				@foreach($documents as $doc)
					@if($doc["group_id"] == $group["id"]) 
						<div class"docName" id="g{{$group["id"]}}d{{$doc["id"]}}"><a href="doc-{{$doc["storage_name"]}}.{{$doc["filetype"]}}">{{$doc["name"]}}</a></div>
					@endif
				@endforeach
			
			</div>
		</div>
		<br />
		@endforeach
		
	</div>
</div>

@stop
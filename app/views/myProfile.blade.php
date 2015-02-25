@extends('layouts.main')

@section('content')
		<div class="page-content">
			<div id="myProfile">
				<h1>My Groups</h1>
				@foreach($groups as $group)
				<h2>{{$group["name"]}}	
						@if(Auth::user()->permission_level == 2)
							<a href="editGroup{{$group["id"]}}">Edit</a>
						@endif
				</h2>
				<table>
					<thead>
						<tr>
							<th class="tHead">Available Documents</th>
						</tr>
					</thead>
					<tbody>
							@foreach($documents as $doc)
								@if($doc["group_id"] == $group["id"])
									<tr> 
										<td class"docName" id="g{{$group["id"]}}d{{$doc["id"]}}" data="{{$doc["storage_name"]}}"> {{$doc["name"]}} </td>
										
									</tr>
								@endif
							@endforeach
					
					</tbody>
				</table>
				@endforeach
				
			</div>
		</div>

@stop
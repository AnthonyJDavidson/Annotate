@extends('layouts.main')

@section('content')
		<div class="page-content">
			<div id="myProfile">
			@foreach($groups as $group)
				{{$group}}
				@endforeach
				<table>
					<thead>
						<tr>
							<th class="tHead">Name</th>
							<th class="tHead">Name</th>
							<th class="tHead">Name</th>
							<th class="tHead">Name</th>
							<th class="tHead">Name</th>
						</tr>
					</thead>
					<tbody>
							<tr> 
								<td class="text-info"> Item</td>
								<td class="text-info"> Item</td>
								<td class="text-info"> Item</td>
								<td class="text-info"> Item</td>
								<td class="text-info"> Item</td>
							</tr>

							<tr> 
								<td class="text-info"> Item</td>
								<td class="text-info"> Item</td>
								<td class="text-info"> Item</td>
								<td class="text-info"> Item</td>
								<td class="text-info"> Item</td>
							</tr>
					
					</tbody>
				</table>
				
			</div>
		</div>

@stop
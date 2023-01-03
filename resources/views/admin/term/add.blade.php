@extends('layouts.admin')
@section('content')
<div class="content-wrapper">
<section class="content">
			<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
				@if(session()->has('errors'))
                 <div class="alert alert-danger">
                     {{ session()->get('errors') }}
                 </div>
              @endif	
               @if(session()->has('success'))
                 <div class="alert alert-success">
                     {{ session()->get('success') }}
                 </div>
              @endif
			<div class="card card-default">
				<!-- <div class="card-header">
				  <h3 class="card-title">Update</h3> 
				</div> -->
				
				<form role="form" action="{{url('about')}}" method="post">
				  @csrf	
				  <input type="hidden" name="type" value="2">
				  <input type="hidden" name="id" value="{{$terms->id}}">
				  <div class="card-body">
				    <div class="form-group">
				      <label for="title">Title</label>
				      <input type="text" class="form-control" id="title" name="title" value="{{$terms->title}}" placeholder="Enter Title">
				    </div>
				    <div class="form-group">
				      <label for="description">Description</label><br/>
				      <textarea name="description" class="form-control" id="description" rows="5" placeholder="Enter Description">{{$terms->description}}</textarea>
				    </div>
				  </div>
				  <div class="card-footer update-content">
				    <button type="submit" class="btn btn-primary">Update</button>
				  </div>
				</form>
			</div>
			</div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
</div>

@endsection
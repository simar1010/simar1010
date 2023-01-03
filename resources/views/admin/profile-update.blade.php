@extends('layouts.admin')
@section('content')
<div class="content-wrapper">
<section class="content">
      <div class="container-fluid">
      <div class="row">
        <div class="col-md-6">
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
        <div class="card-header">
          <h3 class="card-title">Update</h3>
        </div>
        
        <form class="form-horizontal p-3" method="POST" action="{{url('profile-update')}}">
          @csrf
            <div class="form-group row">
              <label for="inputName" class="col-sm-2 col-form-label">Name</label>
              <div class="col-sm-10">
                <input type="name" name="name" class="form-control" value="{{Auth::user()->name}}" id="inputName" placeholder="Name">
              </div>
            </div>
            <div class="form-group row">
              <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
              <div class="col-sm-10">
                <input type="email" class="form-control" name="email" id="inputEmail" value="{{Auth::user()->email}}" placeholder="Email" readonly>
              </div>
            </div>
            <div class="form-group row">
              <label for="phone_no" class="col-sm-2 col-form-label">Phone No</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="phone_no" id="phone_no" value="{{Auth::user()->phone_no}}" placeholder="Enter Phone">
              </div>
            </div>
            <div class="form-group row">
              <div class="offset-sm-2 col-sm-10">
                <button type="submit" class="btn btn-danger">Submit</button>
              </div>
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
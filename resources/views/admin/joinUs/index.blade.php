@extends('layouts.admin')
@section('content')
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Join Us</h1>
        </div><!-- /.col -->      
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                @if(session()->has('success'))  
                 <div class="alert alert-success">
                     {{ session()->get('success') }}
                 </div>
                 @endif
                <table class="table table-hover text-nowrap"> 
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Email</th>
                      <th>Company</th>
                      <th>URL</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody> 
                     <?php $i = 0;?>

                    @foreach($joinus as $k => $user)
                    <tr>

                      <?php $i++ ?>
                      <td>{{$k + $joinus->firstItem()}}</td>
                      <!-- <td>{{$user->name}}</td> -->
                      <td>{{$user->email}}</td>
                      <td>{{$user->company}}</td>
                      <td>{{$user->weburl}}</td>
                      <td>
                        @if($user->status == 0)
                        <a href="/joinus/changestatus/{{$user->id}}" onclick="return confirm('Are  you want to change join us status?');"><input type="submit" class="btn btn-xs btn-success" value="Resolve"></a></td>
                          @else
                          <a href="/joinus/changestatus/{{$user->id}}" onclick="return confirm('Are you want to change join us status?');"><input type="submit" class="btn btn-xs btn-warning" value="New"></a></td>
                        @endif
                      </td>
                    </tr>
                    @endforeach
                  </tbody>
                </table>
                <div class="paginationn">{{ $joinus->links() }} </div>
              </div>
            </div>
          </div>
        </div>



    </div>
  </section>
</div>
@endsection

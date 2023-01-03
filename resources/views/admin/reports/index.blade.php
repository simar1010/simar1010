@extends('layouts.admin')
@section('content')
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2 title-filter">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Users</h1>
        </div><!-- /.col -->
        <div class="col-sm-6 filters">
           <form method="GET" id="report_form" action="{{url('reports')}}">
                  <input type="hidden" name="page" value="{{$page}}">
                  <input type="hidden" name="startDate" value="{{$startDate}}" id="startDate">
                  <input type="hidden" name="endDate" value="{{$endDate}}" id="endDate">
                  <input type="text" class="srch" name="daterange" value="" />
                  
                  <!-- <input type="submit" class="clr" value="Clear"> -->
                 <!--  <input type="submit"  class="search" value="Search"> -->
                </form> 
        </div>
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">
      <!-- Small boxes (Stat box) -->


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
                      <th>Name</th>
                      <th>Email</th>
                      <th>Phone</th>
                      <th>Status</th>
                      <th>Created At</th>
                    </tr>
                  </thead>
                  <tbody>
                     <?php $i = 0;?>
                  @if(count($users) > 0)
                    @foreach($users as $k=> $user)
                    <tr>
   
                      <?php $i++ ?>
                      <td>{{$k + $users->firstItem()}}</td>
                      <td>{{$user->name}}</td>
                      <td>{{$user->email}}</td>
                      <td>{{$user->phone_no}}</td>
                      <td>
                        @if($user->status == 0)
                            <button class="btn btn-xs btn-danger">Inactive</button>
                          @else
                          <button class="btn btn-xs btn-success">Active</button>
                        @endif
                      </td>
                      <td>{{$user->created_at}}</td>
                    </tr>
                    @endforeach
                  @else
                  <tr>
                    <td colspan="5" class="text-center">No Record Found</td>
                  </tr>
                  @endif
                  </tbody>
                </table>
                <div class="paginationn">{{ $users->links() }} </div>
              </div>
            </div>
          </div>
        </div>



    </div>
  </section>
</div>

@section('scripts')
@parent
<script>
$(function() {



  @if(!empty($startDate))
  var startDate = "{{$startDate}}";
  @else
  var startDate = moment().add(-30, 'day');
  @endif

  @if(!empty($endDate))
  var endDate = "{{$endDate}}";
  @else
  var endDate = moment();
  @endif

  $('input[name="daterange"]').daterangepicker({
      //autoUpdateInput: autoUpdateInput,
      locale: {
          cancelLabel: 'Clear',
          format: 'YYYY-MM-DD'
      },
      startDate: startDate,
      endDate: endDate
  });

  $('input[name="daterange"]').on('apply.daterangepicker', function(ev, picker) {

    $("#startDate").val(picker.startDate.format('YYYY-MM-DD'));
    $("#endDate").val(picker.endDate.format('YYYY-MM-DD'));

    $(this).val(picker.startDate.format('YYYY-MM-DD') + ' to ' + picker.endDate.format('YYYY-MM-DD'));

    $("#report_form").submit();
  });

  $('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
  });

});
</script>
@endsection

@endsection
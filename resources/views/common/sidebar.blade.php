<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="{{url('/dashboard')}}" class="brand-link" style="color:#000;">
    <img src="{{asset('backend/dist/img/logo.png')}}" alt="Logo" class="brand-image img-circle "
         style="opacity: .8">
    <span class="brand-text font-weight-light" ></span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item">
          <a href="{{url('/dashboard')}}" class="nav-link">
            <i class="nav-icon fas fa-tachometer-alt"></i>
            <p>Dashboard</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="{{url('users')}}" class="nav-link">
            <i class="nav-icon fas fa-user"></i>
            <p>Users</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="{{url('joinus')}}" class="nav-link">
            <i class="nav-icon fas fa-user"></i>
            <p>JoinUs</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="{{url('about')}}" class="nav-link">
            <i class="nav-icon fas fa-file"></i>
            <p>AboutUs</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="{{url('privacy')}}" class="nav-link">
            <i class="nav-icon fas fa-file"></i>
            <p>Privacy Policy</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="{{url('reports')}}" class="nav-link">
            <i class="nav-icon fas fa-user"></i>
            <p>Reports</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="{{url('term')}}" class="nav-link">
            <i class="nav-icon fas fa-file"></i>
            <p>Terms and Conditions</p>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>

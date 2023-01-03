<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class DashboardController extends Controller
{
    public function __construct(){
        $this->middleware('is_admin');
    }

    public function index(Request $request){
        $data['user_count'] = User::where('is_admin','!=',1)->count();
        return view('admin.dashboard',compact('data'));
    }
}
 
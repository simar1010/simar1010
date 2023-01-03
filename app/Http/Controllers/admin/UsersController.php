<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Validator;

class UsersController extends Controller
{
  public function index(Request $request){
      $users = User::where('is_admin','!=',1)->latest()->paginate(10);
        $lastpage = $users->lastPage();
        $page = $request->page;
        if ($page>$lastpage) {
          return redirect()->back();
        };

        

      return view('admin.user.index')->with('users',$users);
  }
  public function changestatus($id){

        $user = User::find($id);
        if($user->status == 0){
          $user->status = 1;

        }else{
          $user->status = 0;
        }
        $user->save();
        return redirect('/users')->with('status', 'Profile updated!');
  }

  public function profileUpdate(Request $request){
      if($request->isMethod('post')){
          $validator = Validator::make($request->all(), [
          'name' => 'required',
          'phone_no' => 'digits_between:10,15',
      ]);

      if($validator->fails()){
            return redirect()->back()->with('errors',$validator->errors()->first());
      }
       $user = User::find(auth()->user()->id);
       $user->name = $request->name;
       $user->phone_no = $request->phone_no;
       $user->save();
       return redirect('profile-update')->with('success' , "Profile updated successfully");
    }
    return view('admin.profile-update');
  }
}

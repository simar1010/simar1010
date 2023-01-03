<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\JoinUs;

class JoinUsController extends Controller
{
    public function index(Request $request)
    {
        $joinus = JoinUs::latest()->paginate(10);

        $lastpage = $joinus->lastPage();
        $page = $request->page;
        if ($page>$lastpage) {
          return redirect()->back();
        };

        return view('admin.joinUs.index',compact('joinus'));
    }

    public function joinUsStatus(Request $request,$id)
    {
        $joinus = JoinUs::find($id);
        if($joinus->status == 0){
          $joinus->status = 1;

        }else{
          $joinus->status = 0;
        }
        $joinus->save();
        return redirect('/joinus')->with('status', 'status updated');
    }
}

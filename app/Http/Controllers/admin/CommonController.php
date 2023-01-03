<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Common;
use Validator;

class CommonController extends Controller
{
    public function index(Request $request)
    {
            if($request->isMethod('post')){
                $validator = Validator::make($request->all(), [
                'title' => 'required',
                'description' => 'required',
            ]);

            if($validator->fails()){
                  return redirect()->back()->with('errors',$validator->errors()->first());
            }
            $aboutUs = Common::where('id',$request->id)->first();
            $aboutUs->title = $request->title;
            $aboutUs->description = $request->description;
            $aboutUs->save();
            if ($request->type == 1) {
               return redirect('privacy')->with('success','Privacy  updated successfully'); 
            }elseif ($request->type == 2) {
               return redirect('term')->with('success','Term and condition updated successfully');
            }else{
               return redirect('about')->with('success','About us updated successfully');
            }
        }
        $aboutUs = Common::where('type',3)->first();
        return view('admin.about.add',compact('aboutUs'));
    }


    public function privacy(Request $request)
    {
        // if($request->isMethod('post')){
        //         $validator = Validator::make($request->all(), [
        //         'title' => 'required',
        //         'description' => 'required',
        //     ]);

        //     if($validator->fails()){
        //           return redirect()->back()->with('errors',$validator->errors()->first());
        //     }
        //     $privacies = Common::where('id',$request->id)->first();
        //     $privacies->title = $request->title;
        //     $privacies->description = $request->description;
        //     $privacies->save();
        //     return redirect('privacy')->with('success','Privacy  updated successfully');
        // }
        $privacies = Common::where('type',1)->first();
        return view('admin.privacy.add',compact('privacies'));
    }


    public function term(Request $request)
    {
        // if($request->isMethod('post')){
        //         $validator = Validator::make($request->all(), [
        //         'title' => 'required',
        //         'description' => 'required',
        //     ]);

        //     if($validator->fails()){
        //           return redirect()->back()->with('errors',$validator->errors()->first());
        //     }
        //     $terms = Common::where('id',$request->id)->first();
        //     $terms->title = $request->title;
        //     $terms->description = $request->description;
        //     $terms->save();
        //     return redirect('term')->with('success','Term and condition updated successfully');
        // }
        $terms = Common::where('type',2)->first();
        return view('admin.term.add',compact('terms'));
    }
}

<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Common;
use App\Models\JoinUs;
use Validator;

class CommonController extends Controller
{
    // privacy policy
    public function privacyPolicy(){
        $privacypolicy = Common::where('type',1)->first();
        return response()->json(['success' => true, 'data' => $privacypolicy,'message'=>'Privacy policy']);
    }
    
    // term and condition 
    public function termCondition(){
        $term = Common::where('type',2)->first();
        return response()->json(['success' => true, 'data' => $term,'message'=>'Term and condition']);
    }

    // about us
    public function aboutUs(){
        $aboutUs = Common::where('type',3)->first();
        return response()->json(['success' => true, 'data' => $aboutUs,'message'=>'About us']);
    }
    
    // join us 
    public function joinUs(Request $request){
        $validator = Validator::make($request->all(), [
          'email' => 'required',
          'company' => 'required',
          'weburl' => 'required',
        ]);
        if($validator->fails()){ 
            return response()->json(['status' => false,'message' => $validator->errors()->first(),'data'=>null],409);  
        } 

        $joinus = JoinUs::where(['user_id' => Auth::user()->id])->first();
        if($joinus){
           $joinus->email = $request->email;
           $joinus->weburl = $request->weburl;
           $joinus->company = $request->company;
           $joinus->user_id = Auth::user()->id;
           $joinus->save();
            
        }else{
            $join = new JoinUs;
            $join->email = $request->email;
            $join->weburl = $request->weburl;
            $join->company = $request->company;
            $join->user_id = Auth::user()->id;
            $join->save();
        }
        $details = [
            'title' => 'Mail from tripplnr.com',
            'body' => 'This is for welcome email'
        ];
        $AdminDetails = $request->all();
        \Mail::to($request->email)->send(new \App\Mail\MyWelcomeMail($details));
        \Mail::to('Info@tripplnr.com')->send(new \App\Mail\AdminJoinUsMail($AdminDetails));
        $msg = "Thanks for joining us.";
        return response()->json(['status' => true,'message'=>$msg, 'data' => []]);
    }
}

<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Validator;
use DB;


class AuthController extends Controller
{
    // signup
    public function register(Request $request){
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required'
        ]);

        if($validator->fails()){
              return response()->json(['success' => false,'data'=>[],'message' => $validator->errors()->first()]);
        }
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $user['token'] =  $user->createToken('triplnr')->plainTextToken;
        $user['name'] =  $user->name;
        return response()->json(['success' => true, 'data' => $user,'message'=>'User register successfully.']);
    }
    
    // login
    public function login(Request $request){
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
            $user = Auth::user();
            DB::table('personal_access_tokens')->where('tokenable_id',$user->id)->delete();
            if ($user->status == 1) {
                $user['token'] =  $user->createToken('triplnr')->plainTextToken;
                $user['name'] =  $user->name;
                return response()->json(['success' => true, 'data' => $user,'message'=>'User login successfully.']);
             }else{
                return response()->json(['success' => false, 'data' => [],'message'=>'User deactivate by admin. Please connect admin for more details.']);
             } 
            
        }else{
            return response()->json(['success' => false, 'data' => [],'message'=>'Please enter valid credentials.']);
        }
    }

    // social login 
    public function socialLogin(Request $request){
        $validator = Validator::make($request->all(), [
          'email' => 'required|email',
          'social_id' => 'required',
          'social_type' => 'required',
          ]);
        if($validator->fails()){ 
            return response()->json(['status' => false,'message' => $validator->errors()->first(),'data'=>null],409);  
        }
        $user = User::where('email', $request->email)->orWhere('social_id', $request->social_id)->first();
        $social_status = "";
          if($user){
            if ($user->status == 1) {
              DB::table('personal_access_tokens')->where('tokenable_id',$user->id)->delete();  
              $user->update([
                  'name' => $request->name,  
                  'email' => $request->email,
                  'social_id' => $request->social_id,  
                  'social_type' => $request->social_type
              ]);
              $msg = "User login successfully.";
              $user['token'] =  $user->createToken('triplnr')->plainTextToken;
            }else{
               return response()->json(['status' => false,'message'=>'User deactivate by admin. Please connect admin for more details.', 'data' => null],409);
            }
          }else{ 
            $msg = "User login successfully";
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'social_id' => $request->social_id,
                'social_type' => $request->social_type
            ]);
            $user['token'] =  $user->createToken('triplnr')->plainTextToken;
          }
        return response()->json(['status' => true,'message'=>$msg, 'data' => $user]);
    }

    // profile update
    public function profileUpdate(Request $request){
       $validator = Validator::make($request->all(), [
          'phone_no' => 'required|min:10|numeric',
          'name' => 'required',
          ]);
        if($validator->fails()){ 
            return response()->json(['status' => false,'message' => $validator->errors()->first(),'data'=>null],409);  
        } 

        $user = User::where(['id' => Auth::user()->id])->first();
        if ($user) {
           $user->phone_no = $request->phone_no;
           $user->name = $request->name;
           $user->save();
        }else{
            $msg = "User not found";
            $user = [];
        }
        $msg = "User updated successfully.";
        return response()->json(['status' => true,'message'=>$msg, 'data' => $user]);
    }

    // logout
    public function logout(Request $request){
        auth()->user()->tokens()->delete();
        return response()->json(['message' => 'User successfully logged out','success' => true, 'data' => [],]);
    }
}

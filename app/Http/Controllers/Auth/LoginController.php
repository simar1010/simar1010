<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    //protected $redirectTo = RouteServiceProvider::HOME;


    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    
    // multiauth login
    public function login(Request $request){   
        $input = $request->all();
   
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required',
        ]);
   
        if(auth()->attempt(array('email' => $input['email'], 'password' => $input['password']))){
            if (auth()->user()->is_admin == 1) {
                return redirect('dashboard');
            }else{
                Auth::logout();
                return redirect()->route('login')->with('error','Invalid user.');
                // if(Auth::user()->status == 1){
                //     return redirect()->route('home');
                // }else{
                //     Auth::logout();
                //     return redirect()->route('login')->with('error','User deactivate by admin. Please connect admin for more details.'); 
                // }
            }
        }else{
            return redirect()->route('login')->with('error','Please enter valid credentials..');
        }
          
    }

    public function logout(Request $request) {
      Auth::logout();
      return redirect('/login');
    }


}

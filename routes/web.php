<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('login');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::middleware('is_admin')->group( function () {
   Route::get('/dashboard', [App\Http\Controllers\admin\DashboardController::class, 'index']);
   Route::get('/users', [App\Http\Controllers\admin\UsersController::class, 'index']);
   Route::any('/profile-update', [App\Http\Controllers\admin\UsersController::class, 'profileUpdate']);
   Route::get('/users/changestatus/{id}', [App\Http\Controllers\admin\UsersController::class, 'changestatus']);
   Route::get('/joinus', [App\Http\Controllers\admin\JoinUsController::class, 'index']);
   Route::get('/joinus/changestatus/{id}', [App\Http\Controllers\admin\JoinUsController::class, 'joinUsStatus']);
   Route::any('/about', [App\Http\Controllers\admin\CommonController::class, 'index']);
   Route::any('/privacy', [App\Http\Controllers\admin\CommonController::class, 'privacy']);
   Route::any('/term', [App\Http\Controllers\admin\CommonController::class, 'term']);
   Route::get('/reports', [App\Http\Controllers\admin\ReportsController::class, 'index']);
});

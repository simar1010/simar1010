<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
//use App\Http\Controllers\API\AuthController;
//use App\Http\Controllers\API\CommonController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/




Route::post('register', [App\Http\Controllers\API\AuthController::class, 'register']);
Route::post('login', [App\Http\Controllers\API\AuthController::class, 'login']);
Route::any('social-login', [App\Http\Controllers\API\AuthController::class, 'socialLogin']);
Route::any('privacy-policy', [App\Http\Controllers\API\CommonController::class, 'privacyPolicy']);
Route::any('term-condition', [App\Http\Controllers\API\CommonController::class, 'termCondition']);
Route::any('about-us', [App\Http\Controllers\API\CommonController::class, 'aboutUs']);
Route::post('forget-password-reset-link', [App\Http\Controllers\Auth\ForgotPasswordController::class, 'forgot']);

Route::group(['middleware' => ['auth:sanctum']], function() {
    Route::post('logout', [App\Http\Controllers\API\AuthController::class, 'logout']);
    Route::post('profile-update', [App\Http\Controllers\API\AuthController::class, 'profileUpdate']);
    Route::post('join-us', [App\Http\Controllers\API\CommonController::class, 'joinUs']);
    Route::apiResource('hotels', App\Http\Controllers\API\HotelsController::class);
});

<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\AppointmentClientController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/register', [UserController::class, 'register']);
Route::post('/login', [UserController::class, 'login']);
Route::get('/user/{id}', [UserController::class, 'user']);

Route::get('/viewappointment/{id}', [AppointmentClientController::class, 'viewappointment']);
Route::post('/createappointment', [AppointmentClientController::class, 'createappointment']);

Route::get('/student', [StudentController::class, 'index']);
Route::post('/student', [StudentController::class, 'upload']);
Route::put('/student/edit/{id}', [StudentController::class, 'edit']);
Route::put('/student/delete/{id}', [StudentController::class, 'delete']);

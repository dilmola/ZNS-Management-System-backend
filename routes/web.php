<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ToyyibPayController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('toyyibpay','ToyyibPayController@createBill')->name('createBill');
Route::get('/toyyibpay', [ToyyibPayController::class, 'createBill']);
// Route::get('/toyyibpay-status', [ToyyibPayController::class, 'toyyibpay-status']);
// Route::get('/toyyibpay-callback', [ToyyibPayController::class, 'toyyibpay-callback']);
// Route::get('toyyibpay-status', [ToyyibPayController::class, 'toyyibpay-status']);
// Route::get('toyyibpay-callback', [ToyyibPayController::class, 'toyyibpay-callback']);
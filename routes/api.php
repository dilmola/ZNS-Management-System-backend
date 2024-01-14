<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\AppointmentClientController;
use App\Http\Controllers\AppointmentContractorController;
use App\Http\Controllers\ListForAdminController;
use App\Http\Controllers\ShopItemListController;
use App\Http\Controllers\testcontroller;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\ContractorController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\AppointmentPaymentController;

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

Route::group(['middleware' => 'cors'], function () {
   Route::post('/upload', [testcontroller::class, 'uploadImage']);
       Route::get('/get/shop/item/lists', [testcontroller::class, 'getShopItemList']);
    Route::put('/edit/shop/item/{id}', [testcontroller::class, 'editItem']);
    Route::delete('/delete/shop/item/{id}', [testcontroller::class, 'deleteItem']);
});

   

Route::post('/create/shop/item/list', [ShopItemListController::class, 'createShopItemLists']);
Route::get('/get/shop/item/lists', [ShopItemListController::class, 'getShopItemLists']);
Route::put('/update/shop/item/lists/{itemId}', [ShopItemListController::class, 'updateShopItemLists']);
Route::post('/delete/shop/item/lists{itemId}', [ShopItemListController::class, 'deleteShopItemLists']);
Route::get('/view/total/available/item', [ShopItemListController::class, 'totalAvailableItem']);
Route::get('/view/total/out-of-stock/item', [ShopItemListController::class, 'totalOutOfStockItem']);

Route::post('/register', [UserController::class, 'register']);
Route::post('/login', [UserController::class, 'login']);
Route::get('/user/{id}', [UserController::class, 'user']);
Route::get('/get/data/my-profile/{userId}', [UserController::class, 'getUserProfile']);
Route::put('/update/data/my-profile/{userId}', [UserController::class, 'updateUserProfile']);

Route::get('/view/list/client', [ClientController::class, 'viewListClient']);

Route::post('/create/new/contractor', [ContractorController::class, 'createNewContractor']);
Route::get('/view/list/contractor', [ContractorController::class, 'viewListContractor']);
Route::put('/update/status/{status}/contractor/{contractorId}', [ContractorController::class, 'updateStatusContractor']);

Route::get('/viewappointment/{id}', [AppointmentClientController::class, 'viewappointment']);
Route::post('/createappointment', [AppointmentClientController::class, 'createappointment']);
Route::get('/view/list/second/appointment/client/{clientId}', [AppointmentClientController::class, 'viewListSecondAppointmentClient']);
Route::put('/update/status/{status}/second/appointment/client/{secondAppoinmentId}', [AppointmentClientController::class, 'updateStatusSecondAppointmentClient']);
Route::put('/update/client/required/invoice/second/appointment/client/{secondAppoinmentId}', [AppointmentClientController::class, 'updateClientInvoiceSecAppointmentClient']);

Route::get('/view/listforcontractor/appointment/{contractorId}', [AppointmentContractorController::class, 'appointmentListForContractor']);
Route::get('/ViewAcceptAppointmentContractor/{id}', [AppointmentContractorController::class, 'ViewAcceptAppointmentContractor']);
Route::get('/view/list/second/appointment/contractor/{contractorId}', [AppointmentContractorController::class, 'ViewListSecondAppointmentContractor']);

Route::put('/update/appointment/{appointmentId}/contractor/{contractorId}/status/{appointmentStatusId}', [AppointmentContractorController::class, 'UpdateStatusAppointmentContractor']);
Route::put('/update/second/appointment/done/{appointmentId}', [AppointmentContractorController::class, 'UpdateSecondAppointmentDoneStatus']);

// Route::put('/create/second/appointment/{appointmentId}/document_id/{documentId}', [AppointmentContractorController::class, 'createSecondAppointment']);//document_id

Route::post('/create/second/appointment/', [AppointmentContractorController::class, 'createSecondAppointment']);//document_id

Route::post('/new/appointment/payment/item/{userId}', [AppointmentPaymentController::class, 'newAppointmentPaymentOfItemForInvoice']);
Route::get('/view/list/document/detail/second/appointment/contractor/{contractorId}', [AppointmentPaymentController::class, 'viewListDocumentDetailSecondAppointmentContractor']);
Route::get('/get/data/document/detail/second/appointment/client/{documentsId}', [AppointmentPaymentController::class, 'getDataDocumentDetailSecondAppointmentClient']);

Route::get('/view/appointment-listforadmin', [ListForAdminController::class, 'appointmentlistforadmin']);
Route::get('/view/users-listforadmin', [ListForAdminController::class, 'userlistforadmin']);
Route::get('/view/contractors-listforadmin', [ListForAdminController::class, 'usercontractorlistforadmin']);
Route::get('/view/list/accept/second/appointment/clients-listforadmin', [ListForAdminController::class, 'viewListAcceptSecondAppointmentClientForAdmin']);

// Route::put('/update/invoice/for/second/appointment/{secAppointmentId}', [ListForAdminController::class, 'updateInvoiceSecondAppointmentForClient']);

Route::post('/new/payment/item/{itemId}/user/{userId}', [PaymentController::class, 'newPaymentOfItem']);
Route::put('/update/success/payment/user/{userId}', [PaymentController::class, 'updateSuccessPaymentOfItem']);
Route::get('/payment/required/item/{userId}', [PaymentController::class, 'paymentRequiredOfItem']);
Route::get('/view/list/payment/item', [PaymentController::class, 'viewListPaymentItem']);
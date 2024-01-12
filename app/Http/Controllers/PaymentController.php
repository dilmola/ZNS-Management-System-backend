<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Payment;
use App\Models\Profile;
use App\Models\ShopItemList;

use Validator;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function newPaymentOfItem(Request $request, $itemId, $userId)
    {
        // Generate a unique transaction_id (you may use a more sophisticated method)
        // $transactionId = uniqid();
    
        // Assuming your model is named PaymentItem
        $newPaymentItem = Payment::create([
            'user_id' => $userId,
            'shop_item_list_id' => $itemId,
            'status' => 'pending',
            'transaction_id' => 'waitingForPayment',
        ]);
    
        // Retrieve the list of pending payment items after the new item is created
        // $listPendingPaymentItem = UserListForAdmin::getListForAdmin();// Adjust this line according to your actual logic
        
        $data = [
            'status' => 200,
            // 'listPendingPaymentItem' => $listPendingPaymentItem,
            'newPaymentItem' => $newPaymentItem, // Add the new payment item to the response
        ];
    
        return response()->json($data, 200);
    }

    public function updateSuccessPaymentOfItem(Request $request, $userId)
    {
        $data = $request->json()->all();
    
        $responseItems = [];
        $transactionId = uniqid();
    
        foreach ($data['shop_item_list_id'] as $shopItemId) {
            $paymentItem = Payment::where('user_id', $userId)
                ->where('shop_item_list_id', $shopItemId)
                ->where('status', 'pending')
                ->update([
                    'status' => 'success',
                    'transaction_id' => $transactionId,
                ]);
    
            $responseItems[] = $paymentItem;
    
            // Decrement quantity_item in shop_item_lists table
            $this->decrementQuantity($shopItemId);
        }

        $responseData = [
            'status' => 200,
            'newPaymentItems' => $responseItems,
        ];
    
        return response()->json($responseData, 200);
    }

    private function decrementQuantity($shopItemId)
    {
    ShopItemList::where('id', $shopItemId)
        ->where('quantity_item', '>', 0) // make sure it's greater than 0
        ->decrement('quantity_item');
    }
    

    public function paymentRequiredOfItem(Request $request, $userId)
    {
        $listPendingPayment = Payment::leftJoin('users', 'payment_number.user_id', '=', 'users.id')
            ->leftJoin('profile', 'users.users_type_id', '=', 'profile.user_id')
            ->leftJoin('shop_item_lists', 'payment_number.shop_item_list_id', '=', 'shop_item_lists.id')
            ->select(
                'profile.id as user_id',
                'users.*',
                'payment_number.*',
                'shop_item_lists.*', 
                'shop_item_lists.price_item', 
            )
            ->where('users.id', $userId)
            ->where('transaction_id', 'waitingForPayment')
            ->get();
    
            $beforeDepositPrice = $listPendingPayment->sum('price_item');
            $finalTotalPrice = max(0, $beforeDepositPrice - 10);

            $data = [
                'status' => 200,
                'listPendingPayment' => $listPendingPayment,
                'beforeDepositPrice' => $beforeDepositPrice,
                'finalTotalPrice' => $finalTotalPrice,

            ];
    
        return response()->json($data, 200);
    }
    
    public function viewListPaymentItem(Request $request)
    {
        $listSuccessPayment = Payment::leftJoin('users', 'payment_number.user_id', '=', 'users.id')
            ->leftJoin('profile', 'users.users_type_id', '=', 'profile.user_id')
            ->leftJoin('shop_item_lists', 'payment_number.shop_item_list_id', '=', 'shop_item_lists.id')
            ->select(
                'profile.id as user_id',
                'users.fullname',
                'users.*',
                'payment_number.*',
                'shop_item_lists.*', 
                'shop_item_lists.price_item', 
            )
            ->where('payment_number.status', 'success')
            ->get();
    
            $data = [
                'status' => 200,
                'listSuccessPayment' => $listSuccessPayment,
                ];
    
        return response()->json($data, 200);
    }
    
    
}

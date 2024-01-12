<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Payment;
use App\Models\Profile;
use App\Models\ShopItemList;
use App\Models\AppointmentPayment;

use Validator;
use Illuminate\Http\Request;

class AppointmentPaymentController extends Controller
{
    public function newAppointmentPaymentOfItemForInvoice(Request $request, $userId)
    {
        $data = $request->json()->all();
        $responseItems = [];

        foreach ($data as $item) {
            $newAppointmentPaymentOfItemForInvoice = AppointmentPayment::create([
                'user_id' => $userId,
                'details_appointment_items' => $item['details_appointment_items'],
                'quantity_appointment_items' => $item['quantity_appointment_items'],
                'price_appointment_items' => $item['price_appointment_items'],
                'status' => 'pending', // Assuming this is the correct status
                'transaction_id' => 'waitingForPayment'
            ]);

            $responseItems[] = $newAppointmentPaymentOfItemForInvoice;
        }

        $responseData = [
            'status' => 200,
            'newAppointmentPaymentOfItemForInvoice' => $responseItems,
        ];

        return response()->json($responseData, 200);
    }
}

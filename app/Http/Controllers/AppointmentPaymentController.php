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
        $documentsId = uniqid();

        foreach ($data as $item) {
            $newAppointmentPaymentOfItemForInvoice = AppointmentPayment::create([
                'user_id' => $userId,
                'details_appointment_items' => $item['details_appointment_items'],
                'quantity_appointment_items' => $item['quantity_appointment_items'],
                'price_appointment_items' => $item['price_appointment_items'],
                'status' => 'Pending', // Assuming this is the correct status
                'documents_id' => $documentsId
            ]);

            $responseItems[] = $newAppointmentPaymentOfItemForInvoice;
        }

        $responseData = [
            'status' => 200,
            'newAppointmentPaymentOfItemForInvoice' => $responseItems,
        ];

        return response()->json($responseData, 200);
    }

    public function viewListDocumentDetailSecondAppointmentContractor(Request $request, $contractorId)
    {
        $appointmentContractor = AppointmentPayment::select('appointment_payment.*')
        ->where('appointment_payment.user_id', $contractorId)

        ->get();

        $responseData = [
        'status' => 200,
        'newAppointmentPaymentOfItemForInvoice' => $appointmentContractor,
        ];

        return response()->json($responseData);

        return response()->json($responseData, 200);
    }

    public function getDataDocumentDetailSecondAppointmentClient(Request $request, $documentsId)
    {
        $appointmentContractor = AppointmentPayment::select('appointment_payment.*')
        ->where('appointment_payment.documents_id', $documentsId)
        ->get();

        $responseData = [
        'status' => 200,
        'newAppointmentPaymentOfItemForDoc' => $appointmentContractor,
        ];

        return response()->json($responseData);

        return response()->json($responseData, 200);
    }
}

<?php

namespace App\Http\Controllers;
use App\Models\AppointmentContractor;

use Illuminate\Http\Request;

class AppointmentContractorController extends Controller
{
    public function viewappointmentcontractor(Request $request)
    {
        $appointmentContractor = AppointmentContractor::leftJoin('users', 'appointment_client.users_id', '=', 'users.id')
        ->leftJoin('appointment_status', 'appointment_client.appointment_status_id', '=', 'appointment_status.id')
        ->where('appointment_client.appointment_status_id', 3)
        ->select(
            'appointment_client.id as appointment_id',
            'appointment_client.*',
            'users.*',
            'appointment_status.*'
        )
        ->get();

       $data = [
        'status'=>200,
        'appointment'=>$appointmentContractor
       ];

       return response()->json($data,200);
    }

    public function ViewAcceptAppointmentContractor(Request $request , $userId)
    {
        $appointmentContractor = AppointmentContractor::leftJoin('users', 'appointment_client.users_id', '=', 'users.id')
        ->leftJoin('appointment_status', 'appointment_client.appointment_status_id', '=', 'appointment_status.id')
        ->where('appointment_client.appointment_status_id', 1)
        ->select(
            'appointment_client.id as appointment_id',
            'appointment_client.*',
            'users.*',
            'appointment_status.*'
        )
        ->where('appointment_client.users_id_contractor', $userId)
        ->get();

       $data = [
        'status'=>200,
        'appointment'=>$appointmentContractor
       ];

       return response()->json($data,200);
    }

    public function UpdateStatusAppointmentContractor(Request $request , $userId, $appId)
    {
 
        AppointmentContractor::where('id', $appId)
            ->update([
                'users_id_contractor' => $userId,
                'appointment_status_id' => $request->appointment_status_id,
            ]);   

        $data=[
            'status'=>200,
            'message' =>'data uploaded'
        ];
 
         return response()->json($data,200);
 
        
    }
}

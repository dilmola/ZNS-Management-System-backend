<?php

namespace App\Http\Controllers;
use App\Models\AppointmentContractor;

use Illuminate\Http\Request;

class AppointmentContractorController extends Controller
{
    public function appointmentListForContractor(Request $request, $contractorId)
    {
        $appointmentContractor = AppointmentContractor::leftJoin('users as client_user', 'appointment_client.users_id', '=', 'client_user.id')
        ->leftJoin('appointment_status', 'appointment_client.appointment_status_id', '=', 'appointment_status.id')
        ->leftJoin('users as contractor_user', 'appointment_client.users_id_contractor', '=', 'contractor_user.id')
        ->where('appointment_client.appointment_status_id', 3)
        ->select(
            'appointment_client.id as appointment_id',
            'appointment_client.*',
            'client_user.*',
            'contractor_user.fullname as contractor_fullname', 
            'client_user.fullname as client_fullname', 
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
            'users.fullname as client_fullname', 

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

    public function UpdateStatusAppointmentContractor(Request $request, $appointmentId, $contractorId, $appointmentStatusId)
    {
        AppointmentContractor::where('id', $appointmentId)
            ->update([
                'users_id_contractor' => $contractorId,
                'appointment_status_id' => $appointmentStatusId,
            ]);   

        $data = [
            'status' => 200,
            'message' => 'data update',
        ];

        return response()->json($data, 200);
    }
}

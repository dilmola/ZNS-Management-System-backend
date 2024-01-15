<?php

namespace App\Http\Controllers;
use App\Models\UserListForAdmin;
use App\Models\AppointmentContractor;
use App\Models\AppointmentClient;

use Validator;
use Illuminate\Http\Request;

class ListForAdminController extends Controller
{
    public function userlistforadmin(Request $request)
    {
        $listuser = UserListForAdmin::where('users_type_id', 3)
        ->where('status', 'active')
        ->count();
    
        $data = [
            'status' => 200,
            'listuser' => $listuser
        ];
    
        return response()->json($data, 200);
    }

    public function usercontractorlistforadmin(Request $request)
    {
        $listuser = UserListForAdmin::where('users_type_id', 2)
        ->where('status', 'active')
        ->count();
    
        $data = [
            'status' => 200,
            'listuser' => $listuser
        ];
    
        return response()->json($data, 200);
    }

    public function appointmentlistforadmin(Request $request)
    {
        $listuser = AppointmentContractor::leftJoin('users as client_user', 'appointment_client.users_id', '=', 'client_user.id')
        ->leftJoin('appointment_status', 'appointment_client.appointment_status_id', '=', 'appointment_status.id')
        ->leftJoin('users as contractor_user', 'appointment_client.users_id_contractor', '=', 'contractor_user.id')
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
            'status' => 200,
            'listuser' => $listuser
        ];
    
        return response()->json($data, 200);
    }

    public function viewListAcceptSecondAppointmentClientForAdmin(Request $request)
    {
        $appointmentContractor = AppointmentClient::leftJoin('users', 'appointment_client.users_id', '=', 'users.id')
        ->leftJoin('profile', 'appointment_client.users_id', '=', 'profile.user_id')
        ->leftJoin('appointment_status', 'appointment_client.appointment_status_id', '=', 'appointment_status.id')
        ->leftJoin('users as contractor_user', 'appointment_client.users_id_contractor', '=', 'contractor_user.id')
        ->Join('appointment_second_client', 'appointment_client.id', '=', 'appointment_second_client.appoinment_first_id')
        ->where('appointment_second_client.status', 'Accept')
        ->select(
            'appointment_client.id as appointment_id',
            'appointment_client.address as appointment_address',

            'appointment_client.*',
            'users.fullname as client_fullname', 
            'contractor_user.fullname as contractor_fullname', 
            'users.*',
            'appointment_status.*',
            'appointment_second_client.status as second_appointment_status',
            'appointment_second_client.*',
            'appointment_second_client.id as sec_appointment_id',

            'appointment_second_client.date_appointment as second_appointment_date'
        )
        ->get();   

       $data = [
        'status'=>200,
        'appointment'=>$appointmentContractor
       ];

       return response()->json($data,200);
    }
    
}

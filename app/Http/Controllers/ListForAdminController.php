<?php

namespace App\Http\Controllers;
use App\Models\UserListForAdmin;
use App\Models\AppointmentContractor;
use Validator;
use Illuminate\Http\Request;

class ListForAdminController extends Controller
{
    public function userlistforadmin(Request $request)
    {
        $listuser = UserListForAdmin::count(); 
    
        $data = [
            'status' => 200,
            'listuser' => $listuser
        ];
    
        return response()->json($data, 200);
    }

    public function usercontractorlistforadmin(Request $request)
    {
        $listuser = UserListForAdmin::where('users_type_id', 2)->count();
    
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
    
}

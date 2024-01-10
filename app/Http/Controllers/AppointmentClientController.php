<?php

namespace App\Http\Controllers;
use App\Models\AppointmentClient;
use Validator;

use Illuminate\Http\Request;

class AppointmentClientController extends Controller
{
    public function viewappointment(Request $request, $userId)
    {
        $appointment = AppointmentClient::leftJoin('users as client_user', 'appointment_client.users_id_contractor', '=', 'client_user.id')
        ->leftJoin('appointment_status', 'appointment_client.appointment_status_id', '=', 'appointment_status.id') 
        ->leftJoin('users as contractor_user', 'appointment_client.users_id_contractor', '=', 'contractor_user.id')
        ->where('appointment_client.users_id', $userId)
        ->select(
            'appointment_client.id as appointment_id',
            'appointment_client.*',
            'client_user.*',
            'contractor_user.fullname as contractor_fullname', 
            'client_user.fullname as client_fullname', 
            'appointment_status.*'
        )
        ->orderByRaw("FIELD(appointment_client.appointment_status_id, 1, 3)")
        ->get();

       $data = [
        'status'=>200,
        'appointment'=>$appointment
       ];

       return response()->json($data,200);
    }

    public function createappointment(Request $request)
    {
        $validator =  Validator::make($request->all(),

        [
         'date_appointment'=>'nullable',
         'appointment_type'=>'nullable',
         'location_appointment'=>'nullable',
         'address'=>'nullable',
         'remark'=>'nullable',
        ]);
 
        if($validator->fails())
        {
         $data=[
            "status"=>422,
            "message"=>$validator->messages()
         ];
            return response()->json($data,422);
        } else {
        $appointment = new AppointmentClient;

        $appointment->date_appointment=$request->date_appointment;
        $appointment->appointment_type=$request->appointment_type;
        $appointment->location_appointment=$request->location_appointment;
        $appointment->address=$request->address;
        $appointment->remark=$request->remark;
        $appointment->appointment_status_id=3;
        $appointment->users_id=$request->users_id;
        $appointment->users_id_contractor=$request->users_id_contractor;
        $appointment->add_appointment_date = now()->format('Y-m-d');
        $appointment->save();

        $data=[
            'status'=>200,
            'message' =>'data uploaded'
        ];
 
         return response()->json($data,200);
 
        }
    }
}

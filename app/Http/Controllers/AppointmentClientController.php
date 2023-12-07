<?php

namespace App\Http\Controllers;
use App\Models\AppointmentClient;
use Validator;

use Illuminate\Http\Request;

class AppointmentClientController extends Controller
{
    public function viewappointment(Request $request, $userId)
    {
        $appointment = AppointmentClient::leftJoin('users', 'appointment_client.users_id_contractor', '=', 'users.id')
        ->leftJoin('appointment_status', 'appointment_client.appointment_status_id', '=', 'appointment_status.id')
        ->where('appointment_client.users_id', $userId)
        ->select('appointment_client.*', 'users.*', 'appointment_status.*')
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
         'date_apointment'=>'nullable',
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

        $appointment->date_apointment=$request->date_apointment;
        $appointment->appointment_type=$request->appointment_type;
        $appointment->location_appointment=$request->location_appointment;
        $appointment->address=$request->address;
        $appointment->remark=$request->remark;
        $appointment->appointment_status_id=3;
        $appointment->users_id=$request->user_id;

        $appointment->save();

        $data=[
            'status'=>200,
            'message' =>'data uploaded'
        ];
 
         return response()->json($data,200);
 
        }
    }
}

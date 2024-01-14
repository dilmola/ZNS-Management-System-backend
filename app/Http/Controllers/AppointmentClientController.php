<?php

namespace App\Http\Controllers;
use App\Models\AppointmentClient;
use App\Models\AppointmentSecondClient;

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

    public function viewListSecondAppointmentClient(Request $request , $clientId)
    {
        $appointmentContractor = AppointmentClient::leftJoin('users', 'appointment_client.users_id', '=', 'users.id')
        ->leftJoin('profile', 'appointment_client.users_id', '=', 'profile.user_id')

        ->leftJoin('appointment_status', 'appointment_client.appointment_status_id', '=', 'appointment_status.id')
        ->leftJoin('users as contractor_user', 'appointment_client.users_id_contractor', '=', 'contractor_user.id')
        ->Join('appointment_second_client', 'appointment_client.id', '=', 'appointment_second_client.appoinment_first_id')

        ->where('appointment_client.appointment_status_id', 1)
        ->select(
            'appointment_client.id as appointment_id',
            'profile.address as address_user',

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
        ->where('appointment_client.users_id', $clientId)
        ->where('appointment_client.status_second_appointment', 'Done')

        ->get();   

       $data = [
        'status'=>200,
        'appointment'=>$appointmentContractor
       ];

       return response()->json($data,200);
    }

    public function updateStatusSecondAppointmentClient(Request $request , $status ,$secondAppoinmentId)
    {
 
        AppointmentSecondClient::where('id', $secondAppoinmentId)
        ->update([
            'status' =>  $status,
        ]);   

        $data = [
            'status' => 200,
            'message' => 'data update',
        ];

        return response()->json($data, 200);
    }

    public function updateClientInvoiceSecAppointmentClient(Request $request ,$secondAppoinmentId)
    {
 
        AppointmentSecondClient::where('id', $secondAppoinmentId)
        ->update([
            'client_required_invoice' =>  1,
        ]);   

        $data = [
            'status' => 200,
            'message' => 'data update',
        ];

        return response()->json($data, 200);
    }
}

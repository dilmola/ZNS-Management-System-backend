<?php

namespace App\Http\Controllers;
use App\Models\AppointmentContractor;
use App\Models\AppointmentSecondClient;
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
        ->leftJoin('users as contractor_user', 'appointment_client.users_id_contractor', '=', 'contractor_user.id')
        ->where('appointment_client.appointment_status_id', 1)
        ->select(
            'appointment_client.id as appointment_id',
            'appointment_client.*',
            'users.fullname as client_fullname', 
            'contractor_user.fullname as contractor_fullname', 
            'users.*',
            'appointment_status.*'
        )
        ->where('appointment_client.users_id_contractor', $userId)
        ->where('appointment_client.status_second_appointment', NULL)

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

    public function UpdateSecondAppointmentDoneStatus(Request $request, $appointmentId)
    {
        AppointmentContractor::where('id', $appointmentId)
            ->update([
                'status_second_appointment' => 'Done',
            ]);   

        $data = [
            'status' => 200,
            'message' => 'data update',
        ];

        return response()->json($data, 200);
    }

    public function ViewListSecondAppointmentContractor(Request $request , $contractorId)
    {
        $appointmentContractor = AppointmentContractor::leftJoin('users', 'appointment_client.users_id', '=', 'users.id')
        ->leftJoin('appointment_status', 'appointment_client.appointment_status_id', '=', 'appointment_status.id')
        ->leftJoin('users as contractor_user', 'appointment_client.users_id_contractor', '=', 'contractor_user.id')
        ->leftJoin('appointment_second_client', 'appointment_client.id', '=', 'appointment_second_client.appoinment_first_id')

        ->where('appointment_client.appointment_status_id', 1)
        ->select(
            'appointment_client.id as appointment_id',
            'appointment_client.*',
            'users.fullname as client_fullname', 
            'contractor_user.fullname as contractor_fullname', 
            'users.*',
            'appointment_status.*',
            'appointment_second_client.status as second_appointment_status',
            'appointment_second_client.date_appointment as second_appointment_date'

        )
        ->where('appointment_client.users_id_contractor', $contractorId)
        ->where('appointment_client.status_second_appointment', 'Done')

        ->get();   

       $data = [
        'status'=>200,
        'appointment'=>$appointmentContractor
       ];

       return response()->json($data,200);
    }

    public function createSecondAppointment(Request $request)
    {
 
        $secappointment = new AppointmentSecondClient;
    
        $secappointment->appoinment_first_id = $request->appoinment_first_id;
        $secappointment->status = 'Pending';
        $secappointment->document_id = $request->document_id;
        $secappointment->date_appointment = $request->date_appointment;
        $secappointment->date_submit = now()->format('Y-m-d'); // Assuming you want the current date and time
    
        // Save the appointment to the database
        $secappointment->save();
    
        // Return a JSON response
        $data = [
            'status' => 200,
            'message' => 'Data uploaded'
        ];
    
        return response()->json($data, 200);
    }
    
    
}

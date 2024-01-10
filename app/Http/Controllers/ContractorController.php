<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Profile;
use Illuminate\Support\Facades\Hash;
use Validator;

class ContractorController extends Controller
{
    public function createNewContractor(Request $request)
    {
        $validator =  Validator::make($request->all(),

        [
         'email'=>'required|email',
         'fullname' => 'nullable',
         'password'=> 'nullable',
 
         // "username" : "",
         // "email" : "",
         // "fullname" : "",
         // "password" : ""
        ]);      
 
        if($validator->fails())
        {
         $data=[
             "status"=>422,
             "message"=>$validator->messages()
         ];
             return response()->json($data,422);
 
        } else {
         // Create a new user
         $user = new User;
         $user->email = $request->email;
         $user->fullname = $request->fullname;
         $user->password = $request->password;
         $user->users_type_id = 2;
         $user->status = 'active';
         $user->save();
 
         $newUserId = $user->id;
 
         $profile = new Profile;
         $profile->user_id = $newUserId;
         $profile->phone = null;
         $profile->address = null;
         $profile->save();
 
 
         $data=[
             'status'=>200,
             'message' =>'succesfull register'
         ];
 
         return response()->json($data,200);
 
        }
    }

    public function viewListContractor(Request $request)
    {
        $listContractor = User::leftJoin('profile', 'users.id', '=', 'profile.user_id')
        ->leftJoin('users_type', 'users.users_type_id', '=', 'users_type.id')
        // ->where('users.status', 'active')
        ->where('users.users_type_id', 2)
        ->select('users.*', 'profile.*', 'users.id as contractorId')
        ->get();
    
        $data = [
            'status' => 200,
            'listuser' => $listContractor
        ];
    
        return response()->json($data, 200);
    }

    public function updateStatusContractor(Request $request, $status, $contractorId)
    {
        $user = User::find($contractorId);
    
        if ($user) {
            $user->update([
                'status' => $status,
            ]);
    
            $message = "User status updated to $status";
    
            $data = [
                'status' => 200,
                'message' => $message,
            ];
    
            return response()->json($data, 200);
        } else {
            $data = [
                'status' => 404,
                'message' => 'User not found',
            ];
    
            return response()->json($data, 404);
        }
    }    
}

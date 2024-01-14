<?php

// app/Http/Controllers/UsersController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Profile;
use Illuminate\Support\Facades\Hash;
use Validator;

class UserController extends Controller
{
    
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
            // {
            //     "email" : "",
            //     "password" : ""
            // }
        ]);        
        if ($validator->fails()) {
            $data = [

                'status' => 422,
                'message' => $validator->messages(),

            ];        

            return response()->json($data, 422);
        } else {
            $user = User::where('email', $request->email)->first();

            if ($user && $user->password === $request->password) {
                $data = [
                    'status' => 200,
                    'message' => 'Successful login',
                    'data' => [
                        'id' => $user->id,
                        'users_type_id' => $user->users_type_id,
                        // Add other properties here if needed
                    ],
                    
                ];

                return response()->json($data, 200);
            } else {
                $data = [
                    'status' => 401,
                    'message' => 'Wrong email or password',
                ];

                return response()->json($data, 401);
            }
        }
        
    }

    public function register(Request $request)
    {
       $validator =  Validator::make($request->all(),

       [
        'username'=>'required',
        'email'=>'required|email',
        'fullname',
        'password'=>'required',

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
        $user->status = 'active';
        $user->username = $request->username;
        $user->email = $request->email;
        $user->fullname = $request->fullname;
        $user->password = $request->password;
        $user->users_type_id = 3;
        
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

    public function user(Request $request, $id)
    {
        $user = User::leftJoin('profile', 'users.id', '=', 'profile.user_id')
        ->where('users.id', '=', $id)
        ->first();

       $data = [
        'status'=>200,
        'user'=>$user
       ];

       return response()->json($data,200);
    }


    public function getUserProfile(Request $request, $userId)
    {
        $user = User::leftJoin('profile', 'users.id', '=', 'profile.user_id')
        ->leftJoin('users_type', 'users.users_type_id', '=', 'users_type.id')
        ->where('users.id', '=', $userId)
        ->first();

        $data = [
            'status'=>200,
            'user'=>$user
        ];

        return response()->json($data,200);
    }

    public function updateUserProfile(Request $request, $userId)
    {
        $validator =  Validator::make($request->all(),

        [
            'fullname'=>'nullable',
            'username'=>'nullable',
            'email'=>'nullable|email',
            'phone'=>'nullable',
            'address'=>'nullable',
            'password'=>'nullable',
            'address'=>'nullable',
        ]);

        if($validator->fails())
        {
            $data=[
                "status"=>422,
                "message"=>$validator->messages()
            ];
            return response()->json($data,422);

        } else {
            $userProfile = User::join('profile', 'profile.user_id', '=', 'users.id')
            ->where('users.id', '=', $userId)
            ->update([
                'users.fullname' => $request->fullname,
                'users.username' => $request->username,
                'users.email' => $request->email,
                'profile.phone' => $request->phone,
                'profile.address' => $request->address,
                'users.password' => $request->password,

            ]);

            $data=[
                'status'=>200,
                'message' =>'data updated succesfully'
            ];

            return response()->json($data,200);
        }
    }
}
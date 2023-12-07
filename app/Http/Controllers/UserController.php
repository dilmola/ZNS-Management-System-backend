<?php

// app/Http/Controllers/UsersController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Validator;

class UserController extends Controller
{
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

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
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
                    'id' => $user->id,
                    'users_type_id' => $user->users_type_id,
                ];

                return response()->json($data, 200);
            } else {
                $data = [
                    'status' => 401,
                    'message' => 'wrong email or password',
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
       ]);      

       if($validator->fails())
       {
        $data=[
            "status"=>422,
            "message"=>$validator->messages()
        ];
            return response()->json($data,422);

       } else {
        $user = new User;

        $user->username=$request->username;
        $user->email=$request->email;
        $user->fullname=$request->fullname;
        $user->password=$request->password;
        $user->users_type_id = 3;

        $user->save();

        $data=[
            'status'=>200,
            'message' =>'succesfull register'
        ];

        return response()->json($data,200);

       }
    }
}

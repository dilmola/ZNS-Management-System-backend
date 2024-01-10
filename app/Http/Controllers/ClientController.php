<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Profile;
use Illuminate\Support\Facades\Hash;

class ClientController extends Controller
{
    public function viewListClient(Request $request)
    {
        $listClient = User::leftJoin('profile', 'users.id', '=', 'profile.user_id')
        ->leftJoin('users_type', 'users.users_type_id', '=', 'users_type.id')
        ->where('users.status', 'active')
        ->where('users.users_type_id', 3)
        ->get();
    
        $data = [
            'status' => 200,
            'listuser' => $listClient
        ];
    
        return response()->json($data, 200);
    }
}

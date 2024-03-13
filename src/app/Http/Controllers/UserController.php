<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    public function getUser()
    {
        return [
            'name' => 'John Doe',
            'email' => 'john.doe@example.com',
            'role' => 'user',
        ];
    }
}
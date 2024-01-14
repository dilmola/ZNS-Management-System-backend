<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AppointmentSecondClient extends Model
{
    use HasFactory;

    protected $table = 'appointment_second_client';

    // Make all columns fillable
    protected $guarded = [];

}

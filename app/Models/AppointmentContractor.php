<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AppointmentContractor extends Model
{
    use HasFactory;

    protected $table = 'appointment_client';

    // Make all columns fillable
    protected $guarded = [];
}

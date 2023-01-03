<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JoinUs extends Model
{
    use HasFactory;

    protected $fillable = [
        'email',
        'company',
        'weburl',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
    ];
}

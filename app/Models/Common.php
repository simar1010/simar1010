<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Common extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
    ];

    protected $hidden = [
        'id', 
        'remember_token',
        'updated_at',
        'created_at',
        'type',
    ];
}

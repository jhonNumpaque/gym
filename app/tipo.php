<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class tipo extends Model
{
    protected $table = "ft_tipo_usuario";
    protected $primarykey = "id";
    private $timestamps = false;
}

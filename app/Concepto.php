<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Concepto extends Model {
    protected $table = "ft_concepts";
    protected $primarykey = "id";
    public $timestamps = false;
}

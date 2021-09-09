<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ConfigurationClass extends Model{

    protected $table = "ft_configuration_time";
    public $primarykey = "id";
    public $timestamps = false;

    public static function getAllData() {
        return ConfigurationClass::get();
    }
}

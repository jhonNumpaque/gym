<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class plan extends Model {
    protected $table = 'ft_plan';
    protected $primarykey = "id";
    public $timestamps = false;

    public static function getData () {
        return DB::table('ft_plan as pln')
                   ->leftJoin('ft_tipo_plan as tpp', 'pln.tipo_plan', 'tpp.id')
                   ->leftJoin('ft_duracion as dur', 'pln.duracion', 'dur.id')
                   ->select('pln.id', 'tpp.nombre as nom', 'dur.nombre as dur', 'pln.valor')
                   ->get();
    }

    public static  function getTimeDuration ($planId) {
        return DB::table('ft_plan as pln')
            ->leftJoin('ft_duracion as dur', 'pln.duracion', 'dur.id')
            ->where('pln.id', $planId)
            ->value('dur.n_meses');
    }
}

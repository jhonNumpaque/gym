<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Ingreso extends Model {
    protected $table = "ft_ingresos";
    protected $primarykey = "id";
    public $timestamps = false;

    public static function getData() {
        return DB::table('ft_ingresos as ing')
            ->leftJoin('ft_concepts as con', 'ing.concepto', '=', 'con.id')
            ->select('ing.id', 'con.nombre as concepto', DB::raw('DATE_FORMAT(ing.fecha, "%d/%m/%Y") as fecha'), 'ing.valor')
            ->paginate(10);
    }
}

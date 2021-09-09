<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Egreso extends Model {
    protected $table = "ft_egresos";
    protected $primarykey = "id";
    public $timestamps = false;

    public static function getData() {
        return DB::table('ft_egresos as ing')
            ->leftJoin('ft_concepts as con', 'ing.concepto', '=', 'con.id')
            ->select('ing.id', 'con.nombre as concepto', DB::raw('DATE_FORMAT(ing.fecha, "%d/%m/%Y") as fecha'), 'ing.valor')
            ->paginate(10);
    }
}

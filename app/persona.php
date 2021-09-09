<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class persona extends Model
{

    protected $table = "ft_persona";
    protected $primarykey = "id";
    public $timestamps = false;

    public static function getData($sede){
        return DB::table('ft_persona as per')
                    ->leftJoin('ft_tipo_doc as tpd', 'per.tipo_doc', 'tpd.id')
                    ->leftJoin('ft_sede as sed', 'per.sede', 'sed.id')
                    ->where('per.tipo', 1)
                    ->where('sed.id', $sede)
                    ->select('per.id', 'per.nombres as nombres', 'tpd.nombre as tipo',
                    'per.documento', 'per.rh', 'per.direccion', 'per.email', DB::raw('DATE_FORMAT(per.fecha_nac, "%d/%m/%Y") as fecha'),
                    'sed.nombre as sede', 'per.foto')
                    ->orderBy('per.id', 'desc')
                    ->paginate(50);
    }

    public static function getDataLike($param) {
        return DB::table('ft_persona as per')
                    ->leftJoin('ft_tipo_doc as tpd', 'per.tipo_doc', 'tpd.id')
                    ->leftJoin('ft_sede as sed', 'per.sede', 'sed.id')
                    ->where('per.tipo', 1)
                    ->where('per.nombres', 'like', "%$param%")
                    ->orWhere('per.email', 'like', "%$param%")
                    ->orWhere('per.documento', 'like', "%$param%")
                    ->select('per.id', 'per.nombres as nombres', 'tpd.nombre as tipo',
                    'per.documento', 'per.rh', 'per.direccion', 'per.email', DB::raw('DATE_FORMAT(per.fecha_nac, "%d/%m/%Y") as fecha'),
                    'sed.nombre as sede', 'per.foto')
                    ->get();
    }

    public static function getDataUser() {
        return DB::table('ft_persona as per')
                    ->leftJoin('ft_tipo_doc as tpd', 'per.tipo_doc', 'tpd.id')
                    ->leftJoin('ft_sede as sed', 'per.sede', 'sed.id')
                    ->where('per.tipo', 1)
                    ->select('per.id', 'per.nombres as nombres', 'tpd.nombre as tipo',
                    'per.documento', 'per.rh', 'per.direccion', 'per.email', DB::raw('DATE_FORMAT(per.fecha_nac, "%d/%m/%Y") as fecha'),
                    'sed.nombre as sede')
                    ->get();
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class pago extends Model
{
    protected $table = "ft_pago";
    protected $primarykey = "id";
    public $timestamps = false;

    public static function getData($personaId) {
        return DB::table('ft_pago as pgo')
                   ->leftJoin('ft_persona as per', 'pgo.persona', 'per.id')
                   ->leftJoin('ft_plan as pln', 'pgo.plan', 'pln.id')
                   ->leftJoin('ft_tipo_plan as tpn', 'pln.tipo_plan', 'tpn.id')
                   ->where('pgo.persona', $personaId)
                   ->select('pgo.id', 'pgo.fecha_pago', 'tpn.nombre as plan', 'pgo.fecha_vec')
                   ->get();
    }

    public static function getDataLastFive($personaId) {
        return DB::table('ft_pago as pgo')
                   ->leftJoin('ft_persona as per', 'pgo.persona', 'per.id')
                   ->leftJoin('ft_plan as pln', 'pgo.plan', 'pln.id')
                   ->leftJoin('ft_tipo_plan as tpn', 'pln.tipo_plan', 'tpn.id')
                   ->where('pgo.persona', $personaId)
                   ->select('pgo.id', 'pgo.fecha_pago', 'tpn.nombre as plan', 'pgo.fecha_vec')
                   ->orderBy('pgo.id', 'desc')
                   ->limit(5)
                   ->get();
    }

    public static function getMaxPay($personaId) {
        return DB::table('ft_pago as pgo')
                   ->leftJoin('ft_persona as per', 'pgo.persona', 'per.id')
                   ->leftJoin('ft_plan as pln', 'pgo.plan', 'pln.id')
                   ->leftJoin('ft_tipo_plan as tpn', 'pln.tipo_plan', 'tpn.id')
                   ->where('pgo.persona', $personaId)
                   ->select('pgo.id', 'pgo.fecha_pago', 'tpn.nombre as plan', 'pgo.fecha_vec')
                   ->orderBy('pgo.fecha_vec', 'desc')
                   ->limit(1)
                   ->first();
    }

    public static function getDataPayWithPerson($personaId) {
        return DB::table('ft_pago as pgo')
                   ->leftJoin('ft_persona as per', 'pgo.persona', 'per.id')
                   ->leftJoin('ft_plan as pln', 'pgo.plan', 'pln.id')
                   ->leftJoin('ft_tipo_plan as tpn', 'pln.tipo_plan', 'tpn.id')
                   ->where('pgo.persona', $personaId)
                   ->select('pgo.id', 'pgo.fecha_pago', 'tpn.nombre as plan', 'tpn.id as planId', 'pgo.fecha_vec')
                   ->orderBy('pgo.id', 'desc')
                   ->get();
    }

    public static function getDataPay($personaId) {
        return DB::table('ft_pago as pgo')
                   ->leftJoin('ft_persona as per', 'pgo.persona', 'per.id')
                   ->leftJoin('ft_plan as pln', 'pgo.plan', 'pln.id')
                   ->leftJoin('ft_tipo_plan as tpn', 'pln.tipo_plan', 'tpn.id')
                   ->where('pgo.persona', $personaId)
                   ->select('pgo.id', DB::raw('DATE_FORMAT(pgo.fecha_pago, "%d/%m/%Y") as fecha_p'),
                    'tpn.nombre as plan',
                    DB::raw('DATE_FORMAT(pgo.fecha_vec, "%d/%m/%Y") as fecha_v'),
                    DB::raw('TIMESTAMPDIFF(DAY, pgo.fecha_vec, now()) as dias'))
                   ->orderBy('pgo.id', 'desc')
                   ->paginate(5);
    }
}

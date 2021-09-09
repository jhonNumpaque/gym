<?php

namespace App\Http\Controllers;

use App\Charts\DataChart;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InformesController extends Controller {

    public function ChartIngresosEgresos(Request $request){
        if (!empty($request->fechaInicial) && !empty($request->fechaFinal)) {
            $firstDate = $request->fechaInicial;
            $endDate = $request->fechaFinal;
        } else {
            $firstDate = Carbon::now()->startOfMonth()->format('Y-m-d');
            $endDate = Carbon::now()->endOfMonth()->format('Y-m-d');
        }

        $dataChart = new DataChart;

        $fechas = $this->getLabels($firstDate, $endDate);

        $Ingresos = DB::table('ft_ingresos')
                    ->select('valor')
                    ->whereBetween('fecha', [$firstDate, $endDate])
                    ->get()
                    ->map(function($item) { return $item->valor; });

        $Egresos = DB::table('ft_egresos')
                    ->select('valor')
                    ->whereBetween('fecha', [$firstDate, $endDate])
                    ->get()
                    ->map(function($item) { return $item->valor; });

        $dataChart->dataSet('Ingresos', 'line', $Ingresos->values())
                ->color('#52E716')
                ->backgroundcolor("#52E716")
                ->fill(false);

        $dataChart->dataset('Egresos', 'line', $Egresos->values())
                ->color('#E73C16')
                ->backgroundcolor("#E73C16")
                ->fill(false);

        $dataChart->title('Ingresos / Egresos');

        if(count($fechas->values())){
            $dataChart->labels($fechas->values());
        }

        return view('informes.informes', ['chart' => $dataChart]);
    }

    public function getLabels($firstDate, $endDate) {
        $Ingresos = DB::table('ft_ingresos')
                    ->select('fecha')
                    ->whereBetween('fecha', [$firstDate, $endDate])
                    ->distinct()
                    ->get()
                    ->map(function($item) { return $item->fecha; });

        $Egresos = DB::table('ft_egresos')
                    ->select('fecha')
                    ->whereBetween('fecha', [$firstDate, $endDate])
                    ->distinct()
                    ->get()
                    ->map(function($item) { return $item->fecha; });

        return $Ingresos->merge($Egresos)->sort()->unique();
    }

}

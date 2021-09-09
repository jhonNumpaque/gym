<?php

namespace App\Http\Controllers;

use App\pago;
use App\plan;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PagoController extends Controller{

    public function storage(Request $request) {
        if( Auth::check() ) {
            $pag = new pago();
            $pag->fecha_pago = $request->fecha;
            $pag->persona = $request->persona;
            $pag->plan = $request->plan;
            $pag->fecha_vec = $request->fecha_vec;

            if ($pag->save()) {
                flash()->overlay('Información guardada correctamente', 'Información')->success();

                return back();
            } else {
                flash()->overlay('Error al guardar la información', 'Alerta')->success();

                return back();
            }
        }  else {
            return redirect('/');
        }
    }


    public function delete($id) {
        if( Auth::check() ) {
            $pag = pago::find($id);

            if($pag->delete($id)){
                flash()->overlay('Información eliminada correctamente', 'Información')->success();

                return back();
            } else {
                flash()->overlay('Error al eliminar la información', 'Alerta')->warning();

                return back();
            }
        } else {
            return redirect('/');
        }
    }

    public function getLastFivePay($persona) {
        if( Auth::check() ) {
            $html = "";
            if (!empty($persona)) {
                $data = pago::getDataLastFive($persona);

                if(count($data) > 0) {
                    foreach ($data as $item) {

                        $objX = explode('-', $item->fecha_pago);
                        $fecha = Carbon::createFromDate($objX[0], $objX[1], $objX[2]);

                        $objF = explode('-', $item->fecha_vec);
                        $fecha_v = Carbon::createFromDate($objF[0], $objF[1], $objF[2]);

                        $html .= "<tr>";
                        $html .= "<td>".$fecha->format('d/m/Y')."</td>";
                        $html .= "<td>".$fecha_v->format('d/m/Y')."</td>";
                        $html .= "<td>$item->plan</td>";
                        $html .= "</tr>";
                    }
                } else {
                    $html = "<tr class='text-center'><td colspan='3'>No hay pagos registrados para este cliente</td></tr>";
                }
            }

            echo $html;
        } else {
            return redirect('/');
        }
    }

    public function getValueTimeDuration ($planId) {
        return plan::getTimeDuration($planId);
    }
}

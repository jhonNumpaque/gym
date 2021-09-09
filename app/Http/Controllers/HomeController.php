<?php

namespace App\Http\Controllers;

use App\pago;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
Use App\persona;
use App\plan;
use App\sede;
use App\tipodoc;
use App\ConfigurationClass;
use Carbon\Carbon;
use DateTime;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public $activos = [];
    public $alerta = [];
    public $inactivos = [];
    public $deads = [];

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(){
        if( Auth::check() ) {
            $per = Persona::where('id', Auth::user()->person)->first();
            session()->put('type_user', $per->tipo == 2);
            if ($per->tipo == 2) {
                return redirect('admin/'.sede::first()->id);
            } else {
                return redirect('ViewUser/'.$per->id);
            }
        } else {
            return redirect('/');
        }
    }

    public function home($id) {
        $this->validateData($id);
        $data = $this->getHtml();
        $xData = persona::getData($id);
        $tipos = tipodoc::get();
        $sedes = sede::get();
        $planes = plan::getData();
        return view('home', ['tipos' => $tipos, 'sedes' => $sedes, 'data' => $data, 'planes' => $planes, 'xData' => $xData]);
    }

    public function validateData($sede) {

        $data = persona::getData($sede);

        foreach ($data as $item) {

            $pago = pago::getMaxPay($item->id);

            if ($pago) {
                $fe = new DateTime($pago->fecha_vec);
                $current = new DateTime("now");
                $diff = $fe->diff($current);
                $diff = ($diff->invert == 1) ? $diff->days  : $diff->days *-1;

                $condiciones = ConfigurationClass::getAllData();

                foreach($condiciones as $con) {
                    $conx = str_replace("{param}", $diff, $con->condicion);
                    $x = eval("return $conx;");

                    if ($x) {
                        switch($con->clase) {
                            case "b_activo": array_push($this->activos, $item); break;
                            case "b_alerta": array_push($this->alerta, $item); break;
                            case "b_inactivo": array_push($this->inactivos, $item); break;
                            case "b_deads": array_push($this->deads, $item); break;
                        }
                    }
                }

            } else {
                array_push($this->inactivos, $item);
            }

        }

    }

    public function getHtml() {
        $html = "";

        $html .= "<div class='row' id='dataPersonas'>";

        $html .= $this->validateDataHtml($this->inactivos);
        $html .= $this->validateDataHtml($this->activos);
        $html .= $this->validateDataHtml($this->alerta);
        $html .= $this->validateDataHtml($this->deads);


        $html .= "</div>";

        return $html;
    }

    public function validateDataHtml ($data) {
        $html = "";
        foreach ($data as $item) {
            $html .= "<div class='col-md-2 col-sm-3 container-image mt-2'>";
            $html .= "<div class='card'>";
            $html .= "<div class='card-header card-header-plan card-plan'>";
            $html .= "<a class='link' href='".url('/ViewUser/'.$item->id)."'>";

            if ($item->foto) {
                $img = asset('../storage/app/public/'.$item->foto);

                $html .= "<img loading='lazy' src='$img' class='img-fluid img-thumbnail rounded mx-auto d-block img-user' />";
            } else {
                $img = "No hay imagen";
                $html .= "<p class='text-center text-white'>$img</p>";
            }

            $html .= "</a>";
            $html .= "</div>";
            $html .= "</div>";

            $pago = pago::getMaxPay($item->id);
            $class = ""; $diff = 0;
            if($pago) {
                $fe = new DateTime($pago->fecha_vec);
                $current = new DateTime("now");

                $diff = $fe->diff($current);

                $diff = ($diff->invert == 1) ? $diff->days  : $diff->days *-1;

                $condiciones = ConfigurationClass::getAllData();

                foreach($condiciones as $con) {
                    $conx = str_replace("{param}", $diff, $con->condicion);
                    $x = eval("return $conx;");

                    if ($x) {
                        $class = $con->clase;
                    }
                }
            } else {
                $class = "b_inactivo";
            }

            $html .= "<div class='card-footer container-footer  $class text-center'>";
            $html .= "<label class='text-center font-medium text text-white'>$item->nombres</label>";
            $html .= "<p class='text-center text font-medium text-white'>Días: $diff</p>";
            $html .= "<p class='icons-card-footer'>";
            $html .= "<a class='fa fa-edit icon-table' title='Modificar' href='".url("DataClient/$item->id")."'></a> ";
            $html .= "<a class='fa fa-trash icon-table' title='Eliminar' href='".url("delete_client/$item->id")."'></a> ";
            $html .= "</p>";
            $html .= "</div>";
            $html .= "</div>";
        }
        return $html;
    }

    public function viewUser($id) {
        error_reporting(E_ALL);

        $per = persona::find($id);
        $pagos = pago::getDataPay($id);
        $data = pago::getMaxPay($per->id);
        $planes = plan::getData();

        if($data) {
            $xObj = explode('-', $data->fecha_pago);
            $fe = new DateTime($data->fecha_vec);
            $current = new DateTime("now");

            $fecha = Carbon::createFromDate($xObj[0], $xObj[1], $xObj[2]);

            $diff = $fe->diff($current);

            $diff = ($diff->invert == 1) ? $diff->days  : $diff->days *-1;

            list($estado, $class) = array('', '');

            $condiciones = ConfigurationClass::getAllData();

            foreach($condiciones as $con) {
                $conx = str_replace("{param}", $diff, $con->condicion);
                $x = eval("return $conx;");

                if ($x) {
                    switch($con->clase) {
                        case "b_activo": $estado = "activo"; $class = "activo"; break;
                        case "b_alerta": $estado = "activo"; $class = "alerta"; break;
                        case "b_inactivo": $estado = "inactivo"; $class = "inactivo"; break;
                        case "b_deads": $estado = "inactivo"; $class = "deads"; break;
                    }
                }
            }
        } else {
            $fecha = Carbon::now();
            $fe = Carbon::now();
            $diff = 0;
            $estado = "inactivo";
            $class = "inactivo";
        }

        $img = "";
        if (!empty($per->foto)) {
            $img = $per->foto;
        }

        return view('user', [ 'data' => $data, 'fecha' => $fecha->format('d/m/Y'), 'fechaN' => $fe->format('d/m/Y'), 'diff' => $diff, 'estado' => $estado, 'class' => $class, 'img' => $img, 'pagos' => $pagos, 'per' => $per, 'planes' => $planes ]);
    }
}

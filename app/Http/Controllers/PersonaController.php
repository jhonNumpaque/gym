<?php

namespace App\Http\Controllers;

use App\ConfigurationClass;
use Illuminate\Http\Request;

use App\persona;
use App\sede;
use App\tipodoc;
use App\User;
use App\pago;
use App\plan;
use Carbon\Carbon;
use DateTime;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class PersonaController extends Controller {

    public function delete($id) {
        if( Auth::check() ) {
            $per = persona::find($id);

            $xPagos = pago::where('persona', $id)->get();

            if(!empty($xPagos)) { pago::where('persona', $id)->delete(); }

            $user = User::where('person', $id)->first();

            if(!empty($user) && $user != null) {
                DB::table('users')->where('id', $user->id)->delete();
            }

            if (!empty($per->foto)) {
                if (file_exists(storage_path("public").'\\app\\'.$per->foto)) {
                    unlink(storage_path("public").'\\app\\'.$per->foto);
                }
            }

            if($per->delete($id)){
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

    public function getData(Request $request) {
        if( Auth::check() ) {
            $per = persona::find($request->id);
            return response()->json(json_encode($per), 200);
        } else {
            return response()->json('No tiene acceso', 404);
        }
    }

    public function edit($id) {
        if( Auth::check() ) {
            $tipos = tipodoc::get();
            $sedes = sede::get();
            $data = persona::find($id);

            $img = "";

            if (!empty($data->foto)) {
                $img = $data->foto;
            }

            return view('persona.edit', ['tipos' => $tipos, 'sedes' => $sedes, 'data' => $data, 'img' => $img]);
        } else {
            return redirect('/');
        }
    }

    public function update(Request $request) {
        if( Auth::check() ) {
            $per = persona::find($request->id);
            $per->nombres = $request->name;
            $per->tipo_doc = $request->tipodoc;
            $per->documento = $request->documento;
            $per->direccion = $request->direccion;
            $per->rh = $request->rh;
            $per->fecha_nac = $request->fecha;
            $per->sede = $request->sede;
            $per->tipo = 1;
            $per->email = $request->email;
            $per->observaciones = $request->observaciones;
            $per->telefono = $request->telefono;

            if (!empty($request->file('foto'))) {

                $image = $request->file;
                $image = str_replace('data:image/png;base64,', '', $image);
                $image = str_replace(' ', '+', $image);
                $imageName = uniqid().'.'.$request->fileType;
                File::put(storage_path("app").'/public/'.$imageName, base64_decode($image));

                $per->foto = $imageName;
            } else {
                $per->foto = '';
            }

            if ($per->save()) {
                flash()->overlay('Información guardada correctamente', 'Información')->success();

                return redirect('home');
            } else {
                flash()->overlay('Error al guardar la información', 'Alerta')->success();

                return redirect('home');
            }
        } else {
            return redirect('/');
        }
    }

    public function filter(string  $param) {
        if( Auth::check() ) {
            $data = persona::getDataLike($param);
            $html = "";

            $html .= "<div class='row' id='dataPersonas'>";

            foreach ($data as $item) {

                $html .= "<div class='col-md-2 col-sm-3 container-image mt-2'>";
                $html .= "<div class='card'>";
                $html .= "<div class='card-header card-header-plan card-plan'>";
                $html .= "<a class='link' href='".url('ViewUser/'.$item->id)."'>";

                if ($item->foto) {
                    $img = url('../storage/app/public/'.$item->foto);
                    $html .= "<img loading='lazy' src='$img' class='img-fluid img-thumbnail rounded mx-auto d-block img-user'  />";
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

                $html .= "<div class='card-footer $class text-center container-footer'>";
                $html .= "<label class='text-center font-medium text text-white'>$item->nombres</label>";
                $html .= "<p class='text-center text font-medium text-white'>Días: $diff</p>";
                $html .= "<p class='icons-card-footer'>";
                $html .= "<a class='fa fa-edit icon-table icon-footer' title='Modificar' href='DataClient/$item->id'></a>";
                $html .= "<a class='fa fa-trash icon-table icon-footer' title='Eliminar' href='delete_client/$item->id'></a>";
                $html .= "</p>";
                $html .= "</div>";
                $html .= "</div>";
            }

            $html .= "</div>";

            return $html;
        } else {
            return 'No tiene acceso';
        }
    }

    public function registerView() {
        $tipos = tipodoc::get();
        $sedes = sede::get();

        return view('persona.register', ['tipos' => $tipos, 'sedes' => $sedes]);
    }

    public function getReportUsers() {
        $html = "";
        $html .= "<!DOCTYPE html>";
        $html .= "<html>";
        $html .= "\n\t<head>";
        $html .= "\n\t\t<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />";
        $html .= "\n\t\t<title>Reporte de usuarios</title>";
        $html .= "\n\t\t<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet' />";
        $html .= "\n\t</head>";
        $html .= "\n\t<body>";
        $html .= "\n\t\t<table border='1' style='width: 100%;'>";
        $html .= "\n\t\t\t<thead>";
        $html .= "\n\t\t\t\t<tr>";
        $html .= "\n\t\t\t\t\t<th colspan='13' style='text-align: center;'>Listado de Clientes</th>";
        $html .= "\n\t\t\t\t</tr>";
        $html .= "\n\t\t\t\t<tr>";
        $html .= "\n\t\t\t\t\t<th>Nombres</th>";
        $html .= "\n\t\t\t\t\t<th>Tipo documento</th>";
        $html .= "\n\t\t\t\t\t<th>Documento</th>";
        $html .= "\n\t\t\t\t\t<th>Rh</th>";
        $html .= "\n\t\t\t\t\t<th>Dirección</th>";
        $html .= "\n\t\t\t\t\t<th>Email</th>";
        $html .= "\n\t\t\t\t\t<th>Fecha nacimiento</th>";
        $html .= "\n\t\t\t\t\t<th>Sede</th>";
        $html .= "\n\t\t\t\t\t<th>Fecha último pago</th>";
        $html .= "\n\t\t\t\t\t<th>Fecha vencimiento pago</th>";
        $html .= "\n\t\t\t\t\t<th>Último plan seleccionado</th>";
        $html .= "\n\t\t\t\t\t<th>Dias de vigencia</th>";
        $html .= "\n\t\t\t\t\t<th>Estado</th>";
        $html .= "\n\t\t\t\t</tr>";
        $html .= "\n\t\t\t</thead>";
        $html .= "\n\t\t\t<tbody>";

        $data = persona::getDataUser();

        foreach ($data as $item) {
            $pago = pago::getMaxPay($item->id);

            $class = ""; $diff = 0; $color = "";

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
                        switch($con->clase) {
                            case "b_activo": $class = "activo";  $color = "#64de64"; break;
                            case "b_alerta": $class = "alerta"; $color = "#dada43"; break;
                            case "b_inactivo": $class = "inactivo"; $color = "#ef4c4c"; break;
                            case "b_deads": $class = "dead"; $color = "#64de64"; break;
                        }
                    }
                }

                if ($pago->fecha_pago) {
                    $fx =  explode('-', $pago->fecha_pago);
                    $f = Carbon::createFromDate($fx[0], $fx[1], $fx[2]);
    
                    $fecha = $f->format('d/m/Y');
    
                    $fv = explode('-', $pago->fecha_vec);
                    $ff = Carbon::createFromDate($fv[0], $fv[1], $fv[2]);
    
                    $fecha_v = $ff->format('d/m/Y');
    
                    $dd = $diff;
    
                    $plan = $pago->plan;   
                }
            } else {
                $class = "inactivo";
                $fecha = 0;
                $dd = 0;
                $plan = "Ninguno";
                $fecha_v = 0;
                $color = "#de2d2d";
            }

            $html .= "\n\t\t\t\t<tr style='background-color: $color;'>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->nombres</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->tipo</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->documento</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->rh</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->direccion</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->email</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->fecha</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->sede</td>";

            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>".$fecha."</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>".$fecha_v."</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$plan</td>";
            $html .= "\n\t\t\t\t\t<th style='font-size: 12px;'>$dd</th>";
            $html .= "\n\t\t\t\t\t<th style='font-size: 12px;'>$class</th>";
            $html .= "\n\t\t\t\t</tr>";

        }

        $html .= "\n\t\t\t</tbody>";
        $html .= "\n\t\t</table>";
        $html .= "\n\t</body>";
        $html .= "</html>";

        $filename = "listado_clientes.xls";

        header("Content-Disposition: attachment; filename=\"$filename\"");
        header("Content-Type: application/vnd.ms-excel");

        echo $html;
    }

    public function registerPerson(Request $request) {
        $this->validator($request->all())->validate();

        $per = new persona();
        $per->nombres = $request->name;
        $per->tipo_doc = $request->tipodoc;
        $per->documento = $request->documento;
        $per->direccion = $request->direccion;
        $per->rh = $request->rh;
        $per->fecha_nac = $request->fecha;
        $per->sede = $request->sede;
        $per->tipo = 1;
        $per->email = $request->email;
        $per->observaciones = $request->observaciones;
        $per->telefono = $request->telefono;

        if (!empty($request->file('foto'))) {

            $image = $request->file;
            $image = str_replace('data:image/png;base64,', '', $image);
            $image = str_replace(' ', '+', $image);
            $imageName = uniqid().'.'.$request->fileType;
            File::put(storage_path("app").'/public/'.$imageName, base64_decode($image));

            $per->foto = $imageName;
        } else {
            $per->foto = '';
        }

        if ($per->save()) {
            if ($request->register_user) {
                event(new Registered($user = $this->create($request->all())));

                $user->id = $user->id;
                $user->person = $per->id;
                $user->documento = $per->documento;
                $user->save();

                $this->guard();
            }

            flash()->overlay('Información guardada correctamente.', 'Información');

            return redirect('home');

        } else {

            flash()->overlay('La información no se pudo guardar correctamente.', 'Alerta');

            return back();
        }
    }

    protected function validator(array $data) {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'tipodoc' => [ 'required', 'int' ],
            'documento' => [ 'required', 'int', 'min:9', 'unique:users'],
            'direccion' => [ 'required', 'string', 'min:5' ],
            'fecha' => [ 'required', 'date'],
            'observaciones' => [ 'string', 'min:1', 'max:500' ]
        ]);
    }

    protected function create(array $data) {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);
    }

    protected function guard() {
        return Auth::guard();
    }

    public function getReportUsersWithPay() {
        $html = "";
        $html .= "<!DOCTYPE html>";
        $html .= "<html>";
        $html .= "\n\t<head>";
        $html .= "\n\t\t<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />";
        $html .= "\n\t\t<title>Reporte de usuarios</title>";
        $html .= "\n\t\t<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet' />";
        $html .= "\n\t</head>";
        $html .= "\n\t<body>";
        $html .= "\n\t\t<table border='1' style='width: 100%;'>";
        $html .= "\n\t\t\t<thead>";
        $html .= "\n\t\t\t\t<tr>";
        $html .= "\n\t\t\t\t\t<th colspan='8' style='text-align: center;'>Listado de Pagos por Cliente</th>";
        $html .= "\n\t\t\t\t</tr>";
        $html .= "\n\t\t\t\t<tr>";
        $html .= "\n\t\t\t\t\t<th>Nombres</th>";
        $html .= "\n\t\t\t\t\t<th>Tipo documento</th>";
        $html .= "\n\t\t\t\t\t<th>Documento</th>";
        $html .= "\n\t\t\t\t\t<th>Rh</th>";
        $html .= "\n\t\t\t\t\t<th>Dirección</th>";
        $html .= "\n\t\t\t\t\t<th>Email</th>";
        $html .= "\n\t\t\t\t\t<th>Fecha nacimiento</th>";
        $html .= "\n\t\t\t\t\t<th>Sede</th>";
        $html .= "\n\t\t\t\t</tr>";
        $html .= "\n\t\t\t</thead>";
        $html .= "\n\t\t\t<tbody>";

        $data = persona::getDataUser();

        foreach ($data as $item) {
            $html .= "\n\t\t\t\t<tr>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->nombres</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->tipo</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->documento</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->rh</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->direccion</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->email</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->fecha</td>";
            $html .= "\n\t\t\t\t\t<td style='font-size: 12px;'>$item->sede</td>";

            $html .= "\n\t\t\t\t</tr>";

            $pagos = pago::getDataPayWithPerson($item->id);

            if (count($pagos) > 0) {

                $html .= "\n\t\t\t\t<tr>";
                $html .= "\n\t\t\t\t\t<th>#</th>";
                $html .= "\n\t\t\t\t\t<th>Fecha de Pago</th>";
                $html .= "\n\t\t\t\t\t<th>Fecha de Vencimiento</th>";
                $html .= "\n\t\t\t\t\t<th>Vigencia en días</th>";
                $html .= "\n\t\t\t\t\t<th>Vigencia en Meses</th>";
                $html .= "\n\t\t\t\t\t<th>Plan</th>";
                $html .= "\n\t\t\t\t\t<th>Valor Plan</th>";
                $html .= "\n\t\t\t\t\t<th>Valor Total Pagado</th>";
                $html .= "\n\t\t\t\t</tr>";

                $i = 0;

                foreach ( $pagos as $pago) {

                    $i++;

                    $xFp = explode('-', $pago->fecha_pago);
                    $ffp = Carbon::createFromDate($xFp[0], $xFp[1], $xFp[2]);

                    $xFv = explode('-', $pago->fecha_vec);
                    $ffv = Carbon::createFromDate($xFv[0], $xFv[1], $xFv[2]);

                    $dataPlan = plan::where('id', $pago->planId)->first();

                    $ddMeses = $ffv->diffInMonths($ffp);

                    $ddDias = $ffv->diffInDays($ffp);

                    $valorTotal = $dataPlan->valor * $ddMeses;

                    $html .= "\n\t\t\t\t<tr>";
                    $html .= "\n\t\t\t\t\t<td>$i</td>";
                    $html .= "\n\t\t\t\t\t<td>". $ffp->format('d/m/Y') ."</td>";
                    $html .= "\n\t\t\t\t\t<td>". $ffv->format('d/m/Y') ."</td>";
                    $html .= "\n\t\t\t\t\t<td style='text-align: right;'>$ddDias</td>";
                    $html .= "\n\t\t\t\t\t<td style='text-align: right;'>$ddMeses</td>";
                    $html .= "\n\t\t\t\t\t<td >$pago->plan</td>";
                    $html .= "\n\t\t\t\t\t<td style='text-align: right;'>$dataPlan->valor</td>";
                    $html .= "\n\t\t\t\t\t<td style='text-align: right;'>$valorTotal</td>";
                    $html .= "\n\t\t\t\t</tr>";
                }

            } else {
                $html .= "\n\t\t\t\t<tr>";
                $html .= "\n\t\t\t\t\t<th colspan='8' style='text-align: center'>No tiene pagos realizados</th>";
                $html .= "\n\t\t\t\t</tr>";
            }

        }

        $html .= "\n\t\t\t</tbody>";
        $html .= "\n\t\t</table>";
        $html .= "\n\t</body>";
        $html .= "</html>";

        $filename = "listado_clientes_pago.xls";

        header("Content-Disposition: attachment; filename=\"$filename\"");
        header("Content-Type: application/vnd.ms-excel");

        echo $html;
    }
}

<?php

namespace App\Http\Controllers;

use App\Concepto;
use App\Ingreso;
use Illuminate\Http\Request;

class IngresoController extends Controller {

    public function index() {
        $con = Concepto::orderby('nombre', 'asc')->get();
        $data = Ingreso::getData();
        return view('ingreso.index', [ 'con' => $con, 'data' => $data]);
    }

    public function save(Request $request) {
        if($request->id){
            $obj = Ingreso::find($request->id);
            $obj->fecha = $request->fecha;
            $obj->valor = $request->valor;
            $obj->concepto = $request->concepto;

            if ($obj->save()) {
                flash()->overlay('Información actualizada correctamente.', 'Información');
            } else {
                flash()->overlay('La información no se pudo guardar correctamente.', 'Alerta');
            }
        } else {
            $obj = new Ingreso();
            $obj->fecha = $request->fecha;
            $obj->valor = $request->valor;
            $obj->concepto = $request->concepto;

            if ($obj->save()) {
                flash()->overlay('Información guardada correctamente.', 'Información');
            } else {
                flash()->overlay('La información no se pudo guardar correctamente.', 'Alerta');
            }
        }

        return back();
    }

    public function edit(Request $request) {
        $obj = Ingreso::find($request->id);
        $obj->fecha = $request->fecha;
        $obj->valor = $request->valor;
        $obj->concepto = $request->concepto;

        if ($obj->save()) {
            flash()->overlay('Información actualizada correctamente.', 'Información');
        } else {
            flash()->overlay('La información no se pudo guardar correctamente.', 'Alerta');
        }
        return back();
    }

    public function delete($id) {
        $obj = Ingreso::find($id);
        if ($obj->delete()) {
            flash()->overlay('Información eliminada correctamente.', 'Información');
        } else {
            flash()->overlay('La información no se pudo eliminaar correctamente.', 'Alerta');
        }
        return back();
    }

    public function getDataById($id) {
        return response()->json(json_encode(Ingreso::find($id)));
    }
}

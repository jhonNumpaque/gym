<?php

namespace App\Http\Controllers;

use App\Concepto;
use App\Egreso;
use Illuminate\Http\Request;

class EgresoController extends Controller {
    public function index() {
        $con = Concepto::get();
        $data = Egreso::getData();
        return view('egreso.index', [ 'con' => $con, 'data' => $data]);
    }

    public function save(Request $request) {
        if ($request->id) {
            $this->edit($request);
        } else {
            $obj = new Egreso();
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
        $obj = Egreso::find($request->id);
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
        $obj = Egreso::find($id);
        if ($obj->delete()) {
            flash()->overlay('Información eliminada correctamente.', 'Información');
        } else {
            flash()->overlay('La información no se pudo eliminaar correctamente.', 'Alerta');
        }
        return back();
    }

    public function getDataById($id) {
        return response()->json(json_encode(Egreso::find($id)));
    }
}

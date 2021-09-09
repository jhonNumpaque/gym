<?php

namespace App\Http\Controllers;

use App\Concepto;
use App\Egreso;
use App\Ingreso;
use Illuminate\Http\Request;

class ConceptoController extends Controller {

    public function index() {
        $data = Concepto::orderby('id', 'desc')->paginate(10);

        return view('conceptos.index', ['data' => $data]);
    }

    public function store(Request $request) {
        if ($request->id) {
            $con = Concepto::find($request->id);
            $con->nombre = $request->nombre;
            if ($con->save()) {
                flash()->overlay('Información actualizada correctamente.', 'Información');
            } else {
                flash()->overlay('La información no se pudo guardar correctamente.', 'Alerta');
            }
        } else {
            $con = new Concepto();
            $con->nombre = $request->nombre;
            if ($con->save()) {
                flash()->overlay('Información guardada correctamente.', 'Información');
            } else {
                flash()->overlay('La información no se pudo guardar correctamente.', 'Alerta');
            }
        }

        return back();
    }

    public function update(Request $request) {
        $con = Concepto::find($request->id);
        $con->nombre = $request->nombre;
        if ($con->save()) {
            flash()->overlay('Información actualizada correctamente.', 'Información');
        } else {
            flash()->overlay('La información no se pudo guardar correctamente.', 'Alerta');
        }
        return back();
    }

    public function delete($id) {
        $con = Concepto::find($id);

        $ing = Ingreso::where('concepto', $id)->get();

        if (count($ing) > 0) {
            Ingreso::where('concepto', $id)->delete();
        }

        $egr = Egreso::where('concepto', $id)->get();

        if (count($egr) > 0) {
            Egreso::where('concepto', $id)->delete();
        }

        if ($con->delete()) {
            flash()->overlay('Información eliminada correctamente.', 'Información');
        } else {
            flash()->overlay('La información no se pudo eliminaar correctamente.', 'Alerta');
        }
        return back();
    }

    public function getDataById($id) {
        return response()->json(json_encode(Concepto::find($id)));
    }
}

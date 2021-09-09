<?php

namespace App\Http\Controllers;

use App\Mail\MailNotify;
use App\persona;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class NotificacionController extends Controller {

    public function index(Request $request){
        if( Auth::check() ) {
            $data = DB::table('ft_persona as per')
                    ->leftJoin('ft_tipo_doc as tpd', 'per.tipo_doc', 'tpd.id')
                    ->leftJoin('ft_sede as sed', 'per.sede', 'sed.id')
                    ->where('per.tipo', 1)
                    ->select('per.id', 'per.nombres as nombres', 'tpd.nombre as tipo',
                    'per.documento', 'per.rh', 'per.direccion', 'per.email', 'per.fecha_nac as fecha',
                    'sed.nombre as sede')
                    ->get();
            return view('email.index', [ 'data' => $data ]);
        } else {
            return redirect('/login');
        }
    }

    public function sendEmail(Request $request) {
        if( Auth::check() ) {
            $per = persona::find($request->cliente);
            $data = [
                'name' => $per->nombres,
                'message' => $request->mensaje,
                'subject' => $request->motivo,
                'from' => 'info@gymfitzone.com.co',
                'from_name' => 'Gym FitZone'
            ];

            Mail::to($per->email, 'Chappie')->send(new MailNotify($data));
            flash()->overlay('Información', 'Mensaje enviado correctamente');

            return redirect('back');
        } else {
            return redirect('/login');
        }
    }
}

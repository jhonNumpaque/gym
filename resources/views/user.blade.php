@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Usuario</div>
                <div class="card-body">
                    <div class="text-center my-3 mb-2">
                        <img loading="lazy" src="{{ url('../storage/app/public/'.$img) }}" style="height: 300px;">
                    </div>
                    <p class="text-center"> {{ $per->nombres }} </p>
                    @if($per->telefono)
                    <p class="text-center"> Telefono: {{ $per->telefono }} </p>
                    @endif
                    @if($data)
                        <p class="text-center {{ $class }}"> Su estado es {{ $estado }} </p>
                        <p class="text-center"> Su último pago fue {{ $fecha }} </p>
                        <p class="text-center"> Su fecha de vencimiento es {{ $fechaN }} </p>
                        <p class="text-center"> Le quedan {{ $diff }} días de su plan </p>
                    @else
                        <p class="text-center">Ud no tiene pagos registrados!!</p>
                    @endif
                    @if(session()->get('type_user'))
                        @if(session()->get('type_user') == 2)
                            <form action="{{ route('SavePay') }}" method="post">
                                @csrf
                                <input type="hidden" name="persona" id="personaId" value="{{ $per->id }}">
                                <div class="row align-items-center">
                                    <input type="hidden" name="duracion" id="duracion">
                                    <div class="col-md-5 my-1">
                                        <select name="plan" id="plan" class="form-control">
                                            <option value="">Plan</option>
                                            @foreach ($planes as $item)
                                                <option value="{{ $item->id }}">{{ $item->nom.' '.$item->dur.' '.$item->valor  }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-3 my-1">
                                        <input type="date" name="fecha" id="fecha" class="form-control" placeholder="Fecha de pago" title="Fecha de pago">
                                    </div>
                                    <div class="col-md-3 my-1">
                                        <input type="date" name="fecha_vec" id="fecha_vec" class="form-control" placeholder="Fecha de Vencimiento" title="Fecha de Vencimiento">
                                    </div>
                                    <div class="col-md-1 my-1">
                                        <button type="submit" class="btn btn-success"><i class="fa fa-save"></i></button>
                                    </div>
                                </div>
                            </form>
                        @endif
                    @endif
                    <div class="table-responsive mt-2">
                        <p class="text-center">Listado de pagos realizados</p>
                        <table class="table table-hovertable table-hover table-striped table-hover table-bordered" id="tbPays">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Fecha Pago</th>
                                    <th>Fecha Vencimiento</th>
                                    <th>Plan</th>
                                    @if(session()->get('type_user'))
                                        @if(session()->get('type_user') == 2)
                                            <th style="width: 5%;"></th>
                                        @endif
                                    @endif
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($pagos as $item)
                                    <tr>
                                        <td>{{ $item->fecha_p }}</td>
                                        <td>{{ $item->fecha_v }}</td>
                                        <td>{{ $item->plan }}</td>
                                        @if(session()->get('type_user'))
                                            @if(session()->get('type_user') == 2)
                                                <th class="text-center">
                                                    <a class='fa fa-trash icon-table' title='Eliminar' href='{{ url("EliminarPago/".$item->id) }}'></a>
                                                </th>
                                            @endif
                                        @endif
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="justify-content-center">
                        {{ $pagos->links('vendor.pagination.bootstrap-4') }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

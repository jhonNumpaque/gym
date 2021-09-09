@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Egresos</div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4 p-2">
                            <form action="{{ route('GuardarEgreso') }}" method="post">
                                @csrf
                                <input type="hidden" name="id" id="id">
                                <div class="form-group row">
                                    <label for="" class="col-form-label col-md-3">Conceptos:</label>
                                    <div class="col-md-9">
                                        <select name="concepto" id="concepto" class="form-control" required>
                                            @if(count($con) > 0)
                                                <option value="">Seleccione concepto</option>
                                                @foreach ($con as $item)
                                                    <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                                @endforeach
                                            @else
                                                <option value="">No hay registros</option>
                                            @endif
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="" class="col-form-label col-md-3">Fecha:</label>
                                    <div class="col-md-9">
                                        <input type="date" name="fecha" id="fecha_i" class="form-control" autocomplete="off" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="" class="col-form-label col-md-3">Valor:</label>
                                    <div class="col-md-9">
                                        <input type="number" name="valor" id="valor" class="form-control" autocomplete="off" placeholder="Valor" step="0000000000.00" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="" class="col-form-label col-md-10"></label>
                                    <div class="col-md-2 text-md-right">
                                        <button type="submit" class="btn btn-success" title="Registrar"><i class="fa fa-save"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-8">
                            <div class="table-resposive mt-2">
                                <table class="table table-hovertable table-hover table-striped table-hover table-bordered" id="tbConceptos">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Concepto</th>
                                            <th>Fecha</th>
                                            <th>Valor</th>
                                            <th style="width: 15%"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @if(count($data) > 0)
                                            @foreach ($data as $item)
                                                <tr>
                                                    <td>{{ $item->concepto }}</td>
                                                    <td>{{ $item->fecha }}</td>
                                                    <td class="text-right">$ {{ number_format($item->valor, 2, ',', '.') }}</td>
                                                    <td class="text-center">
                                                        <a class='fa fa-edit icon-table' title='Modificar' href='javascript:getDataEgreso({{ $item->id }})'></a>
                                                        <a class='fa fa-trash icon-table' title='Eliminar' href='EliminarEgreso/{{ $item->id }}'></a>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        @else
                                            <tr>
                                                <td colspan="4" class="text-center">No existen registros</td>
                                            </tr>
                                        @endif
                                    </tbody>
                                </table>
                            </div>
                            <div class="justify-content-center">
                                {{ $data->links('vendor.pagination.bootstrap-4') }}
                            </div>
                        </div>
                        <div class="col-md-8 text-left form-row">
                            {{-- <div class="col-auto my-2 p-0">
                                <a class="btn btn-success" title="Registrar" href="{{ route('registerUser') }}" title="Registrar cliente"><i class="fas fa-plus"></i></a>
                            </div>
                            <div class="col-auto my-2 p-0 ml-2">
                                <a class="btn btn-success" title="Descargar informe de clientes" href="{{ url('getInform') }}" title="Registrar cliente" target="_blank"><i class="fas fa-download"></i></a>
                            </div> --}}
                        </div>
                        {{-- <div class="col-md-4 text-left">
                            <div class="form-row align-items-center">
                                <div class="col-auto my-2">Filtro:</div>
                                <div class="col-auto my-2">
                                    <input type="text" class="form-control" placeholder="Filtro" id="filtro" style="width: 235px;" />
                                </div>
                                <div class="col-auto my-2 text-md-right">
                                    <a class="btn btn-success" title="Recargar" href="javascript:window.location.reload()"><i class='fas fa-redo'></i></a>
                                </div>
                            </div>
                        </div> --}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

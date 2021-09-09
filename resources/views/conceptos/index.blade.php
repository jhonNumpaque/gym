@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Conceptos</div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4 p-2">
                            <form action="{{ route('SaveConcept') }}" method="post">
                                @csrf
                                <input type="hidden" name="id" id="id">
                                <div class="form-group row">
                                    <label for="" class="col-form-label col-md-3">Nombre:</label>
                                    <div class="col-md-9">
                                        <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Nombre" autocomplete="off" required>
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
                                            <th>Nombre</th>
                                            <th style="width: 15%"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @if(count($data) > 0)
                                            @foreach ($data as $item)
                                                <tr>
                                                    <td>{{ $item->nombre }}</td>
                                                    <td class="text-center">
                                                        <a class='fa fa-edit icon-table' title='Modificar' href='javascript:getDataConcept({{ $item->id }})'></a>
                                                        <a class='fa fa-trash icon-table' title='Eliminar' href='DeleteConcept/{{ $item->id }}'></a>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        @else
                                            <tr>
                                                <td colspan="2" class="text-center">No existen registros</td>
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

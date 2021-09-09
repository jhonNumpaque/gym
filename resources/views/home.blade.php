@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <div class="row">
                        <div class="col-md-8 text-left form-row">
                            <div class="col-auto my-2 p-0">
                                <a class="btn btn-success" title="Registrar" href="{{ route('registerUser') }}" title="Registrar cliente"><i class="fas fa-plus"></i></a>
                            </div>
                            <div class="col-auto my-2 p-0 ml-2">
                                <a class="btn btn-success" title="Descargar informe de clientes" href="{{ url('getInform') }}" title="Registrar cliente" target="_blank"><i class="fas fa-download"></i></a>
                            </div>
                        </div>
                        <div class="col-md-4 text-left">
                            <div class="form-row align-items-center">
                                <div class="col-auto my-2">Filtro:</div>
                                <div class="col-auto my-2">
                                    <input type="text" class="form-control" placeholder="Filtro" id="filtro" style="width: 235px;" />
                                </div>
                                <div class="col-auto my-2">
                                    <a class="btn btn-success" title="Recargar" href="javascript:window.location.reload()"><i class='fas fa-redo'></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="table-resposive mt-2">
                        <ul class="nav nav-tabs" role="tablist" id="tabListContent">
                            @foreach($sedes as $sede)
                                <li class="nav-item" onclick="window.location = '{{ url('/admin/'.$sede->id) }}'">
                                    <a class="nav-link {{ Request::is('admin/'.$sede->id) == 'admin/'.$sede->id ? 'active' : '' }}" id="profile-tab" data-toggle="tab" href="{{ '#home'.$sede->id }}" role="tab" aria-controls="profile" aria-selected="false">{{ $sede->nombre }}</a>
                                </li>
                            @endforeach
                        </ul>
                        <div class="tab-content" id="TabContent">
                            @foreach($sedes as $sede)
                                <div class="tab-pane fade {{ $sede->id == 1 ? 'show active' : '' }}" id="home{{ $sede->id }}" role="tabpanel" aria-labelledby="profile-tab">
                                    {!! $data !!}
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="justify-content-center" id="pagging">
                    {{ $xData->links('vendor.pagination.bootstrap-4') }}
                </div>
            </div>
        </div>
        @include('persona/pago')
    </div>
</div>
@endsection

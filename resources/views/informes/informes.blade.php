@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Informes</div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form action="{{ url('ChartIngresos') }}" method="get" class="form-inline">
                                <div class="form-group row mx-sm-3 mb-2">
                                    <label class="col-form-label">Fecha Inicial:</label>
                                    <div class="col-md-2">
                                        <input type="date" name="fechaInicial" id="fechaInicial" class="form-control" onchange="javsacript:sum_info()">
                                    </div>
                                </div>
                                <div class="form-group row mb-2">
                                    <label class="col-form-label">Fecha Final:</label>
                                    <div class="col-md-2">
                                        <input type="date" name="fechaFinal" id="fechaFinal" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row mb-2 mx-sm-3">
                                    <button type="submit" class="btn btn-success"><i class="fas fa-sync"></i></button>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-12">
                            {!! $chart->container(); !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js" charset="utf-8"></script>
    {!! $chart->script() !!}
</div>
@endsection


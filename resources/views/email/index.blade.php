@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Notificaciones</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('Send') }}" enctype='multipart/form-data'>
                        @csrf

                        <div class="form-group row">
                            <label for="subject" class="col-md-4 col-form-label text-md-right">Motivo</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control @error('subject') is-invalid @enderror" name="subject" required autocomplete="name" autofocus>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="tipodoc" class="col-md-4 col-form-label text-md-right">Cliente</label>

                            <div class="col-md-6">
                                <select id="cliente" class="form-control @error('cliente') is-invalid @enderror" name="cliente" required >
                                    <option value="">Cliente</option>
                                    @foreach ($data as $item)
                                    <option value="{{ $item->id }}">{{ $item->nombres }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>


                        <div class="form-group row">
                            <label for="mensaje" class="col-md-4 col-form-label text-md-right">{{ __('auth.Observations') }}</label>

                            <div class="col-md-6">
                                <textarea id="mensaje" style="height: 400px;" class="form-control @error('mensaje') is-invalid @enderror" name="mensaje" autocomplete="mensaje"></textarea>

                                @error('mensaje')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    Enviar
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

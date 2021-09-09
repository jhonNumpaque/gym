@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{ __('auth.Edit') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('UpdateClient') }}" enctype='multipart/form-data'>
                        @csrf

                        <input type="hidden" name="id" id="id" value="{{ $data->id }}">

                        @if ($img)
                            <div class="form-group row">
                                <label for="foto" class="col-md-4 col-form-label text-md-right"></label>

                                <div class="col-md-6">
                                    <img src="{{ url('../storage/app/public/'.$img) }}" class="img-fluid img-thumbnail rounded mx-auto d-block">
                                </div>
                            </div>
                        @endif

                        <div class="form-group row">
                            <label for="foto" class="col-md-4 col-form-label text-md-right">{{ __('auth.Pic') }}</label>

                            <div class="col-md-6">
                                <input id="foto" type="file" class="form-control @error('foto') is-invalid @enderror" name="foto" autocomplete="foto" autofocus>

                                @error('foto')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror

                                <div class="container-fluid row">
                                    <div class="img-container col-12">
                                        <img id="image-user" alt="">
                                        <input type="hidden" class="hidden" id="file" name="file">
                                        <input type="hidden" id="fileType" name="fileType">
                                    </div>
                                    <div class="col-12">
                                        <div class="img-preview"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('auth.Name') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ $data->nombres }}" required autocomplete="name" autofocus>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="tipodoc" class="col-md-4 col-form-label text-md-right">{{ __('auth.TypeDoc') }}</label>

                            <div class="col-md-6">
                                <select id="tipodoc" type="number" class="form-control @error('tipodoc') is-invalid @enderror" name="tipodoc" required >
                                    <option value="">Tipo de documento</option>
                                    @foreach ($tipos as $item)
                                        <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="documento" class="col-md-4 col-form-label text-md-right">{{ __('auth.Doc') }}</label>

                            <div class="col-md-6">
                                <input id="documento" type="text" class="form-control @error('documento') is-invalid @enderror" name="documento" value="{{ $data->documento }}" required autocomplete="documento" autofocus>

                                @error('documento')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="direccion" class="col-md-4 col-form-label text-md-right">{{ __('auth.Address') }}</label>

                            <div class="col-md-6">
                                <input id="direccion" type="text" class="form-control @error('direccion') is-invalid @enderror" name="direccion" value="{{ $data->direccion }}" required autocomplete="direccion" autofocus>

                                @error('direccion')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="telefono" class="col-md-4 col-form-label text-md-right">Telefono</label>

                            <div class="col-md-6">
                                <input id="telefono" type="text" class="form-control @error('telefono') is-invalid @enderror" name="telefono" value="{{ $data->telefono }}" required autocomplete="telefono" autofocus>

                                @error('telefono')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="rh" class="col-md-4 col-form-label text-md-right">{{ __('auth.RH') }}</label>

                            <div class="col-md-6">
                                <select id="rh" class="form-control @error('rh') is-invalid @enderror" name="rh" required >
                                    <option value="">RH</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="fechaNac" class="col-md-4 col-form-label text-md-right">{{ __('auth.Date') }}</label>

                            <div class="col-md-6">
                                <input id="fechaNac" type="date" class="form-control @error('fecha') is-invalid @enderror" name="fecha" value="{{ $data->fecha_nac }}" required autocomplete="fecha">

                                @error('fecha')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="sede" class="col-md-4 col-form-label text-md-right">{{ __('auth.Campus') }}</label>

                            <div class="col-md-6">
                                <select id="sede" type="number" class="form-control @error('sede') is-invalid @enderror" name="sede" required >
                                    <option value="">Sede</option>
                                    @foreach ($sedes as $item)
                                        <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('auth.Email') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ $data->email }}" required autocomplete="email">

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="observaciones" class="col-md-4 col-form-label text-md-right">{{ __('auth.Observations') }}</label>

                            <div class="col-md-6">
                                <textarea id="observaciones" class="form-control @error('observaciones') is-invalid @enderror" name="observaciones" autocomplete="observaciones">{{ $data->observaciones }}</textarea>

                                @error('observaciones')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('auth.Edit') }}
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


<!-- Modal -->
<div class="modal fade" id="pago" tabindex="-1" role="dialog" aria-labelledby="pagoLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      	<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="pagoLabel">Pagos</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
                    <form action="{{ route('SavePay') }}" method="post">
                        @csrf
                        <input type="hidden" name="persona" id="personaId">
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
                                <input type="date" name="fecha" id="fecha" class="form-control" placeholder="Fecha de pago" title="Fecha de pago" onchange="javascript:sum();">
                            </div>
                            <div class="col-md-3 my-1">
                                <input type="date" name="fecha_vec" id="fecha_vec" class="form-control" placeholder="Fecha de Vencimiento" title="Fecha de Vencimiento">
                            </div>
                            <div class="col-md-1 my-1">
                                <button type="submit" class="btn btn-success"><i class="fa fa-save"></i></button>
                            </div>
                        </div>
                    </form>
                    <div class="table-responsive mt-2">
                        <p class="text-center">Listado de los últimos cinco pagos realizados</p>
                        <table class="table table-hovertable table-hover table-striped table-hover table-bordered" id="tbPays">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Fecha de último pago</th>
                                    <th>Fecha Plan</th>
                                    <th>Plan</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</div>
      	</div>
    </div>
  </div>

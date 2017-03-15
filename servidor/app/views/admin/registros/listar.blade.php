@extends('admin.main')
@section('content')

<div class="widget-box">

	<div class="widget-title">

		<h5>Registros</h5>

		<div class="buttons" style="display:">
	
			<a title="Icon Title" class="btn btn-mini" href="{{ route('export_full_xls', 'registros') }}" target="_blank"><i class="icon-download-alt"></i> Exportar</a>
		</div>
		
	</div>

	<div class="widget-content" style="margin-top:6px;">

		<table id="datatable" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
		
			<thead>
				<tr>
				
					<th>Nombre</th>

					<th>Apellido</th>
					
					<th>Correo</th>

					<th>F.Nac</th>

					<th>Tel.</th>
					
					<th>Modelo</th>

					<th>Operador</th>

					<th>Origen</th>
					
					<th>Respuestas</th>

					<th>Tiempo (m:s:ms)</th>

					<th>Foto</th>

					<th>Subió</th>

					

					{{-- 
					<th style="width: 10%;">Acciones</th>
					--}}

				</tr>
			</thead>			
		
			<tbody>

				@foreach ( $registros as $registro )
				
				<tr id="row_{{$registro['id']}}" class="odd_gradeA">
					
					<td>{{ $registro['nombre'] }}</td>

					<td>{{ $registro['apellido'] }}</td>
					
					<td>{{ $registro['correo'] }}</td>

					<td>{{ $registro['fechanacimiento'] }}</td>

					<td>{{ $registro['telefono'] }}</td>

					<td>{{ $registro['modelo'] }}</td>

					<td>{{ $registro['operador'] }}</td>

					<td>{{ $registro['origen'] }}</td>

					<td>{{ $registro['qrespuestas'] }}</td>

					<td>{{ $registro['tiempo'] }}</td>

					<td>
					@if($registro['imagen']!='')
					<?PHP
					$stack =  explode('/',$registro['imagen']);
					$foto = array_pop( $stack ) ;
					?>
					<img width="150" src="../storage/fotos/{{ $registro['unico'].'/'.$foto }}">
					<a class="btn btn-xs" href="{{ route('descarga', $registro['unico'].'/'.$foto) }}"> Descargar</a>
					@else
					No foto.
					@endif
					</td>

					<td>{{ $registro['subio'] }}</td>

					{{--
					<td>
						<div class="btn-group">

							<a href="{{ route('administrador_editar', $registro['id']) }}" class="btn btn-mini" title="Editar/Actualizar usuario"><i class="icon-pencil"></i> </a>

							<a href="javascript:void%200;" class="btn btn-mini deleteModal" title="Eliminar usuario" data-element="row_{{$registro['id']}}" data-delete="{{ route('administrador_borrar', $registro['id']) }}"><i class="icon-trash"></i> </a>

						</div>
					</td>
					--}}

				</tr>

				@endforeach
			</tbody>
			
		</table>
		
	</div>

</div>

<!-- BORRAR Modal -->
<div id="deleteModal" class="modal hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Borrar registro</h3>
	</div>
	
	<div class="modal-body">
		¿Esta seguro que desea borrar este registro?
	</div>
	
	<div class="modal-footer">
		<a href="#" data-dismiss="modal" class="btn">No</a>
		<a href="#" data-dismiss="modal" class="btn btn-danger deleteYes">¡Si, estoy seguro!</a>
	</div>
</div>
<!-- BORRAR Modal -->
@stop


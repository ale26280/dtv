@extends('admin.main')
@section('content')
<div class="row-fluid">

	<div class="span12">
	
		<div class="widget-box">
		
			<div class="widget-title">
			
				<span class="icon"><i class="icon-align-justify"></i></span>
				
				<h5>Editar quien es?</h5>
				
			</div>

			<div class="widget-content nopadding">

				{{ Form::open( array('url' => route('quienes_editar_post', $registro['id']), 'method' => 'POST', 'files' => true, 'class' => 'form-horizontal') ) }} 
					
					<div class="control-group {{ $errors->has( 'nombre' ) ? 'error' : '' }}">
					
						{{ Form::label('nombre', 'Eema', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'nombre', Input::old( 'nombre' ) != "" ? Input::old( 'nombre' ):$registro['nombre'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'nombre' ) }}</span>
							
						</div>
						
					</div>




					<div class="control-group">
					<div class="controls">
					<h3>Image:</h3>
					</div>
					</div>


					<div class="control-group {{ $errors->has( 'img' ) ? 'error' : '' }}">
											
						{{ Form::label('img', 'Imagen', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							@if ($registro['img'] != "")
							<img id="img1" src="{{ URL::to('/') }}/script/timthumb.php?src=../storage/quienes/{{ $registro['img'] }}&w=180" /><br/>
							
							<br/>
							@endif
							
							{{ Form::file( 'img' ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'img' ) }}</span>
							
						</div>
						
					</div>
					

					<div class="control-group">
					<div class="controls">
					<h3>Respuestas:</h3>
					</div>
					</div>

					

					@foreach($respuestas as $i)

					<div class="control-group {{ $errors->has( 'res_1'.$i ) ? 'error' : '' }}">
					
						{{ Form::label('res_'.$i, 'Respuesta #'.$i, array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'res_'.$i, Input::old( 'res_'.$i ) != "" ? Input::old( 'res_'.$i ):$registro['res_'.$i] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'res_'.$i ) }}</span>
							
						</div>
						
					</div>

					@endforeach


					<div class="control-group {{ $errors->has( 'correcta' ) ? 'error' : '' }}">
					
						{{ Form::label('correcta', 'correcta', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::select('correcta', $respuestas, $registro['correcta'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'correcta' ) }}</span>
							
						</div>
						
					</div>




					
				</div>


				<div class="form-actions">
				
					<button type="submit" class="btn btn-primary"><i class="icon-hdd icon-white"></i> Guardar</button>
					
					<a href="{{ route('quienes_listar') }}" class="btn"><i class="icon-remove-sign"></i> Cancelar</a>
					
				</div>
				
			{{ Form::close() }}


			</div>
			
		</div>  
		
	</div>
	
</div>


<!-- BORRAR Modal -->
<div id="deleteModal" class="modal hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Borrar registro</h3>
	</div>
	
	<div class="modal-body">
		¿Esta seguro que desea borrar este archivo?
	</div>
	
	<div class="modal-footer">
		<a href="#" data-dismiss="modal" class="btn">No</a>
		<a href="#" data-dismiss="modal" class="btn btn-danger deleteYes">¡Si, estoy seguro!</a>
	</div>
</div>
<!-- BORRAR Modal -->

@stop
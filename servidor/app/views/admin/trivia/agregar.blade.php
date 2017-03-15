@extends('admin.main')
@section('content')

<div class="row-fluid">

	<div class="span12">
	
		<div class="widget-box">
		
			<div class="widget-title">
			
				<span class="icon"><i class="icon-align-justify"></i></span>
				
				<h5>Agregar trivia</h5>
				
			</div>

			<div class="widget-content nopadding">
			
				{{ Form::open( array('url' => route('trivia_agregar_post'), 'method' => 'POST', 'files' => true, 'class' => 'form-horizontal') ) }} 
									
					<div class="control-group {{ $errors->has( 'pregunta' ) ? 'error' : '' }}">
					
						{{ Form::label('pregunta', 'Pregunta', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'pregunta', Input::old( 'pregunta' ) != "" ? Input::old( 'pregunta' ):"" ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'pregunta' ) }}</span>
							
						</div>
						
					</div>


					<div class="control-group">
					<div class="controls">
					<h3>Respuestas:</h3>
					</div>
					</div>

					

					@foreach($respuestas as $i)

					<div class="control-group {{ $errors->has( 'res_'.$i ) ? 'error' : '' }}">
					
						{{ Form::label('res_'.$i, 'Respuesta #'.$i, array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'res_'.$i, Input::old( 'res_'.$i ) != "" ? Input::old( 'res_'.$i ):"" ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'res_'.$i ) }}</span>
							
						</div>
						
					</div>

					@endforeach


					<div class="control-group {{ $errors->has( 'correcta' ) ? 'error' : '' }}">
					
						{{ Form::label('correcta', 'correcta', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::select('correcta', $respuestas, Input::old( 'correcta' ) != "" ? Input::old( 'correcta' ):"" ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'correcta' ) }}</span>
							
						</div>
						
					</div>



					
				</div>
			
				

				<div class="form-actions">
				
					<button type="submit" class="btn btn-primary"><i class="icon-hdd icon-white"></i> Guardar</button>
					
					<a href="{{ route('trivia_listar') }}" class="btn"><i class="icon-remove-sign"></i> Cancelar</a>
					
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
@extends('admin.main')
@section('content')
<div class="row-fluid">

	<div class="span12">
	
		<div class="widget-box">
		
			<div class="widget-title">
			
				<span class="icon"><i class="icon-align-justify"></i></span>
				
				<h5>Editar Administrador</h5>
				
			</div>

			<div class="widget-content nopadding">

				{{ Form::open( array('url' => route('newsletter_editar_post', $registro['id']), 'method' => 'POST', 'files' => true, 'class' => 'form-horizontal') ) }} 
					
					<div class="control-group {{ $errors->has( 'titulo' ) ? 'error' : '' }}">
					
						{{ Form::label('correo', 'Correo', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'correo', Input::old( 'correo' ) != "" ? Input::old( 'correo' ):$registro['correo'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'correo' ) }}</span>
							
						</div>
						
					</div>
					

				
				<div class="control-group {{ $errors->has( 'titulo' ) ? 'error' : '' }}">
					
					{{ Form::label('nombre', 'nombre', array('class' => 'control-label')) }}
						
					<div class="controls">
						
						{{ Form::text( 'nombre', Input::old( 'nombre' ) != "" ? Input::old( 'nombre' ):$registro['nombre'] ) }} <br/>
							
						<span class="errNew">{{ $errors->first( 'nombre' ) }}</span>
							
					</div>
						
				</div>
						
				<div class="control-group {{ $errors->has( 'empresa' ) ? 'error' : '' }}">
					
						{{ Form::label('empresa', 'Empresa', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'empresa', Input::old( 'empresa' ) != "" ? Input::old( 'empresa' ):$registro['empresa'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'empresa' ) }}</span>
							
						</div>
						
				</div>	
				
				<div class="control-group {{ $errors->has( 'color' ) ? 'error' : '' }}">
					
						{{ Form::label('color', 'Color', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'color', Input::old( 'color' ) != "" ? Input::old( 'color' ):$registro['color'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'color' ) }}</span>
							
						</div>
						
				</div>	


				<div class="form-actions">
				
					<button type="submit" class="btn btn-primary"><i class="icon-hdd icon-white"></i> Guardar</button>
					
					<a href="{{ route('newsletter_listar') }}" class="btn"><i class="icon-remove-sign"></i> Cancelar</a>
					
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
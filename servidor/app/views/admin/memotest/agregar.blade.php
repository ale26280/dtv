@extends('admin.main')
@section('content')

<div class="row-fluid">

	<div class="span12">
	
		<div class="widget-box">
		
			<div class="widget-title">
			
				<span class="icon"><i class="icon-align-justify"></i></span>
				
				<h5>Agregar memotest</h5>
				
			</div>

			<div class="widget-content nopadding">
			
				{{ Form::open( array('url' => route('memotest_agregar_post'), 'method' => 'POST', 'files' => true, 'class' => 'form-horizontal') ) }} 
									
					<div class="control-group {{ $errors->has( 'tema' ) ? 'error' : '' }}">
					
						{{ Form::label('tema', 'Tema', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'tema', Input::old( 'tema' ) != "" ? Input::old( 'tema' ):"" ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'tema' ) }}</span>
							
						</div>
						
					</div>


					<div class="control-group">
					<div class="controls">
					<h3>Im&aacute;genes:</h3>
					</div>
					</div>




					<div class="control-group {{ $errors->has( 'img1' ) ? 'error' : '' }}">
					
						{{ Form::label('img1', 'Imagen 1', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::file( 'img1' ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'img1' ) }}</span>
							
						</div>
						
					</div>



					<div class="control-group {{ $errors->has( 'img2' ) ? 'error' : '' }}">
					
						{{ Form::label('img2', 'Imagen 2', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::file( 'img2' ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'img2' ) }}</span>
							
						</div>
						
					</div>





					
				</div>
			
				

				<div class="form-actions">
				
					<button type="submit" class="btn btn-primary"><i class="icon-hdd icon-white"></i> Guardar</button>
					
					<a href="{{ route('memotest_listar') }}" class="btn"><i class="icon-remove-sign"></i> Cancelar</a>
					
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
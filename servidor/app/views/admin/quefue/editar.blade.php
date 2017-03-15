@extends('admin.main')
@section('content')
<div class="row-fluid">

	<div class="span12">
	
		<div class="widget-box">
		
			<div class="widget-title">
			
				<span class="icon"><i class="icon-align-justify"></i></span>
				
				<h5>Editar que fue?</h5>
				
			</div>

			<div class="widget-content nopadding">

				{{ Form::open( array('url' => route('quefue_editar_post', $registro['id']), 'method' => 'POST', 'files' => true, 'class' => 'form-horizontal') ) }} 
					
					<div class="control-group {{ $errors->has( 'tema' ) ? 'error' : '' }}">
					
						{{ Form::label('tema', 'Tema', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'tema', Input::old( 'tema' ) != "" ? Input::old( 'tema' ):$registro['tema'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'tema' ) }}</span>
							
						</div>
						
					</div>




					<div class="control-group">
					<div class="controls">
					<h3>Video:</h3>
					</div>
					</div>


					<div class="control-group {{ $errors->has( 'video' ) ? 'error' : '' }}">
											
						{{ Form::label('video', 'Video', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							@if ($registro['video'] != "")
							<video width="320" height="240" id="video" controls>
								<source src="../../storage/quefue/{{ $registro['video'] }}"  type="video/mp4">
								Your browser does not support the video tag
							</video><br/>
							 

							
							<br/>
							@endif
							
							{{ Form::file( 'video' ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'video' ) }}</span>
							
						</div>
						
					</div>
					


					

					<div class="control-group {{ $errors->has('fue') ? 'error' : '' }}">
					
						{{ Form::label('fue', 'Fue', array('class' => 'control-label') ) }}
						
						<div class="controls">
						
							{{ Form::checkbox('fue', '1', $registro['fue'] ) }} <br>
							
							<span class="errNew">{{ $errors->first('fue') }}</span>
							
						</div>
	
					</div>	




					
				</div>


				<div class="form-actions">
				
					<button type="submit" class="btn btn-primary"><i class="icon-hdd icon-white"></i> Guardar</button>
					
					<a href="{{ route('quefue_listar') }}" class="btn"><i class="icon-remove-sign"></i> Cancelar</a>
					
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
@extends('admin.main')
@section('content')
<div class="row-fluid">

	<div class="span12">
	
		<div class="widget-box">
		
			<div class="widget-title">
			
				<span class="icon"><i class="icon-align-justify"></i></span>
				
				<h5>Editar configuración</h5>
				
			</div>

			<div class="widget-content nopadding">

				{{ Form::open( array('url' => route('configuracion_editar_post', $registro['id']), 'method' => 'POST', 'files' => true, 'class' => 'form-horizontal') ) }} 


					<div class="control-group">
					<div class="controls">
					<h3>Configuración web:</h3>
					</div>
					</div>
					
					<div class="control-group {{ $errors->has( 'titulo' ) ? 'error' : '' }}">
					
						{{ Form::label('titulo', 'Titulo', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'titulo', Input::old( 'titulo' ) != "" ? Input::old( 'titulo' ):$registro['titulo'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'titulo' ) }}</span>
							
						</div>
						
					</div>					
					
					<div class="control-group {{ $errors->has( 'descripcion' ) ? 'error' : '' }}">
					
						{{ Form::label('descripcion', 'Descripcion', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::textarea( 'descripcion', Input::old( 'descripcion' ) != "" ? Input::old( 'descripcion' ):$registro['descripcion'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'descripcion' ) }}</span>
							
						</div>
						
					</div>
					

					
					<div class="control-group {{ $errors->has( 'metadatos' ) ? 'error' : '' }}">
					
						{{ Form::label('metadatos', 'Metadatos', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::textarea( 'metadatos', Input::old( 'metadatos' ) != "" ? Input::old( 'metadatos' ):$registro['metadatos'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'metadatos' ) }}</span>
							
						</div>
						
					</div>
					
					<div class="control-group {{ $errors->has( 'analytics' ) ? 'error' : '' }}">
					
						{{ Form::label('analytics', 'Analytics', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::textarea( 'analytics', Input::old( 'analytics' ) != "" ? Input::old( 'analytics' ):$registro['analytics'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'analytics' ) }}</span>
							
						</div>
						
					</div>
					

					<div class="control-group">
					<div class="controls">
					<h3>Correos:</h3>
					</div>
					</div>

					
					<div class="control-group {{ $errors->has( 'correo_nuevo_registro' ) ? 'error' : '' }}">
	
						{{ Form::label('correo_nuevo_registro', 'Correo nuevo registro', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'correo_nuevo_registro', Input::old( 'correo_nuevo_registro' ) != "" ? Input::old( 'correo_nuevo_registro' ):$registro['correo_nuevo_registro'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'correo_nuevo_registro' ) }}</span>
							
						</div>
						
					</div>




					<div class="control-group {{ $errors->has( 'correo_alertas' ) ? 'error' : '' }}">
	
						{{ Form::label('correo_alertas', 'Correo alertas', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							{{ Form::text( 'correo_alertas', Input::old( 'correo_alertas' ) != "" ? Input::old( 'correo_alertas' ):$registro['correo_alertas'] ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'correo_alertas' ) }}</span>
							
						</div>
						
					</div>						
					

					<div class="control-group">
					<div class="controls">
					<h3>Juegos activos:</h3>
					</div>
					</div>



					<div class="control-group {{ $errors->has('memo_test') ? 'error' : '' }}">
					
						{{ Form::label('memo_test', 'Memo test', array('class' => 'control-label') ) }}
						
						<div class="controls">
						
							{{ Form::checkbox('memo_test', '1', $registro['memo_test'] ) }} <br>
							
							<span class="errNew">{{ $errors->first('memo_test') }}</span>
							
						</div>
	
					</div>	



					<div class="control-group {{ $errors->has('que_fue') ? 'error' : '' }}">
					
						{{ Form::label('que_fue', 'Qué fue?', array('class' => 'control-label') ) }}
						
						<div class="controls">
						
							{{ Form::checkbox('que_fue', '1', $registro['que_fue'] ) }} <br>
							
							<span class="errNew">{{ $errors->first('que_fue') }}</span>
							
						</div>
	
					</div>	



					<div class="control-group {{ $errors->has('que_es') ? 'error' : '' }}">
					
						{{ Form::label('que_es', 'Qué es?', array('class' => 'control-label') ) }}
						
						<div class="controls">
						
							{{ Form::checkbox('que_es', '1', $registro['que_es'] ) }} <br>
							
							<span class="errNew">{{ $errors->first('que_es') }}</span>
							
						</div>
	
					</div>	


					<div class="control-group {{ $errors->has('trivia') ? 'error' : '' }}">
					
						{{ Form::label('trivia', 'Trivia', array('class' => 'control-label') ) }}
						
						<div class="controls">
						
							{{ Form::checkbox('trivia', '1', $registro['trivia'] ) }} <br>
							
							<span class="errNew">{{ $errors->first('trivia') }}</span>
							
						</div>
	
					</div>




					<div class="control-group">
					<div class="controls">
					<h3>Videos:</h3>
					</div>
					</div>


					

					<div class="control-group {{ $errors->has( 'video_promo' ) ? 'error' : '' }}">
											
						{{ Form::label('video_promo', 'Video promo', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							@if ($registro['video_promo'] != "")
							<video width="320" height="240" id="video_promo" controls>
								<source src="../../storage/videos/{{ $registro['video_promo'] }}"  type="video/mp4">
								Your browser does not support the video tag
							</video><br/>
							 

							
							<br/>
							@endif
							
							{{ Form::file( 'video_promo' ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'video_promo' ) }}</span>
							
						</div>
						
					</div>







					<div class="control-group {{ $errors->has( 'video_buen_resultado' ) ? 'error' : '' }}">
											
						{{ Form::label('video_buen_resultado', 'Video buen resultado', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							@if ($registro['video_buen_resultado'] != "")
							<video width="320" height="240" id="video_buen_resultado" controls>
								<source src="../../storage/videos/{{ $registro['video_buen_resultado'] }}"  type="video/mp4">
								Your browser does not support the video tag
							</video><br/>
							 

							
							<br/>
							@endif
							
							{{ Form::file( 'video_buen_resultado' ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'video_buen_resultado' ) }}</span>
							
						</div>
						
					</div>






					<div class="control-group {{ $errors->has( 'video_mal_resultado' ) ? 'error' : '' }}">
											
						{{ Form::label('video_mal_resultado', 'Video mal resultado', array('class' => 'control-label')) }}
						
						<div class="controls">
						
							@if ($registro['video_mal_resultado'] != "")
							<video width="320" height="240" id="video_mal_resultado" controls>
								<source src="../../storage/videos/{{ $registro['video_mal_resultado'] }}"  type="video/mp4">
								Your browser does not support the video tag
							</video><br/>
							 

							
							<br/>
							@endif
							
							{{ Form::file( 'video_mal_resultado' ) }} <br/>
							
							<span class="errNew">{{ $errors->first( 'video_mal_resultado' ) }}</span>
							
						</div>
						
					</div>








				</div>


				<div class="form-actions">
				
					<button type="submit" class="btn btn-primary"><i class="icon-hdd icon-white"></i> Guardar</button>
					
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
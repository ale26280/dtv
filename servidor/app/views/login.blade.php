<!DOCTYPE html>
<html lang="es">

	<head>
	
		<meta charset="utf-8">
		<title>:: Admin::</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="Provincia Net">
		<meta name="keywords" content="">
		
		<!--<link rel="shortcut icon" href="">-->
		
		{{ HTML::style('css/bootstrap.3.min.css') }}
		{{ HTML::style('css/estilos.css') }}
		
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		{{ HTML::script('js/lib/bootstrap.3.min.js') }}
		{{ HTML::script('js/app.login.js') }}

	</head>

	<body>
	
	<div class="layout">
	
		<div class="manoFondo"></div>

		<div class="container">

			<div class="login">

				<!--FORM-->
				<form method="post" action="login">
				
					<fieldset>
						<div class="form-group centrado">
							<div class="form-group">
								<label for="email">Ingres&aacute; tu direcci&oacute;n de mail</label>
								<input type="text" class="form-control" id="email" name="username">
							</div>

							<div class="form-group">
								<label for="pass">Contraseña</label>
								<input type="password" class="form-control" id="pass" name="password">
							</div>
						</div>

						<div class="noRecuerdo">
							<a href="javascript:void%200;" id="btnRecovery" data-toggle="modal" data-target=".recovery-modal" data-recovery="{{ route('recovery_post') }}" class="miniTxt">No la recuerdo</a>
						</div>
						
						<div class="error">
							{{ $errors->first('wrong_user') }}<br/>
							{{ $errors->first('username') }}<br/>
							{{ $errors->first('password') }}                    
						</div>						
						
						<button type="submit" class="boton">Ingresar</button>
						
						<a href="javascript:void%200;" id="btnInscripcion" class="linkRegistro" data-toggle="modal" data-target=".inscripcion-modal" data-inscripcion="{{ route('inscripcion_post') }}">Primera vez? Registrate acá</a>
						
					</fieldset>
					
				</form>

				<!--END FORM-->

			</div>

			<div class="logos"></div>

		</div>
		
		
		<!-- MODAL RECUPERAR PASSWORD -->
		<div id="modalRecovery" class="modal fade recovery-modal" tabindex="-1" role="dialog" aria-labelledby="Recovery" aria-hidden="true">
		
			<div class="modal-dialog modal-m">
			
				<div class="modal-content">
				
					<a href="javascript:void%200;" class="icoCerrar" data-dismiss="modal"></a>
					
					<div class="modalContenido">
					
						<h2>Ingresa tu email para resetear tu contraseña:</h2>
						
						<br/>
						
						<form action="javascript:void%200;" method="post" id="formRecovery">
						
							<fieldset class="fset">

								<input type="text" name="email" placeholder="Email registrado" /><br/>
								
								<span class="error" id="recovery_error" style="display:none;"></span><br/>
								
								<br/>
								
								<a href="" class="boton botonGris" data-dismiss="modal">Cancelar</a>
								
								<a href="javascript:void%200;" class="boton" id="btnRecoveryEnviar">Enviar</a>
								
							</fieldset>
							
						</form>
						
					</div>
					
				</div>
				
			</div>
			
		</div>

		
		<!-- MODAL INSCRIPCION -->
		<div id="modalInscripcion" class="modal fade inscripcion-modal" tabindex="-1" role="dialog" aria-labelledby="Inscripcion" aria-hidden="true">
		
			<div class="modal-dialog modal-m">
			
				<div class="modal-content">
				
					<a href="javascript:void%200;" class="icoCerrar" data-dismiss="modal"></a>
					
					<div class="modalContenido">
					
						<h2>¡Crea tu cuenta!</h2>
						
						<br/>
						
						<form action="javascript:void%200;" method="post" id="formInscripcion">
						
							<fieldset class="fset">
							
								<input type="text" name="nombre" placeholder="Nombre" />
								<input type="text" name="apellido" placeholder="Apellido" />
								
								<input type="text" name="email" placeholder="Mail" />
								<input type="text" name="email_confirm" placeholder="Repite el mail" />
								
								<input type="password" name="password" placeholder="Contraseña" />
								<input type="password" name="password_confirm" placeholder="Repite la contraseña" />
								
								<input type="text" name="codigo" placeholder="Codigo" /><br/>
								
								<span class="error" id="inscripcion_error" style="display:none;"></span>
								
								<br/>
								
								<input type="checkbox" name="acuerdo" /> He leído y acepto los términos y condiciones de uso de <a href="">pnetbox.com</a><br/>
								
								<br/>
								
								<textarea id="terminos-y-condiciones">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</textarea>
								
								<br/>
								
								<input type="submit" value="Cancelar" class="boton botonGris" data-dismiss="modal" />
								
								<a href="javascript:void%200;" class="boton" id="btnInscripcionAceptar">Enviar</a>
								
							</fieldset>
							
						</form>
						
					</div>
					
				</div>
				
			</div>
			
		</div>
		
		
		
		
		<!-- MODAL INSCRIPCION OK -->
		<div id="modalInscripcionOk" class="modal fade inscripcionok-modal" tabindex="-1" role="dialog" aria-labelledby="InscripcionOk" aria-hidden="true">
		
			<div class="modal-dialog modal-m">
			
				<div class="modal-content">
				
					<a href="javascript:void%200;" class="icoCerrar" data-dismiss="modal"></a>
					
					<div class="modalContenido">
					
						<h2>¡Solo falta un paso!</h2>
						
						<br/>
						
						<p>Tu cuenta ha sido creada exitosamente, por favor revisá tu email para confirmar la inscripción.</p>
						
						<br/>
						
						<a href="javascript:void%200;" class="boton" data-dismiss="modal">Aceptar</a>						
						
					</div>
					
				</div>
				
			</div>
			
		</div>
		
		
		
		
		<!-- MODAL RECOVERY OK -->
		<div id="modalRecoveryOk" class="modal fade recoveryok-modal" tabindex="-1" role="dialog" aria-labelledby="RecoveryOk" aria-hidden="true">
		
			<div class="modal-dialog modal-m">
			
				<div class="modal-content">
				
					<a href="javascript:void%200;" class="icoCerrar" data-dismiss="modal"></a>
					
					<div class="modalContenido">
					
						<h2>Reset de contraseña</h2>
						
						<br/>
						
						<p>Para terminar de resetear tu contraseña ingresa al link que te hemos enviado por correo.</p>
						
						<br/>
						
						<a href="javascript:void%200;" class="boton" data-dismiss="modal">Aceptar</a>						
						
					</div>
					
				</div>
				
			</div>
			
		</div>
		

	</div>
	
	</body>
	
</html>

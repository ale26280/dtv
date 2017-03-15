<!DOCTYPE html>
<html lang="es">
<head>

<!-- <meta name="Content-Type"  content="text/html;" http-equiv="content-type" charset="utf-8">
 -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<!-- 
a = &aacute
é = &eacute
í = &iacute
ó = &oacute
ú = &uacute
ñ = &ntilde
-->

	<!-- META DATOS -->
	{{ $config['metadatos'] }}

    <title>{{ $config['titulo'] }}</title>
    <meta name="description" content="{{ $config['descripcion'] }}" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	
    <!--Favicon -->
	<link rel="icon" type="image/png" href="img/front/front/favicon.png" />
		
	<!-- CSS Files -->		
	<link rel="stylesheet" href="css/front/reset.css" />
	<link rel="stylesheet" href="css/front/animate.min.css" />
	<link rel="stylesheet" href="css/front/bootstrap.min.css" />
	<link rel="stylesheet" href="css/front/style.css" />
	<link rel="stylesheet" href="css/front/flexslider.css" />
	<link rel="stylesheet" href="css/front/font-awesome.css" />
	<link rel="stylesheet" href="css/front/owl.carousel.css" />
	<link rel="stylesheet" href="css/front/prettyPhoto.css" />
	<link rel="stylesheet" href="css/front/responsive.css" />
	<link rel="stylesheet" href="css/front/gradients.css" />
	<link rel="stylesheet" href="css/front/player/YTPlayer.css" />

	<link href="css/front/owl.carousel.css" rel="stylesheet">

	<!-- Theme Panel -->
	<link rel="stylesheet" href="theme-panel/theme_panel.css" />

	<!-- Skin Colors -->
	<link id="changeable-colors" rel="stylesheet" href="css/front/colors/gdi.css" />

	<!-- End CSS Files -->
	
	<!-- ANALYTICS -->
	{{ $config['analytics'] }}
	
	
	<!-- GOOGLE MAPS -->
	<script type="text/javascript">
	
		var lat = {{$config['latitud']}};
		var lon = {{$config['longitud']}};
	
	</script>
 
</head>

<body>


	<!-- Page Loader -->
	<section id="pageloader">
		<div class="loader-item fa fa-spin colored-border"></div>
	</section>


	<!-- Navigation -->
	<section id="navigation" class="not-visible-nav white-nav">
		<!-- Navigation Inner -->
		<div class="nav-inner">
			<!-- Site Logo -->
			<div class="site-logo">
				<a href="#home" class="scroll logo">
					<!-- Your Logo -->
					<img src="img/front/logo.png" alt="logo" />
				</a>
			</div><!-- End Site Logo -->
			<a class="mini-nav-button dark"><i class="fa fa-bars"></i></a>
			<!-- Navigation Menu -->
			<div class="nav-menu">
				<ul class="nav uppercase condensed bold">
					<li><a href="#about" class="scroll">Acerca</a></li>
					<li><a href="#experience" class="scroll">Experience</a></li>
					<li><a href="#media" class="scroll">Media</a></li>
					<li><a href="#entertaiment" class="scroll">Entertainment</a></li>
					<li><a href="#team" class="scroll">Team</a></li>
					<li><a href="#contact" class="scroll">Contacto</a></li>
					<li><a href="{{ $config['url_facebook'] }}" target="_blank"><i class="fa fa-facebook"></i></a></li>
					<li><a href="{{ $config['url_twitter'] }}" target="_blank"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#newsletter" class="scroll"><i class="fa fa-envelope"></i></a></li>					
				</ul>
			</div><!-- End Navigation Menu -->
		</div><!-- End Navigation Inner -->
	</section><!-- End Navigation Section -->



	<!-- Home Section -->
	<section id="home"> 	
		<div id="slides" class="home parallax pattern-black" style="background:url(storage/sliders/{{$fotoHome}}) center center fixed;">
			<div class="home-details">
				<!-- Your Logo -->
				<div class="logo">
					<img src="img/front/logo-icon.png" alt="Logo" />
				</div>
				<div class="hometexts">
						<!-- Slide Texts -->
						<ul class="slide-text condensed">
							<li class="hometext bold uppercase">Generaci&oacuten<span class="colored"> de Ideas</span></li><br>
<!-- 							<li class="hometext bold uppercase">We Love to <span class="colored"> Design</span></li>
							<li class="hometext bold uppercase">We Are <span class="colored"> Creative</span></li> -->
						</ul>
				</div>
				<!-- Fixed Text -->
				<h1 class="fixed-text uppercase bold condensed gris_titulo">&iquest;Que tiene tu marca para decir?</h1>
				<!-- Home Categories -->
				<ul class="home-categories">
					<li class="h-item uppercase gris_titulo">Activaciones</li>
					<li class="h-item uppercase gris_titulo">BTL</li>
					<li class="h-item uppercase gris_titulo">Contenidos</li>
					<li class="h-item uppercase gris_titulo">Experiencias</li>
					<li class="h-item uppercase gris_titulo">Medios</li>
				</ul>
				<!-- Bottom Arrow -->
				<a href="#about" class="home-arrow scroll uppercase bold">
					<img src="img/front/bottom-arrow.png" alt="bottom" />
					<span>Bienvenidos</span>
				</a>
			</div><!-- End Home Texts -->
		</div><!-- End Home Details -->
	</section><!-- End Home Section -->


	<!-- About -->
	<section id="about" class="container waypoint">
		<div class="inner">
			<!-- Header -->
			<h1 class="header semibold dark">GENERAMOS<span class="colored"> EMOCIONES</span></h1>
			<!-- Description -->
			<h4 class="h-desc"><span class="colored bold">Somos una agencia de contenidos para marcas</span> en el mercado del entretenimiento y los medios, con un expertise de m&aacutes de 20 a&ntildeos en los primeros planos de la industria.
Desarrollamos estrategias de valor agregado que vinculan a las marcas con sus consumidores a trav&eacutes de las distintas &aacutereas de servicio.</h4>

			<!-- Boxes -->

			<div class="boxes">

				<!-- Box 1 -->
				<div class="col-xs-4 about-box animated" data-animation="fadeIn" data-animation-delay="100">
					<a class="about-icon">
						<i class="fa fa-times"></i>
					</a>
					<p class="uppercase normal about-head">GDI EXPERIENCE</p>
					<p class="light about-text">Soluciones 360 para las marcas. contempla la idea, el desarrollo creativo y la implementaci&oacuten de estrategias a trav&eacutes de acciones vinculadas a contenidos diferenciales.</p>
				</div>

				<!-- Box 2 -->
				<div class="col-xs-4 about-box animated" data-animation="fadeIn" data-animation-delay="300">
					<a class="about-icon">
						<i class="fa fa-eye"></i>
					</a>
					<p class="uppercase normal about-head">GDI ENTERTAINMENT</p>
					<p class="light about-text">Un banco de contenidos exclusivo generado a trav&eacutes de una red de productoras asociadas para ofrecer a las marcas un puente con sus audiencias en la experencia &uacutenica del entretenimiento en vivo.</p>
				</div>

				<!-- Box 4 -->
				<div class="col-xs-4 about-box animated" data-animation="fadeIn" data-animation-delay="700">
					<a class="about-icon">
						<i class="fa fa-youtube-play"></i>
					</a>
					<p class="uppercase normal about-head">GDI MEDIA</p>
					<p class="light about-text">Producci&oacuten de contenidos de radio en formatos originales, planificaci&oacuten y compra de medios off y on line, y desarrollo de un portfolio de dispositivos en v&iacutea p&uacuteblica.</p>
				</div>
			</div><!-- End Boxes -->
		</div><!-- End About Inner -->
	</section><!-- End About Section -->



	<!-- Video -->
	<section id="video" class="pattern-black relative" style="background-color: black;">
		<!-- Video Button -->
		<a href="#contact" class="video-button t-center scroll">
			<!-- Logo Span -->
			<span class="logo-icon-m">
				<!-- Your Logo -->
				<img src="img/front/logo-icon-m.png" alt="" />
			</span>
			<!-- Video Text -->
			<p class="video-text uppercase condensed bold white">Generamos Emociones</p>
		</a>


		<!-- Video -->
		<div id="P2" class="player video-container" data-property="{videoURL:'{{ $config['video'] }}',containment:'#video',autoPlay:true, showControls:false, mute:true, startAt:0, opacity:1}"></div>
		<!-- End Video -->

	</section><!-- End Video Section -->



 	<section id="clientes" class="container waypoint padding_40 ajuste_logo">
		<h2 class="h-desc dark padding_40 padding_top_40 ajuste_txt_logos">Algunas cosas que hicimos que nos ponen contentos</h2>

<!-- 			<h2 class="text_center semibold dark condensed uppercase padding_40">Algunas cosas que hicimos de las que nos ponen contentos</h2>
 -->
		<div class="col-lg-10 col-lg-offset-1 paddingbottom " >
			 <div id="clients">
			 
				@if ( count($sliderClientes[0]->fotos) > 0 )
				
					@foreach ( $sliderClientes[0]->fotos as $foto ) 
					
						<div class="item"><a href="{{ $foto->url }}" target="_blank"><img src="storage/sliders/{{ $foto->fuente }}" alt="{{ $foto->url }}"></a></div>
				
					@endforeach
					
				@endif
				
			</div>
		</div>

		</section> 

<!-- Portfolio -->
	<section id="experience" class="container padding-off" style="background-color: black;">

		<div class="portfolio" id="experience_portfolio">

			<!-- Header -->
			<h1 class="white header semibold dark paddingbottom"><span class="titulo_port">GDI EXPERIENCE</span></h1>

			<!-- Description -->
			<h4 class="h-desc dark white ">
				Brindamos a las marcas una soluci&oacuten 360 para sus activaciones a trav&eacutes de contenidos desarrollados a medida. abarcamos  desde la creaci&oacuten, el dise&ntildeo y la implementaci&oacuten de estrategias y acciones.<br><br>
				Tenemos concepto de agencia y din&aacutemica de productores, con el respaldo de un equipo interdisciplinario que conjuga creativos, dise&ntildeadores, productores, community managers, planners y managers de cuentas.
			</h4>

		</div><!-- End inner div -->

			<!-- Expander -->
			<div id="experience-expander" class="item-expander relative">
				<div id="experience-item-expander">
					<p class="cls-btn"><a class="close">X</a></p>
					<div class="expander-inner"></div>
				</div>
			</div>

			<!-- Filters -->
			<div id="experience_menu" class="filter-menu fullwidth">
				<ul id="filters" class="option-set relative normal" data-option-key="filter">
					<li><a href="#filter" data-option-value="*" class="selected">show all</a></li>

					@foreach ( $filtro['experience'] as $menu)
					
							<li><a href="#filter" data-option-value=".tag_{{ strtolower($menu['tag']) }}">{{ $menu['tag'] }}</a></li>				
						
					@endforeach
				
				</ul>
			</div>

			<!-- Works -->
			<div class="portfolio-items no-margin no-padding" data-category="experience">
	
				<!-- Work -->
				<?php $tag = $work = null; ?>
				
				@foreach ($experience as $work)
				

							
					<div class="work_experience destacado_experience work five 
					<?php if ( count($work->tags) > 0) {
							$tags = $work->tags;
							for($a =0;$a<=count($work->tags)-1;$a++) {
								echo " tag_" . strtolower($tags[$a]['tag']);
							}
						}?>">
					
						<div class="work-inner destacado">
						
							<!-- Image -->
							<div class="work-image">
								<a href="{{ route('portfolio_ver', $work->id) }}" class="expander">
									<img src="storage/fichas/{{ $work->imagen_principal }}" alt="" />
									<span class="positive"></span>
								</a>
							</div>
							
							<!-- Work Details -->
							<div class="work-bottom">
								<p class="work-name uppercase normal no-margin">{{ $work->titulo }}</p>
								<p class="work-category normal no-margin">{{ $work->categoria->categoria }}</p>
								<a href="storage/fichas/{{ $work->imagen_principal }}"  data-rel="prettyPhoto[gallery]" class="work-link" ><span class="arrow"></span></a>
							</div>
							
						</div>
						
					</div>
					

				
				@endforeach
				<!-- End Work -->



				<!-- Clear -->
				<div class="clear"></div>
				
			</div><!-- End Works -->
			
		<p class="ver_mas"><a href="javascript:void%200;" id="mas_experience">Ver m&aacute;s...</a></p>
		
	</section><!-- End Porfolio Section -->


<!-- Portfolio -->
	<section id="entertaiment" class="container padding-off" style="background-color: #b7ca00;">

		<div class="portfolio" id="entertaiment_portfolio">

			<!-- Header -->
			<h1 class="white header semibold dark paddingbottom"><span class="titulo_port">GDI ENTERTAINMENT</span></h1>

			<!-- Description -->
			<h4 class="h-desc dark white ">
				A trav&eacutes de una red de productoras asociadas desarrollamos estrategias de valor agregado que vinculan a las marcas con sus consumidores en la experiencia &uacutenica del entretenimiento en vivo.
			</h4>

		</div><!-- End inner div -->

			<!-- Expander -->
			<div id="entertaiment-expander" class="item-expander relative">
				<div id="entertaiment-item-expander">
					<p class="cls-btn"><a class="close">X</a></p>
					<div class="expander-inner"></div>
				</div>
			</div>

			<!-- Filters -->
			<div id="entertaiment_menu" class="filter-menu fullwidth">
				<ul id="filters" class=" option-set relative normal" data-option-key="filter">
					<li><a href="#filter" data-option-value="*" class="selected">show all</a></li>

					@foreach ( $filtro['entertaiment'] as $menu)
					
							<li><a href="#filter" data-option-value=".tag_{{ strtolower($menu['tag']) }}">{{ $menu['tag'] }}</a></li>
						
					@endforeach
					
				</ul>
			</div>

			<!-- Works -->
			<div class="portfolio-items no-margin no-padding" data-category="entertaiment">

				<!-- Work -->
				<?php $tag = $work = null; ?>
				@foreach ($entertaiment as $work)
							
					<div class="work_entertaiment work five <?php if ( count($work->tags) > 0) {
							$tags = $work->tags;
							for($a =0;$a<=count($work->tags)-1;$a++) {
								echo strtolower( " tag_" . $tags[$a]['tag'] );
							}
						}?>">
					
						<div  class="work-inner">
						
							<!-- Image -->
							<div class="work-image">
								<a href="{{ route('portfolio_ver', $work->id) }}" class="expander">
									<img src="storage/fichas/{{ $work->imagen_principal }}" alt="" />
									<span class="positive"></span>
								</a>
							</div>
							
							<!-- Work Details -->
							<div class="work-bottom">
								<p class="work-name uppercase normal no-margin" style="color:#FFFFFF;">{{ $work->titulo }}</p>
								<p class="work-category normal no-margin" style="color:#FFFFFF;">{{ $work->categoria->categoria }}</p>
								<a href="storage/fichas/{{ $work->imagen_principal }}"  data-rel="prettyPhoto[gallery]" class="work-link" ><span class="arrow"></span></a>
							</div>
							
						</div>
						
					</div>

				@endforeach


				<!-- Clear -->
				<div class="clear"></div>
				
			</div><!-- End Works -->
			
		<p class="ver_mas"><a href="javascript:void%200;" id="mas_entertaiment">Ver m&aacute;s...</a></p>
				
	</section><!-- End Porfolio Section -->


	
	<!-- Portfolio -->
	
<section id="media" class="container">

		<div class="portfolio" id="media_portfolio">

			<!-- Header -->
			<h1 class="header semibold dark paddingbottom"><span class="titulo_port">GDI MEDIA</span></h1>

			<!-- Description -->
			<h4 class="h-desc dark">
				<strong>PRODUCCION DE CONTENIDOS</strong><br>
				Nos dedicamos a la producci&oacuten  de programas  de radio en formatos orginales, desarrollando toda la cadena de valor que incluye  la creaci&oacuten , producci&oacuten  y comercializaci&oacuten  que vincula a medios, comunicadores, marcas y oyentes.<br><br>

				 <strong>DISPOSITIVOS EN VIA PUBLICA</strong><br>
				 Trabajamos on demand para las marcas, en la b&uacutesqueda, seguimiento y creaci&oacuten de posiciones en todo el pa&iacutes. Contamos con dispositivos propios y desarrollamos los que nuestros clientes necesitan.<br>
				 Ofrecemos servicios de dise&ntildeo, impresi&oacuten y fijaci&oacuten de carteles.<br><br>

				Media planning Planificaci&oacuten y compra de medios off y on line. Recursos y herramientas para optimizar el plan, ejecuci&oacuten y control.<br>
			</h4>

		</div><!-- End inner div -->

			<!-- Expander -->
			<div id="media-expander" class="item-expander relative">
				<div id="media-item-expander">
					<p class="cls-btn"><a class="close">X</a></p>
					<div class="expander-inner"></div>
				</div>
			</div>

			
			<!-- Filters -->
			<div id="media_menu" class="filter-menu fullwidth">
				<ul id="filters" class="option-set relative normal" data-option-key="filter">
					
					@foreach ( $filtro['media'] as $menu)

						<li><a href="#filter" data-option-value=".tag_{{ strtolower($menu['tag']) }}">{{ $menu['tag'] }}</a></li>
						
					@endforeach
					
				</ul>
			</div>			
			
			<!-- Works -->
			<div class="portfolio-items no-margin no-padding" data-category="media">
				
				<!-- Work -->
				<?php $tag = $work = null; ?>				
				@foreach ($media as $work)
				
					<div class="work_media work five<?php if ( count($work->tags) > 0) { $tags = $work->tags; for($a=0;$a<=count($work->tags)-1;$a++) { 	echo " tag_" . strtolower($tags[$a]['tag']); } }?>">
					
						<div class="work-inner">
						
							<!-- Image -->
							<div class="work-image">
								<a href="{{ route('portfolio_ver', $work->id) }}" class="expander">
									<img src="storage/fichas/{{ $work->imagen_principal }}" alt="" />
									<span class="positive"></span>
								</a>
							</div>
							
							<!-- Work Details -->
							<div class="work-bottom">
								<p class="work-name uppercase normal no-margin">{{ $work->titulo }}</p>
								<p class="work-category normal no-margin">{{ $work->categoria->categoria }}</p>
								<a href="storage/fichas/{{ $work->imagen_principal }}"  data-rel="prettyPhoto[gallery]" class="work-link" ><span class="arrow"></span></a>
							</div>
							
						</div>
						
					</div>
				
				@endforeach



				<!-- Clear -->
				<div class="clear"></div>
				
			</div><!-- End Works -->
			
		<p class="ver_mas"><a href="javascript:void%200;" id="mas_media">Ver m&aacute;s...</a></p>
				
	</section><!-- End Porfolio Section -->

	
	<!-- Services -->

	<section id="services" class="container parallax1 home" >

<div class=" pattern-black"> 



</div>

	</section><!-- End Services Section -->


	<!-- Team -->
	<section id="team" class="container">

		<!-- Team Inner -->
		<div class="inner team">
					<h1 class="header semibold dark paddingbottom uppercase"><span class="titulo_port">The Team is the key</span></h1>

			<!-- Description -->
			<h4 class="h-desc dark"></h4>


			<!-- Members -->
			<div class="team-members inner-details">

				<!-- Member -->
				<div class="col-xs-4 member animated" data-animation="fadeInUp" data-animation-delay="0">
					<div class="member-inner">
						<!-- Team Member Image -->
						<a class="team-image">
							<!-- Img -->
							<img src="img/front/staff/gus.jpg" alt="" />
						</a>
						<div class="member-details">
							<div class="member-details-inner">
								<!-- Name -->
								<h2 class="member-name uppercase normal">Gustavo Kolhubher</h2>
								<!-- Position -->
								<h4 class="member-position uppercase normal">Director de negocios</h4>
								<!-- Description -->
								<!--<p class="member-description">Escribir mini texto de que hace en GDI.</p>-->

								<!-- Member Contact -->
								<a class="member-email" target="_blank" href="mailto:gustavok@generaciondeideas.com.ar"><i class="icon envelope">gustavok@generaciondeideas.com.ar</i></a><br/>
								<span class="member-phone">5199-8315</span>
									

							</div> <!-- End Detail Inner -->
						</div><!-- End Details -->
					</div> <!-- End Member Inner -->
				</div><!-- End Member -->


				<!-- Member -->
				<div class="col-xs-4 member animated" data-animation="fadeInUp" data-animation-delay="100">
					<div class="member-inner">
						<!-- Team Member Image -->
						<a class="team-image">
							<!-- Img -->
							<img src="img/front/staff/marcelo.jpg" alt="" />
						</a>
						<div class="member-details">
							<div class="member-details-inner">
								<!-- Name -->
								<h2 class="member-name uppercase normal">Marcelo Berlingieri</h2>
								<!-- Position -->
								<h4 class="member-position uppercase normal">Director comercial</h4>
								<!-- Description -->
								<!--<p class="member-description">Escribir mini texto de que hace en GDI.</p>-->
								
								<!-- Member Contact -->
								<a class="member-email" target="_blank" href="mailto:marcelob@generaciondeideas.com.ar"><i class="icon envelope">marcelob@generaciondeideas.com.ar</i></a><br/>
								<span class="member-phone">5199-8315</span>
								
							</div> <!-- End Detail Inner -->
						</div><!-- End Details -->
					</div> <!-- End Member Inner -->
				</div><!-- End Member -->


				<!-- Member -->
				<div class="col-xs-4 member animated" data-animation="fadeInUp" data-animation-delay="200">
					<div class="member-inner">
						<!-- Team Member Image -->
						<a class="team-image">
							<!-- Img -->
							<img src="img/front/staff/gon.jpg" alt="" />
						</a>
						<div class="member-details">
							<div class="member-details-inner">
							
								<!-- Name -->
								<h2 class="member-name uppercase normal">Gustavo Gonzales</h2>
								<!-- Position -->
								<h4 class="member-position uppercase normal">Director financiero</h4>
								<!-- Description -->
								<!--<p class="member-description">Escribir mini texto de que hace en GDI.</p>-->

								<!-- Member Contact -->
								<a class="member-email" target="_blank" href="mailto:gustavoeg@generaciondeideas.com.ar"><i class="icon envelope">gustavoeg@generaciondeideas.com.ar</i></a><br/>
								<span class="member-phone">5199-8315</span>
								
							</div> <!-- End Detail Inner -->
							
						</div><!-- End Details -->
					</div> <!-- End Member Inner -->
				</div><!-- End Member -->


				<!-- Member -->
				<div class="col-xs-4 member animated" data-animation="fadeInUp" data-animation-delay="300">
					<div class="member-inner">
						<!-- Team Member Image -->
						<a class="team-image">
							<!-- Img -->
							<img src="img/front/staff/alice.jpg" alt="" />
						</a>
						<div class="member-details">
							<div class="member-details-inner">
								<!-- Name -->
								<h2 class="member-name uppercase normal">Alicia Szogas</h2>
								<!-- Position -->
								<h4 class="member-position uppercase normal">Account Manager</h4>
								<!-- Description -->
								<!--<p class="member-description">Escribir mini texto de que hace en GDI.</p>-->


								<!-- Member Contact -->
								<a class="member-email" target="_blank" href="mailto:alicias@generaciondeideas.com.ar"><i class="icon envelope">alicias@generaciondeideas.com.ar</i></a><br/>
								<span class="member-phone">Cel: 11 40436350 / Tel: 5199-8315</span>
							


								</div> <!-- End Detail Inner -->
						</div><!-- End Details -->
					</div> <!-- End Member Inner -->
				</div><!-- End Member -->


				<!-- Member -->
				<div class="col-xs-4 member animated" data-animation="fadeInUp" data-animation-delay="400">
					<div class="member-inner">
						<!-- Team Member Image -->
						<a class="team-image">
							<!-- Img -->
							<img src="img/front/staff/mica.jpg" alt="" />
						</a>
						<div class="member-details">
							<div class="member-details-inner">
								<!-- Name -->
								<h2 class="member-name uppercase normal">Micaela Lo Priore</h2>
								<!-- Position -->
								<h4 class="member-position uppercase normal">Coordinadora Comercial</h4>
								<!-- Description -->
								<!--<p class="member-description">Escribir mini texto de que hace en GDI.</p>-->


								<!-- Member Contact -->
								<a class="member-email" target="_blank" href="mailto:micaelal@generaciondeideas.com.ar"><i class="icon envelope">micaelal@generaciondeideas.com.ar</i></a><br/>
								<span class="member-phone">5199-8315</span>
								
							</div> <!-- End Detail Inner -->
						</div><!-- End Details -->
					</div> <!-- End Member Inner -->
				</div><!-- End Member -->


				<!-- Member -->
				<div class="col-xs-4 member animated" data-animation="fadeInUp" data-animation-delay="500">
					<div class="member-inner">
						<!-- Team Member Image -->
						<a class="team-image">
							<!-- Img -->
							<img src="img/front/staff/lu.jpg" alt="" />
						</a>
						<div class="member-details">
							<div class="member-details-inner">
								<!-- Name -->
								<h2 class="member-name uppercase normal">Luciana Alba</h2>
								<!-- Position -->
								<h4 class="member-position uppercase normal">Account Manager</h4>
								<!-- Description -->
								<!--<p class="member-description">Escribir mini texto de que hace en GDI.</p>-->

								<!-- Member Contact -->
								<a class="member-email" target="_blank" href="mailto:lucianaa@generaciondeideas.com.ar"><i class="icon envelope">lucianaa@generaciondeideas.com.ar</i></a><br/>
								<span class="member-phone">5199-8315</span>

								
							</div> <!-- End Detail Inner -->
						</div><!-- End Details -->
					</div> <!-- End Member Inner -->
				</div><!-- End Member -->

				<!-- Member -->
				<div class="col-xs-4 member animated" data-animation="fadeInUp" data-animation-delay="300">
					<div class="member-inner">
						<!-- Team Member Image -->
						<a class="team-image">
							<!-- Img -->
							<img src="img/front/staff/ale.jpg" alt="" />
						</a>
						<div class="member-details">
							<div class="member-details-inner">
								<!-- Name -->
								<h2 class="member-name uppercase normal">Alejandra Montero</h2>
								<!-- Position -->
								<h4 class="member-position uppercase normal">Media Planner </h4>
								<!-- Description -->
								<!--<p class="member-description">Escribir mini texto de que hace en GDI.</p>-->

								<!-- Member Contact -->
								<a class="member-email" target="_blank" href="mailto:alejandram@generaciondeideas.com.ar"><i class="icon envelope">alejandram@generaciondeideas.com.ar</i></a><br/>
								<span class="member-phone">5199-8315</span>


							</div> <!-- End Detail Inner -->
						</div><!-- End Details -->
					</div> <!-- End Member Inner -->
				</div><!-- End Member -->


				<!-- Member -->
				<div class="col-xs-4 member animated" data-animation="fadeInUp" data-animation-delay="400">
					<div class="member-inner">
						<!-- Team Member Image -->
						<a class="team-image">
							<!-- Img -->
							<img src="img/front/staff/jess.jpg" alt="" />
						</a>
						<div class="member-details">
							<div class="member-details-inner">
								<!-- Name -->
								<h2 class="member-name uppercase normal">Jessica Eldesztein</h2>
								<!-- Position -->
								<h4 class="member-position uppercase normal">Asistente Administracion y Finanzas</h4>
								<!-- Description -->
								<!--<p class="member-description">Escribir mini texto de que hace en GDI.</p>-->


								<!-- Member Contact -->
								<a class="member-email" target="_blank" href="mailto:jessicae@generaciondeideas.com.ar"><i class="icon envelope">jessicae@generaciondeideas.com.ar</i></a><br/>
								<span class="member-phone">5199-8315</span>


							</div> <!-- End Detail Inner -->
						</div><!-- End Details -->
					</div> <!-- End Member Inner -->
				</div><!-- End Member -->


				<!-- Member -->
				<div class="col-xs-4 member animated" data-animation="fadeInUp" data-animation-delay="500">
					<div class="member-inner">
						<!-- Team Member Image -->
						<a class="team-image">
							<!-- Img -->
							<img src="img/front/staff/estefi.jpg" alt="" />
						</a>
						<div class="member-details">
							<div class="member-details-inner">
								<!-- Name -->
								<h2 class="member-name uppercase normal">Estefania Ramis</h2>
								<!-- Position -->
								<h4 class="member-position uppercase normal">Asistente Administracion y Finanzas</h4>
								<!-- Description -->
								<!--<p class="member-description">Escribir mini texto de que hace en GDI.</p>-->


								<!-- Member Contact -->
								<a class="member-email" target="_blank" href="mailto:estefaniar@generaciondeideas.com.ar"><i class="icon envelope">estefaniar@generaciondeideas.com.ar</i></a><br/>
								<span class="member-phone">5199-8315</span>

							</div> <!-- End Detail Inner -->
						</div><!-- End Details -->
					</div> <!-- End Member Inner -->
				</div><!-- End Member -->


				<!-- Clear -->
				<div class="clear"></div>
			</div><!-- End Members -->
		</div><!-- End Team Inner -->
	</section><!-- End Team Section -->



				<!-- Clear -->
				<li class="clear"></li>
			</ul><!-- End Tables -->

		</div><!-- End Inner -->

	</section><!-- End Prices Section -->

	<!-- Testimonials -->
	<section class="testimonials parallax2">

		<div class="inner">

			<ul class="t-slides">

				<!-- Testimonial -->
				<li class="monial">
					<!-- Text -->
					<h1 class="uppercase bold condensed white">
						<span class="naranja">Puro Presente. </span>Conoc&eacute nuestro brazo creativo. <span class="naranja">Brand Marketing </span> para que tu marca acceda a un nuevo nivel.
					</h1>
										<!-- Name -->
					<p class="light uppercase"></p>
				</li>

				<!-- Testimonial -->
				<li class="monial">
					<!-- Text -->
					<h1 class="uppercase bold condensed white">
						<span class="naranja">Puro Presente. </span>Un nuevo enfoque de la comunicaci&oacuten integrada.
					</h1>
					<!-- Name -->
					<p class="light uppercase"></p>
				</li>

			</ul>

		</div><!-- End Inner Div -->

	</section><!-- End Testimonials Section -->



	<!-- Google Map Section -->
	<section id="map" class="container close-map">
	
		<!-- Open/Close Button -->
		<a id="map-button" class="google-map-big-button uppercase bold condensed white scroll close-map-button" href="#map">Donde estamos <i class="fa fa-caret-down"></i></a>
		
		<!-- Google Map Script -->
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<!-- Google Map -->
		<div id="google-map">
			   <div class="addressBox text-center">
			      <dl>
			        <dt>DIRECCIÓ?N</dt>
			        <dd>
			          Av. Alicia Moreau de Justo 1082<BR>
			          Ed. Zencity - Torre Esmeralda <br>
			          C1107AAB - Pto Madero - CABA<br>
			          Buenos Aires - Argentina
			        </dd>
			        <dt>Tel&eacutefonos</dt>
			        <dd>+54 11 8376 6284 </dd>
			        <dt>Email</dt>
			        <dd>
			            <a href="mailto:consultas@millscapitalgroup.com">
			                consultas@millscapitalgroup.com
			            </a>
			        </dd>
			     </dl>
			    </div>
		</div>
	</section><!-- End Google Map Section -->

	<!-- Newsletter Section -->
	<section id="newsletter" class="container close-map" style="margin-top:-20px; border-bottom: 1px #F5F5F5 solid;">
	
		<!-- Open/Close Button -->
		<a id="newsletter-button" class="newsletter-big-button uppercase bold condensed white scroll close-newsletter-button" href="#newsletter">Newsletter <i class="fa fa-envelope"></i></a>
		
	
		<!-- Newsletter  Inner -->
		<div class="inner newsletter">

			<!-- Header -->
			<h1 class="header semibold white">NEWSLETTER</h1>

			<!-- Description -->
			<h4 class="h-desc white newsletter-text">Recive nuestra Newsletter.  </h4>

			<!-- Form Area -->
			<div class="newsletter-form">
				<!-- Form -->
				<form id="newsletter" method="post" action="{{ route('newsletter') }}">
					<!-- Left Inputs -->
					<div class="col-xs-6 animated" data-animation="fadeInLeft" data-animation-delay="300">
						<!-- Name -->
						<input type="text" name="name" id="name" required="required" class="form light" placeholder="Nombre y Apellido" />
						
						<input type="text" name="empresa" id="empresa" required="required" class="form light" placeholder="Empresa" />						
						
					</div><!-- End Left Inputs -->
					
					<!-- Right Inputs -->
					<div class="col-xs-6 animated" data-animation="fadeInRight" data-animation-delay="300">
						<!-- Email -->
						<input type="email" name="mail" id="mail" required="required" class="form light" placeholder="E-mail" />
						
						<input type="text" name="color" id="color"  class="form light" placeholder="Color favorito" />
						
					</div><!-- End Right Inputs -->
					
					<!-- Bottom Submit -->
					<div class="relative fullwidth col-xs-12">
						<!-- Send Button -->
						<button type="submit" id="submit" name="submit" class="form-btn light">Inscribirse</button> 
					</div><!-- End Bottom Submit -->
					<!-- Clear -->
					<div class="clear"></div>
				</form>

				<!-- Your Mail Message -->
				<div class="mail-message-area">
				
					<!-- Message -->
					<div class="alert gray-bg mail-message not-visible-message">
						<strong>Gracias !</strong> Tu email ha sido inscripto en la Newsletter.
					</div>
					
				</div>

			</div><!-- End Contact Form Area -->
		</div><!-- End Inner -->
	</section><!-- End Contact Section -->



	<!-- Contact Section -->
	<section id="contact" class="container parallax5">
		<!-- Contact Inner -->
		<div class="inner contact">

			<!-- Header -->
			<h1 class="header semibold white">CONTACTO</h1>

			<!-- Description -->
			<h4 class="h-desc white contact-text">Comunicate con nosotros, tal vez el futuro nos una.  </h4>

			<!-- Form Area -->
			<div class="contact-form">
				<!-- Form -->
				<form id="contact-us" method="post" action="{{ route('contacto') }}">
					<!-- Left Inputs -->
					<div class="col-xs-6 animated" data-animation="fadeInLeft" data-animation-delay="300">
						<!-- Name -->
						<input type="text" name="name" id="name" required="required" class="form light" placeholder="Nombre" />
						<!-- Email -->
						<input type="email" name="mail" id="mail" required="required" class="form light" placeholder="E-mail" />
						<!-- Subject -->
						<input type="text" name="subject" id="subject" required="required" class="form light" placeholder="Asunto" />
					</div><!-- End Left Inputs -->
					<!-- Right Inputs -->
					<div class="col-xs-6 animated" data-animation="fadeInRight" data-animation-delay="300">
						<!-- Message -->
						<textarea name="message" id="message" class="form textarea light"  placeholder="Mensaje"></textarea>
					</div><!-- End Right Inputs -->
					<!-- Bottom Submit -->
					<div class="relative fullwidth col-xs-12">
						<!-- Send Button -->
						<button type="submit" id="submit" name="submit" class="form-btn light">Enviar</button> 
					</div><!-- End Bottom Submit -->
					<!-- Clear -->
					<div class="clear"></div>
				</form>

				<!-- Your Mail Message -->
				<div class="contact-message-area">
					<!-- Message -->
					<div class="alert gray-bg mail-message not-visible-message">
						<strong>Gracias !</strong> Tu email ha sido recibido.
					</div>
				</div>

			</div><!-- End Contact Form Area -->
		</div><!-- End Inner -->
	</section><!-- End Contact Section -->




	



	<!-- Site Socials and Address -->
	<section id="site-socials" class="no-padding white-bg">
		<div class="site-socials inner no-padding">
			<!-- Socials -->
			<div class="socials">
				<!-- Facebook -->
				<a href="{{ $config['url_facebook'] }}" target="_blank" class="social">
					<i class="fa fa-facebook"></i>
				</a>
				<!-- Twitter -->
				<a href="{{ $config['url_twitter'] }}" target="_blank" class="social">
					<i class="fa fa-twitter"></i>
				</a>
				<!-- Google Plus -->
				<a href="{{ $config['url_googleplus'] }}" target="_blank" class="social">
					<i class="fa fa-google-plus"></i>
				</a>
				<!-- Linkedin -->
				<a href="{{ $config['url_linkedin'] }}" target="_blank" class="social">
					<i class="fa fa-linkedin"></i>
				</a>

			</div>
			<!-- Adress, Mail -->
			<div class="address">
				<!-- Phone Number, Mail -->
				<p>{{ $config['telefono'] }} & <a href="mailto:{{ $config['contacto'] }}" class="bold dark">{{ $config['contacto'] }}</a></p>
				<!-- Adress -->
				<p>Paraguay 390, <span class="bold colored">Buenos Aires, Argentina</span></p>
				<!-- Top Button -->
				<a href="#home" class="scroll top-button">
					<i class="fa fa-angle-double-up"></i>
				</a>
			</div><!-- End Adress, Mail -->
		</div><!-- End Inner -->
	</section><!-- End Site Socials and Address -->





	<!-- Footer -->
	<footer class="footer">
		<!-- Your Company Name -->
		<h2 class="company-name condensed uppercase white bold">GENERACION DE IDEAS</h2>
		<!-- Copyright -->
		<p class="copyright normal">© 2014 All Rights Reserved. Designed by
				<a href="http://www.puropresente.com" target="_blank" class="white">Puro Presente</a>
		</p>
	</footer><!-- End Footer -->	


	<!-- JS Files -->	
	<script type="text/javascript" src="js/front/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/front/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/front/jquery.appear.js"></script>
	<script type="text/javascript" src="js/front/waypoints.min.js"></script>
	<script type="text/javascript" src="js/front/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="js/front/modernizr-latest.js"></script>
	<script type="text/javascript" src="js/front/SmoothScroll.js"></script>
	<script type="text/javascript" src="js/front/jquery.parallax-1.1.3.js"></script>
	<script type="text/javascript" src="js/front/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="js/front/jquery.superslides.js"></script>
	<script type="text/javascript" src="js/front/jquery.flexslider.js"></script>
	<script type="text/javascript" src="js/front/jquery.isotope.js"></script>
	<script type="text/javascript" src="js/front/jquery.mb.YTPlayer.js"></script>
	<script type="text/javascript" src="js/front/jquery.fitvids.js"></script>
	<script type="text/javascript" src="js/front/jquery.slabtext.js"></script>
	<script type="text/javascript" src="js/front/plugins.js"></script>

	<!-- Theme Panel JS -->
	<script type="text/javascript" src="theme-panel/theme-panel.js"></script>

	 <!-- End JS Files -->
	<script src="js/front/owl.carousel.min.js"></script>

	<!-- CLIENTS CAROUSEL -->
	<script>
	//<![CDATA[
		$(document).ready(function() {
    		$("#clients").owlCarousel({
				autoPlay: 3000, //Set AutoPlay to 3 seconds
				items : 4,
				itemsDesktop : [1199,3],
				itemsDesktopSmall : [979,3]
			});
			
			<!-- FULL CAROUSEL -->
 			$("#full").owlCarousel({
				navigation : true, 
				itemsCustom : [ 
				[0, 1], [450, 2], [600, 2], [700, 2], [1000, 3], [1200, 5], [1400, 7], [1600, 9]  ], //Number of images to screen width
			});
		});
	//]]>
		
</script>
</body>
</html>
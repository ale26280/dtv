 /* ==============================================
Page Loader
=============================================== */

$(window).load(function() {
	'use strict';
	$(".loader-item").delay(700).fadeOut();
	$("#pageloader").delay(1200).fadeOut("slow");
});

 /* ==============================================
Fit Videos
=============================================== */
$(window).load(function(){
	'use strict';
     $(".fit-vids").fitVids();
 });

/* ==============================================
Drop Down Menu Fade Effect
=============================================== */	

$('.nav-toggle').hover(function() {
	'use strict';
    $(this).find('.dropdown-menu').first().stop(true, true).slideDown(250);
    }, function() {
    $(this).find('.dropdown-menu').first().stop(true, true).slideUp(250)
 });

/* ==============================================
Mobile Menu Button
=============================================== */	

$('.mini-nav-button').click(function() {
    $(".nav-menu").slideToggle("9000");
 });

$('.nav a').click(function () {
	if ($(window).width() < 970) {
    	$(".nav-menu").slideToggle("2000")}
	
});

/* ==============================================
Flex Slider Home Page
=============================================== */	
	
 $(window).load(function(){
	  'use strict';

      $('.hometexts').flexslider({
        animation: "slide",
		selector: ".slide-text .hometext",
		controlNav: false,
		directionNav: false ,
		slideshowSpeed: 4000,  
		direction: "vertical",
        start: function(slider){
         $('body').removeClass('loading'); 
        }
      });
 });


 /* ==============================================
Flex Slider Home Page Animated Version
=============================================== */	
	
 $(window).load(function(){
	  'use strict';
		
      $('.hometexts-1').flexslider({
        animation: "fade",
		selector: ".slide-text-1 .hometext-1",
		controlNav: false,
		directionNav: false ,
		slideshowSpeed: 5000,  
		direction: "horizontal",
        start: function(slider){
         $('body').removeClass('loading'); 
        }
      });
 });

/* ==============================================
Flex Slider Home Page V5
=============================================== */	
	
 $(window).load(function(){
	  'use strict';
		
      $('.hometexts-5').flexslider({
        animation: "fade",
		selector: ".slide-text-5 .hometext-5",
		controlNav: false,
		directionNav: true ,
		slideshowSpeed: 5000,  
		direction: "horizontal",
        start: function(slider){
         $('body').removeClass('loading'); 
        }
      });
 });

  /* ==============================================
Flex Slider Blog
=============================================== */	
	
 $(window).load(function(){
	  'use strict';
		
      $('.post .flex').flexslider({
        animation: "fade",
		selector: ".post-slides .post-slide",
		controlNav: false,
		directionNav: true ,
		slideshowSpeed: 5000,  
		direction: "horizontal",
        start: function(slider){
         $('body').removeClass('loading'); 
        }
      });
 });


/* ==============================================
Home Super Slider (images)
=============================================== */

 $('#slides').superslides({
      animation: 'fade',
    });

 /* ==============================================
Scroll Navigation
=============================================== */	

$(function() {
		'use strict';

		$('.scroll').bind('click', function(event) {
			var $anchor = $(this);
			var headerH = $('#navigation').outerHeight();
			$('html, body').stop().animate({
				scrollTop : $($anchor.attr('href')).offset().top - headerH + "px"
			}, 1200, 'easeInOutExpo');

			event.preventDefault();
		});
	});



 /* ==============================================
Active Navigation Calling
=============================================== */

$('body').scrollspy({ 
	target: '.nav-menu',
	offset: 95
})

 /* ==============================================
Tooltips Calling
=============================================== */	

$('[data-toggle="tooltip"]').tooltip();

/* ==============================================
Navigation Scroll Effect
=============================================== */


$(document).ready(function () {
	'use strict';

    var menu = $('#navigation');

    $(window).scroll(function () {
        var y = $(this).scrollTop();
        var z = $('.waypoint').offset().top - 200;

        if (y >= z) {
            menu.removeClass('not-visible-nav').addClass('visible-nav');
        }
        else{
            menu.removeClass('visible-nav').addClass('not-visible-nav');
        }
    });

});


 /* ==============================================
Flex Slider Testimonials
=============================================== */	
	
 $(window).load(function(){
	  'use strict';
		
      $('.inner').flexslider({
        animation: "fade",
		selector: ".t-slides .monial",
		controlNav: false,
		directionNav: true ,
		slideshowSpeed: 7000,  
		direction: "horizontal",
        start: function(slider){
          $('body').removeClass('loading'); 
        }
      });
 });


 /* ==============================================
Pretty Photo
=============================================== */	
	
	jQuery(document).ready(function(){
    jQuery("a[data-rel^='prettyPhoto']").prettyPhoto({
        theme: "light_square",
    });
  });



/* ==============================================
Parallax Calling
=============================================== */


( function ( $ ) {
'use strict';
$(document).ready(function(){
$(window).bind('load', function () {
		parallaxInit();						  
	});
	function parallaxInit() {
		testMobile = isMobile.any();
		if (testMobile == null)
		{
			$('.image1').parallax("50%", 0.5);
			$('.image2').parallax("50%", 0.5);
			$('.image3').parallax("50%", 0.5);
			$('.image4').parallax("50%", 0.5);
			$('.parallax').parallax("-50%", 0.3);
			$('.parallax1').parallax("50%", 0.5);
			$('.parallax2').parallax("50%", 0.5);
			$('.parallax3').parallax("50%", 0.5);
			$('.parallax4').parallax("50%", 0.5);
			$('.parallax5').parallax("50%", 0.5);
			$('.parallax6').parallax("50%", 0.5);
		}
	}	
	parallaxInit();	 
});	
//Mobile Detect
var testMobile;
var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};
}( jQuery ));


/* ==============================================
Slap Text for Typography
=============================================== */	

  // Function to slabtext the H1 headings
    function slabTextHeadlines() {
        $(".typographic h1, .typographic h2").slabText({
            // Don't slabtext the headers if the viewport is under 380px
            "viewportBreakpoint":300
        });
    };
    
    // Called one second after the onload event for the demo (as I'm hacking the
    // fontface load event a bit here)

    // Please do not do this in a production environment - you should really use
    // google WebFont loader events (or something similar) for better control
    $(window).load(function() {
        // So, to recap... don't actually do this, it's nasty!
        setTimeout(slabTextHeadlines, 1000);
    });

 /* ==============================================
Our Works / isotope Scripts
===============================================	*/

var isotopes = [];

       $(window).load(function() {
       	'use strict';
	      
	      var $container = $('.portfolio-items');
		  
		  $container.each(function() {

			$(this).isotope({		
				resizable: false, 
				masonry: { columnWidth: $container.width() / 5 },
				itemSelector : '.work'
			});
			
			var instance = $(this);
			
			isotopes.push( this );

			var categoria = $(this).data('category');

			var optionSets = $('#' + categoria +'_menu .option-set'),
				optionLinks = optionSets.find('a');

			optionLinks.click(function() {
			
				var _this = $(this);
				
				// don't proceed if already selected
				if ( _this.hasClass('selected') ) {
					return false;
				}
				
				var optionSet = _this.parents('.option-set');
				optionSet.find('.selected').removeClass('selected');
				_this.addClass('selected');

				// make option object dynamically, i.e. { filter: '.my-filter-class' }
				var options = {},
					key = optionSet.attr('data-option-key'),
					value = _this.attr('data-option-value');
					
					// parse 'false' as false boolean
				value = value === 'false' ? false : value;
				options[ key ] = value;
				if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
					// changes in layout modes need extra logic
					changeLayoutMode( _this, options )
				} else {
					// otherwise, apply new options
					instance.isotope( options );
				}

				return false;
			});
		  

			//expander
			var loader = $('#'+ categoria +'-expander');
			
			if(typeof loader.html() == 'undefined'){
				$('<div class="'+ categoria +'-expander"><div id="'+ categoria +'-item-expander" class="container clearfix relative"><p class="cls-btn"><a class="close">X</a></p><div/></div></div>').css({opacity:0}).hide().insertAfter('#'+ categoria +'_portfolio');
				loader = $('.item-expander');
			}
			
			instance.find('.expander').on('click', function(e){
			
				e.preventDefault();
				e.stopPropagation();
				var url = $(this).attr('href');
				
				loader.slideUp(function(){
				
					$(".item-expander").hide();
				
					$.get(url, function(data) {
					
						var portfolioContainer = $('#'+ categoria +'_portfolio');
						var topPosition = portfolioContainer.offset().top;
						var bottomPosition = topPosition + portfolioContainer.height();
						$('html,body').delay(600).animate({ scrollTop: bottomPosition - -10}, 800);
						var container = $('#'+ categoria +'-item-expander>div', loader);
						
						container.html(data);
						
						 $(".fit-vids").fitVids();
						 
						$('.project').flexslider({
							animation: "fade",
							selector: ".project-slides .slide",
							controlNav: true,
							directionNav: true ,
							slideshowSpeed: 5000,
							slideshow: false
						  });
						
					//	 container.fitVids();
						loader.slideDown(function(){
							if(typeof keepVideoRatio == 'function'){
								keepVideoRatio('.project-video > iframe');
							}
						}).delay(1000).animate({opacity:1}, 200);
					});
				});
			});
			
			$('.close', loader).on('click', function(){

				loader.delay(300).slideUp(function(){
					var container = $('#'+ categoria +'-item-expander>div', loader);
					container.html('');
					$(this).css({opacity:0});
					
				});
				var portfolioContainer = $('#'+ categoria +'_portfolio');
					var topPosition = portfolioContainer.offset().top;
					$('html,body').delay(0).animate({ scrollTop: topPosition - 70}, 500);
			});	


		$(this).isotope('layout');
	});

	
});


/* ==============================================
Animated Items
=============================================== */	
	jQuery(document).ready(function($) {
	
	'use strict';
	
	
	// AGREGO EVENTOS DE PAGINADO
	$("P.ver_mas A").each(function() {
	
		$(this).click(function() {
		
			var categoria = this.id.substr(4, this.id.length );
			var categoriaShort = categoria.substr(0,3);
			var index = $("DIV.work_"+ categoria).length;
			var url = "fichas/"+ categoriaShort +"/" + index;
			var catIndex = 0; // Default 'experience'
			
			switch ( categoria ) {
			
				case 'media':
					catIndex = 2;
					break;
					
				case 'entertaiment':
					catIndex = 1;
					break;
			}
			
			// Cargando ...
			$("#mas_" + categoria ).text("Cargando...");

			
			// Ver menos
			
			if ( this.id.substr(0, 3) == 'men' ) {

					$( isotopes[catIndex] ).isotope('remove', $("DIV."+ categoria +"_remove") );
					
					$( isotopes[catIndex] ).isotope();
					
					var topPosition = $('#'+ categoria +'_portfolio').offset().top;
					$('html,body').delay(0).animate({ scrollTop: topPosition - 70}, 500);
			
					$("#men_" + categoria ).text("Ver más...");
					
					$("#men_" + categoria ).attr("id", "mas_" + categoria);		
				

			// Ver mas
			} else {

				$.ajax({
				
					url: url,
					method : "post",
					dataType: "json"
					
				}).success(function(resp) {
				
					var total = resp.data.length;
					var elements = [];
					var images = [];
					
					var strCategoria = categoria.charAt(0).toUpperCase() + categoria.slice(1);
					
					for (var i =0; i < total; i++) {
					
						if ( i == total -1) {
						
							images[i] = new Image();
							images[i].src = "storage/fotos/fichas/"+ resp.data[i].imagen_principal;
							images[i].onload = function() {
							
								$( isotopes[catIndex] ).isotope('insert', elements);
								
								$( isotopes[catIndex] ).isotope('layout');
								
								
								// Si es el ultimo pongo "VER MENOS" en el boton
								if ( resp.next < 1 ) {
									$("#mas_" + categoria ).text("Ver menos...");
									
								} else {
								
									$("#mas_" + categoria ).text("Ver más...");								
								}

							};
						}
					

						// Elemento HTML
						
						var style = "";
						
						if ( categoria == 'entertaiment' ) {
							style = "color:#FFFFFF;";
						}
						

			
						var html = "";				
						html +=		"	<div class='work-inner'>";				
						html +=		"		<!-- Image -->";
						html +=		"		<div class='work-image'>";
						html +=		"			<a href='portfolio/"+ resp.data[i].id +"' class='expander'>";
						html +=		"				<img id='img_"+ resp.data[i].id +"' src='storage/fotos/fichas/"+ resp.data[i].imagen_principal +"' alt='' />";
						html +=		"				<span class='positive'></span>";
						html +=		"			</a>";
						html +=		"		</div>";
						html +=		"		<!-- Work Details -->";
						html +=		"		<div class='work-bottom'>";
						html +=		"			<p class='work-name uppercase normal no-margin' style='"+ style +"'>"+ resp.data[i].titulo +"</p>";
						html +=		"			<p class='work-categoria normal no-margin'>"+ strCategoria +"</p>";
						html +=		"			<a href='storage/fotos/fichas/"+ resp.data[i].imagen_principal +"' data-rel='prettyPhoto[gallery]' class='work-link' ><span class='arrow'></span></a>";
						html +=		"		</div>";
						html +=		"	</div>";

						
						// Armado de TAGS
						
						var tagString = "";
						
						for (var x=0; x<resp.data[i].tags.length; x++ ) {
						
							tagString += " tag_" + resp.data[i].tags[x].tag.toLowerCase();;
						}

						

						
						var div = document.createElement("DIV");
						$(div).attr( "class", "work_"+ categoria +" "+ categoria +"_remove work five" + tagString );
						$(div).html( html );


						// Sumamos el elemento al array
						elements.push( div );
						
						
						//
						// Expander
						//
						var loader = $('#'+ categoria +'-expander');
						
						if(typeof loader.html() == 'undefined') {
							$('<div class="'+ categoria +'-expander"><div id="'+ categoria +'-item-expander" class="container clearfix relative"><p class="cls-btn"><a class="close">X</a></p><div/></div></div>').css({opacity:0}).hide().insertAfter('#'+ categoria +'_portfolio');
							loader = $('.item-expander');
						}
						
						$(div).find('.expander').on('click', function(e){
							e.preventDefault();
							e.stopPropagation();
							var url = $(this).attr('href');

							loader.slideUp(function(){
							
								$(".item-expander").hide();
							
								$.get(url, function(data) {
								
									var portfolioContainer = $('#'+ categoria +'_portfolio');
									var topPosition = portfolioContainer.offset().top;
									var bottomPosition = topPosition + portfolioContainer.height();
									$('html,body').delay(600).animate({ scrollTop: bottomPosition - -10}, 800);
									var container = $('#'+ categoria +'-item-expander>div', loader);
									
									container.html(data);
									
									 $(".fit-vids").fitVids();
									 
									$('.project').flexslider({
										animation: "fade",
										selector: ".project-slides .slide",
										controlNav: true,
										directionNav: true ,
										slideshowSpeed: 5000,  
									  });
									
								//	 container.fitVids();
									loader.slideDown(function(){
										if(typeof keepVideoRatio == 'function'){
											keepVideoRatio('.project-video > iframe');
										}
									}).delay(1000).animate({opacity:1}, 200);
								});
							});
						});
						
						$('.close', loader).on('click', function(){

							loader.delay(300).slideUp(function(){
								var container = $('#'+ categoria +'-item-expander>div', loader);
								container.html('');
								$(this).css({opacity:0});
								
							});
							var portfolioContainer = $('#'+ categoria +'_portfolio');
								var topPosition = portfolioContainer.offset().top;
								//$('html,body').delay(0).animate({ scrollTop: topPosition - 70}, 500);
						});
						
						
						//
						//	Pretty Photo
						//
						$(div).find("a[data-rel^='prettyPhoto']").prettyPhoto({
							theme: "light_square",
						});

					}
					
					
					//
					// Insertar elemento
					//
					
					if ( resp.next < 1 ) {
					
						$("#mas_" + categoria ).attr("id", "men_" + categoria);
						
						$("#men_" + categoria ).text("Ver menos");
						
						return false;
						
					}
				});
				
			}
				
				
		});
	});	

	
	$("A[id^='menos_']").click(function() {
	
		alert( this.id );
	});

	
	
    	$('.animated').appear(function() {
	        var elem = $(this);
	        var animation = elem.data('animation');
	        if ( !elem.hasClass('visible') ) {
	        	var animationDelay = elem.data('animation-delay');
				

	            if ( animationDelay ) {

	                setTimeout(function(){
	                    elem.addClass( animation + " visible" );
	                }, animationDelay);

	            } else {
	                elem.addClass( animation + " visible" );
	            }
				

	        }
	    });
});



 /* ==============================================
Count Factors
 =============================================== */	
  

		jQuery(function() {

				$(".fact-number").appear(function(){
				$('.fact-number').each(function(){
	        	dataperc = $(this).attr('data-perc'),
				$(this).find('.factor').delay(6000).countTo({
	            from: 50,
	            to: dataperc,
	            speed: 3000,
	            refreshInterval: 50,
	            
        	});  
		});
					});
});
 
(function($) {
    $.fn.countTo = function(options) {
        // merge the default plugin settings with the custom options
        options = $.extend({}, $.fn.countTo.defaults, options || {});

        // how many times to update the value, and how much to increment the value on each update
        var loops = Math.ceil(options.speed / options.refreshInterval),
            increment = (options.to - options.from) / loops;

        return $(this).each(function() {
            var _this = this,
                loopCount = 0,
                value = options.from,
                interval = setInterval(updateTimer, options.refreshInterval);

            function updateTimer() {
                value += increment;
                loopCount++;
                $(_this).html(value.toFixed(options.decimals));

                if (typeof(options.onUpdate) == 'function') {
                    options.onUpdate.call(_this, value);
                }

                if (loopCount >= loops) {
                    clearInterval(interval);
                    value = options.to;

                    if (typeof(options.onComplete) == 'function') {
                        options.onComplete.call(_this, value);
                    }
                }
            }
        });
    };

    $.fn.countTo.defaults = {
        from: 0,  // the number the element should start at
        to: 100,  // the number the element should end at
        speed: 1000,  // how long it should take to count between the target numbers
        refreshInterval: 100,  // how often the element should be updated
        decimals: 0,  // the number of decimal places to show
        onUpdate: null,  // callback method for every time the element is updated,
        onComplete: null,  // callback method for when the element finishes updating
    };
})(jQuery);





/* ==============================================
Video Script
=============================================== */

jQuery(function(){
			'use strict';

            jQuery(".player").mb_YTPlayer();
		});	
	



 /* ==============================================
Contact Form
=============================================== */	

$(document).ready(function() {
		'use strict';
		
		$('form#contact-us').submit(function() {
			$('form#contact-us .error').remove();
			var hasError = false;
			$('.requiredField').each(function() {
				if($.trim($(this).val()) == '') {
					var labelText = $(this).prev('label').text();
					$(this).parent().append('<span class="error">Your forgot to enter your '+labelText+'.</span>');
					$(this).addClass('inputError');
					hasError = true;
				} else if($(this).hasClass('email')) {
					var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
					if(!emailReg.test($.trim($(this).val()))) {
						var labelText = $(this).prev('label').text();
						$(this).parent().append('<span class="error">Sorry! You\'ve entered an invalid '+labelText+'.</span>');
						$(this).addClass('inputError');
						hasError = true;
					}
				}
			});
			if(!hasError) {
				var formInput = $(this).serialize();
				$.post($(this).attr('action'),formInput, function(data){
					$('.mail-message').removeClass('not-visible-message').addClass('visible-message');
					return false;
				});
			}
			
			return false;	
		});
	});




 /* ==============================================
Newsletter Form
=============================================== */	

$(document).ready(function() {
		'use strict';
		
		$('form#newsletter').submit(function() {
		
			$('form#newsletter .error').remove();
			var hasError = false;
			
			$('.requiredField').each(function() {
				if($.trim($(this).val()) == '') {
					var labelText = $(this).prev('label').text();
					$(this).parent().append('<span class="error">Your forgot to enter your '+labelText+'.</span>');
					$(this).addClass('inputError');
					hasError = true;
					
				} else if($(this).hasClass('email')) {
					var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
					if(!emailReg.test($.trim($(this).val()))) {
						var labelText = $(this).prev('label').text();
						$(this).parent().append('<span class="error">Sorry! You\'ve entered an invalid '+labelText+'.</span>');
						$(this).addClass('inputError');
						hasError = true;
					}
				}
			});
			if(!hasError) {
			
				$("newsletter").css("height", "500px");		
			
				var formInput = $(this).serialize();
				$.post( $(this).attr('action'), formInput, function(data) {
					$('.mail-message').removeClass('not-visible-message').addClass('visible-message');
					return false;
				});
			}
			
			return false;	
		});
	});






/* ==============================================
Google Map
=============================================== */

$(document).ready(function() {
			'use strict';			
			
			//Google Map Open&Close Effect
			$( ".newsletter-big-button" ).click(function(){
				$( "#newsletter-button" ).toggleClass( "close-newsletter-button", "open-newsletter-button", 1000 );
				$( "#newsletter-button" ).toggleClass( "open-newsletter-button", "close-newsletter-button", 1000 );
				$( "#newsletter" ).toggleClass( "close-map", "open-map", 1000 );
				$( "#newsletter" ).toggleClass( "open-map", "close-map", 1000 );
				return false;
			});

			//Google Map Open&Close Effect
			$( ".google-map-big-button" ).click(function(){
				$( "#map-button" ).toggleClass( "close-map-button", "open-map-button", 1000 );
				$( "#map-button" ).toggleClass( "open-map-button", "close-map-button", 1000 );
				$( "#map" ).toggleClass( "close-map", "open-map", 1000 );
				$( "#map" ).toggleClass( "open-map", "close-map", 1000 );
				return false;
			});

			// Map Coordination
			
			var latlng = new google.maps.LatLng(lat,lon);

			// Map Options
			var myOptions = {
				zoom: 15,
				center: latlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				disableDefaultUI: true,
				scrollwheel: false,
			};

			var map = new google.maps.Map(document.getElementById('google-map'), myOptions);

			// Marker Image
			var image = 'images/marker.png';
			
		  	/* ========= First Marker ========= */

		  	// First Marker Coordination
			
			var myLatlng = new google.maps.LatLng(lat,lon);

			// Your Texts 

			 var contentString = '<div id="content">'+
			  '<div id="siteNotice">'+
			  '</div>'+
			  '<h4>' +

			  'GDI'+

			  '</h4>'+
			  '<p>' +

			  'Generacion de ideas.' +

			  '</p>'+
			  '</div>';
			

			var marker = new google.maps.Marker({
				  position: myLatlng,
				  map: map,
				  title: 'GDI - Generacion de ideas',
				  icon: image
			  });


			var infowindow = new google.maps.InfoWindow({
			  content: contentString
			  });

			  
			 google.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map,marker);
			  });

			 /* ========= End First Marker ========= */
		
		})




// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1400, 'easeInOutExpo');
        event.preventDefault();
    });
});

jQuery(document).ready(function($){
	// browser window scroll (in pixels) after which the "back to top" link is shown
	var offset = 300,
		//browser window scroll (in pixels) after which the "back to top" link opacity is reduced
		offset_opacity = 1200,
		//duration of the top scrolling animation (in ms)
		scroll_top_duration = 700,
		//grab the "back to top" link
		$back_to_top = $('.cd-top');

	//hide or show the "back to top" link
	$(window).scroll(function(){
		( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
		if( $(this).scrollTop() > offset_opacity ) { 
			$back_to_top.addClass('cd-fade-out');
		}
	});

	//smooth scroll to top
	$back_to_top.on('click', function(event){
		event.preventDefault();
		$('body,html').animate({
			scrollTop: 0 ,
		 	}, scroll_top_duration
		);
	});

});




$('.wodryRX').wodry({
    animation: 'rotateX',
    delay: 2000,
    animationDuration: 800
});

(function(){
$(window).scroll(function() {

    // check if window scroll for more than 430px. May vary
    // as per the height of your main banner.
    
    if($(this).scrollTop() > 430) { 
        $('.navbar').addClass('opaque'); // adding the opaque class
    } else {
        $('.navbar').removeClass('opaque'); // removing the opaque class
    }
});
})();
    
function scroll_dipper(id) {
        $('#inset_slide').scrollTo( $('#' + id), 500 );
      }
    



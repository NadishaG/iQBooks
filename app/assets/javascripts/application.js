	// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function() {
	$('#myCarousel').carousel({
		interval: false
	});
	$('#myCarousel_1').carousel({
		interval: false
	});
	$('#myCarousel_2').carousel({
		interval: false
	});
	$('#myCarousel_3').carousel({
		interval: false
	});
	$('#myCarousel_4').carousel({
		interval: false
	});

	$('.dropdown').click(function(){
		$('.dropdown-toggle').dropdown()
	});

});	

function rating_hover(_this){
	var i = $(_this).data("star-no")
	for(j=i;j>=1;j--){
		$('#star_'+j).removeClass('empty_star').addClass('complete_star')
	}
}

function default_rating(_this){
	var i = $(_this).data("star-no")
	for(j=i;j>=1;j--){
		$('#star_'+j).removeClass('complete_star').addClass('empty_star')
	}
}

function rating(_this){
	var i = $(_this).data('star-no')
	var book_id = $('#star_1').data('book-id')
	var book_review = $('#star_1').data('review-record')
	for(j=i;j>=1;j--){
		$('#star_'+j).removeClass('empty_star').addClass('complete_star')
	}

	if(book_review){
		$.get('/book_reviews/'+ book_review +'/edit?book_id='+ book_id+'&star_no='+i,null)
	}
	else{
		$.get('/book_reviews/new?book_id='+ book_id +'&star_no='+i, null)
	}
}

$.fn.scrollTo = function( target, options, callback ){
	if(typeof options == 'function' && arguments.length == 2){ callback = options; options = target; }
	var settings = $.extend({
		scrollTarget  : target,
		offsetTop     : 50,
		duration      : 500,
		easing        : 'swing'
	}, options);
	return this.each(function(){
		var scrollPane = $(this);
		var scrollTarget = (typeof settings.scrollTarget == "number") ? settings.scrollTarget : $(settings.scrollTarget);
		var scrollY = (typeof scrollTarget == "number") ? scrollTarget : scrollTarget.offset().top + scrollPane.scrollTop() - parseInt(settings.offsetTop);
		scrollPane.animate({scrollTop : scrollY }, parseInt(settings.duration), settings.easing, function(){
			if (typeof callback == 'function') { callback.call(this); }
		});
	});
}



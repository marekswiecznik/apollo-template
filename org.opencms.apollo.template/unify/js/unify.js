$('.dropdown').click(function() {
	if ($(this).hasClass('ap-open')) {
		$(this).removeClass('ap-open');
	} else {
		$('.dropdown.ap-open').removeClass('ap-open');
		$(this).addClass('ap-open');
		$('html, body').animate({
			scrollTop : $(this).offset().top - 100
		}, 1000);
	}
});
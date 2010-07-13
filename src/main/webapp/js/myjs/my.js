$(function() {
	$(".datefield").datepicker({
		showOn: 'button',
		buttonImageOnly: true ,
		buttonImage: datepicker_image_path,
		closeText: 'Zamknij',
		currentText: 'Dzisiaj',
		dateFormat: 'yy-mm-dd',
		dayNamesMin: ['Nd', 'Pn', 'Wt', 'Śr', 'Cz', 'Pt', 'Sb'],
		firstDay: 1,
		onClose: function(dateText, inst) { $(this).focus(); },
		monthNames: ['Styczeń','Luty','Marzec','Kwiecień','Maj','Czerwiec','Lipiec','Sierpień','Wrzesień','Październik','Listopad','Grudzień'],
		showButtonPanel: true 
	});
	
	$("input:submit").button();

});
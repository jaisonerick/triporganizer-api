$(function() {
  $('.company-type-select').each(function() {
    $(this).on('change', function() {
      var val = $(this).val();

      if(val === 'hotel' || val === 'place') {
        $('.company-location').show();
      }
      else {
        $('.company-location').hide();
      }

      $('.places-map').trigger('maps:reload');
    });

    $(this).trigger('change');
  });
});

$(function() {
  function reloadTransport(val) {
    var id = "#transport_" + val;

    $('.transport-mean').hide();
    $('.transport-mean input').attr('disabled', true);

    $(id).show();
    $(id + ' input').attr('disabled', false);
  }

  $('#transport_mean').each(function() {
    $(this).change(function() {
      reloadTransport($(this).val());
    });

    reloadTransport($(this).val());
  });
});

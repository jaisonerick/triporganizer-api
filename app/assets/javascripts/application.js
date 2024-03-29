// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.adaptive-backgrounds
//= require jquery.scrollTo.min
//= require_tree ./application
//= require_self

$(function() {
  $.adaptiveBackground.run({
    normalizeTextColor: true,
    normalizedTextColors: {
      light: '#fff',
      dark: '#333'
    }
  });

  $('iframe').each(function() {
    var winHeight = $(window).height(),
        offsetTop = $(this).offset().top,
        iframeHeight = winHeight - offsetTop - 23;

    $(this).css({height: iframeHeight});
  });

  $('.itinerary-item.itinerary-item--color-2:first').parents('.itinerary__day').each(function() {
    $(window).scrollTo($(this), 300);
  });
});

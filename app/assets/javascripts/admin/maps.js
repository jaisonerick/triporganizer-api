function googleMapsLoaded() {
  $('.places-autocomplete').each(function() {
    var input = $(this).get(0);
    var mapDiv = $('.places-map').get(0);
    var map = null;
    var latitude = Number($('.places-latitude').val() || -27.5953778);
    var longitude = Number($('.places-longitude').val() || -48.5480499);
    var marker = null;
    if(mapDiv) {
      map = new google.maps.Map(mapDiv, {
        center: {lat: latitude, lng: longitude},
        zoom: 15
      });

      marker = new google.maps.Marker({
        position: {lat: latitude, lng: longitude},
      });

      marker.setMap(map);
    }

    var autocomplete = new google.maps.places.Autocomplete(input);
    // if(map) {
    //   autocomplete.bindTo('bounds', map);
    // }

    autocomplete.addListener('place_changed', function() {
      var place = autocomplete.getPlace();
      if(!place.geometry) {
        console.err("Autocomplete's returned place contains no geometry");
        return;
      }

      // console.log("name", place.name);
      if(place.geometry.viewport) {
        console.log("viewport", place.geometry.viewport);
      }
      //
      console.log("location", place.geometry.location);
      // console.log("icon", place.icon);

      map.panTo(place.geometry.location);
      var location = place.geometry.location;
      $('.places-latitude').val(location.lat());
      $('.places-longitude').val(location.lng());

      map.setZoom(15);

      if(marker) {
        marker.setMap(null);
      }

      setTimeout(function() {
        marker = new google.maps.Marker({
          position: place.geometry.location,
          animation: google.maps.Animation.DROP,
        });
        marker.setMap(map);
      }, 200);

      $(input).val(place.name);

      var address = '';
      if (place.address_components) {
        address = [
          (place.address_components[0] && place.address_components[0].short_name || ''),
          (place.address_components[1] && place.address_components[1].short_name || ''),
          (place.address_components[2] && place.address_components[2].short_name || '')
        ].join(' ');
      }
      $('.places-address').val(address);
      if(place.photos && place.photos.length > 0) {
        var image = place.photos[Math.floor(Math.random()*place.photos.length)].getUrl({ maxWidth: 1920 });
        $('.places-image-form').val(image);
        $('.places-image-tag').attr('src', image);
      }


      // place.photos.forEach(function(photo) {
      //   var url = photo.getUrl({ maxWidth: 1920 });
      //   images.append('<div class="col-md-3">' +
      //     '<a href="#" class="thumbnail">' +
      //       '<img src="' + url + '" />' +
      //     '</a>' +
      //   '</div>');
      // });

      console.log("address", address);

    });
  });
}

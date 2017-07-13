# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#_search = ->
  # map = new google.maps.Map(document.getElementById("map-canvas"))

  # geocoder.geocode( { 'address': address}, function(results, status) {
  #   if (status == google.maps.GeocoderStatus.OK) {
  #     map.setCenter(results[0].geometry.location);

  #     marker = new google.maps.Marker({
  #       map: map,
  #       position: results[0].geometry.location
  #     });
  #   }
  # });
  #alert("ボタンをしましたね。")
  $ -> 
    $('#button1').on 'click', ->
      alert 'hiari'
      return
    return
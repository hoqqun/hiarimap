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
$(document).on 'turbolinks:load', -> 
  $('#button1').on 'click', ->
    alert $('#hiari_address').val()
    latlng = new (google.maps.LatLng)(-34.397, 150.644)
    myOptions = 
      zoom: 16
      center: latlng
      mapTypeId: google.maps.MapTypeId.ROADMAP
    geocoder = new (google.maps.Geocoder)
    map = new (google.maps.Map)(document.getElementById('map_new'), myOptions)

    geocoder.geocode { 'address': $('#hiari_address').val() }, (results, status) ->
      if status == google.maps.GeocoderStatus.OK
        map.setCenter results[0].geometry.location
        marker = new (google.maps.Marker)(
          position: results[0].geometry.location
          map: map
          draggable: true)

        google.maps.event.addListener marker, 'dragend', (ev) ->
          # イベントの引数evの、プロパティ.latLngが緯度経度。
          $('#hiari_latitude').val(ev.latLng.lat())
          $('#hiari_longitude').val(ev.latLng.lng())
          return

        $('#hiari_latitude').val(results[0].geometry.location.lat())
        $('#hiari_longitude').val(results[0].geometry.location.lng())
      else
        alert 'Geocode was not successful for the following reason: ' + status

  handler = Gmaps.build('Google')
  handler.buildMap {
     provider: {}
     internal: id: 'map_new'
  }, ->
    markers = handler.addMarkers([ {
       'lat': 35.5945729
       'lng': 139.7527161
     } ], draggable: true)
    handler.bounds.extendWith markers
    handler.fitMapToBounds()
    return

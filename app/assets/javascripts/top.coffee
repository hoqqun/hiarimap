# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  if $("#map_canvas")[0]
    handler = Gmaps.build('Google')
    handler.buildMap {
    provider: {}
    internal: id: 'map_canvas'
    }, ->
      markers = handler.addMarkers(markerList, zoom: 16)
      handler.bounds.extendWith markers
      handler.fitMapToBounds()
      return
# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require bootstrap-sprockets
#= require chosen-jquery
#= require turbolinks
#= require_tree .

$(document).ready ->
	map = undefined
	initMap = ->
	  map = new (google.maps.Map)(document.getElementById('map'),
	    center:
	      lat: -34.6037
	      lng: -58.3816
	    zoom: 8)
	  myLatLng = 
	    lat: -34.6037
	    lng: -58.3816
	  $('#localities').each ->
	  	val = $(this).val().split ";"
	  	console.log 
	  	lat = parseFloat val[0]
	  	lng = parseFloat val[1]
	  	marker = new (google.maps.Marker)(
	  	  position: myLatLng
	  	  map: map
	  	  title: 'Hello World!')
		
	
	$('#localities').on "change", ->
		value = $(this).val().split ";"
		lat = parseFloat value[0]
		lng = parseFloat value[1]
		gMap = new (google.maps.Map)(document.getElementById('map'))
		gMap.setZoom 15
		# This will trigger a zoom_changed on the map
		gMap.setCenter new (google.maps.LatLng)(lat, lng)
		newMarker = new (google.maps.Marker)(
		  map: map
		  animation: google.maps.Animation.DROP
		  position: new (google.maps.LatLng)(lat, lng))
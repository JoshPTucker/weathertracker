<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GeocodeTest</title>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#floating-panel {
	position: absolute;
	top: 10px;
	left: 25%;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}
</style>
</head>
<body>
	<!--   <form onsubmit="init map" action="PlanFlight" method="post"> -->
	<!--     <input type="text" value="" id="site1" name="site1"/> -->
	<!--   	<input type="text" value="" id="site2" name="site2"/> -->
	<!--   	<input type="submit" value="submit" id="submit" name="submit"/> -->
	<!--     </form> -->
	<div id="floating-panel">
		<input id="address" type="text" value="Sydney, NSW"> <input
			id="submit" type="button" value="Geocode">
	</div>
	<div id="map"></div>
	<script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
          center: {lat: -34.397, lng: 150.644}
        });
        var geocoder = new google.maps.Geocoder();

        document.getElementById('submit').addEventListener('click', function() {
          geocodeAddress(geocoder, map);
        });
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('address').value;
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    </script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYL5A6ZTQ3PxBGIJVFhyMvF3KunkTY0-Q&callback=initMap">
    </script>
</body>
</html>
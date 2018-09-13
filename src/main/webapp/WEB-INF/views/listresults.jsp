<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
 
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Home page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/journal/bootstrap.min.css" />
<link rel="stylesheet" href="/style.css" />
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 400px;
        width: 650px;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
</head>
<body>
<h2>Results for ${city} in ${state} Search</h2>
<h3>Filter by Name</h3>
<br>
<form action="/nameSearch" method="post" class="form">
		<div class="form-group row">
			<label for="firstName" class="col-sm-2 col-form-label">First Name:</label>
    		<div class="col-sm-10">
			<input class="form-control" name="firstName" minlength="2" maxlength="10"/>
			</div>
		</div>
		<div class="form-group row">
			<label for="lastName" class="col-sm-2 col-form-label">Last Name:</label>
			<div class="col-sm-10">
			<input class="form-control" name="lastName" pattern="[A-Z][a-z]*"/>
			</div>
		</div>
		<button>Search</button>
</form>
<h3>Filter by Date Range</h3>
<p>Database starts Jan. 1, 2013</p>
<form action="/dateSearch/${state }/${city}">
<table>
	<thead><strong><tr><td>FROM DATE</td><td>TO DATE</td></tr></strong></thead>
		<tr><td><input type="date" name="fromDate" /></td>
		<td><input type="date" name="toDate" /></td></tr>
</table>
<button>SUBMIT</button>
</form>
<br>
 
    <div id="map">
    <script>  
   var locations = new Array(); 
 
    <c:forEach items="${incidents}" var="location">
    //Temp array
    var locationsArray = new Array();
  //lat property 
    var latitude= ${location.latitude}; 
    //long property 
    var longitude= ${location.longitude}; 
    //temp array.push
    locationsArray.push(latitude,longitude);
    //Array push
    locations.push(locationsArray);
    </c:forEach> 
    console.log(locations);
    
    var marker, count;


    function initMap() {
        	  
        	  map = new google.maps.Map(document.getElementById('map'), {
                  center: {lat: locations[0][0], lng: locations[0][1]},
                  zoom: 10
                });
        	  
        	 for (count = 0; count < locations.length; count++) {
        		    marker = new google.maps.Marker({
        		      position: new google.maps.LatLng(locations[count][0], locations[count][1]),
        		      map: map,
        		     
        		    }); 
          }
          }
    </script> 
     <script src="map.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsys0GZf3YUkzCQt1n-qVwIjzI3ga3e5Y&callback=initMap"
    async defer></script>
    </div>
<table>
	<thead>
		<tr><strong><td></td><td>Incident Date</td><td>Address</td><td>Number Killed</td><td>Number Injured</td></strong>
		</tr>
	</thead>
<c:forEach var="incident" items="${incidents }">
	<tr>
	<td><a href = "/incident/${incident.incidentId}" class="btn btn-secondary">Details</a></td>
	<td>${incident.date}</td>
	<td>${incident.address}</td>
	<td style="text-align:center">${incident.n_killed}</td>
	<td style="text-align:center">${incident.n_injured}</td>	
	</tr>
</c:forEach>

</table>


</body>
</html>
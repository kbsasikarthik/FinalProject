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


<script>
   function initMap() {
	   
	   var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
    	
    	 var locations = new Array(); 
    	 
    	    <c:forEach items="${incidents}" var="location">
    	    //Temp array
    	    var tempArray = new Array();
    	  //lat property 
    	    var latitude= ${location.latitude}; 
    	    //long property 
    	    var longitude= ${location.longitude}; 
    	    //number killed and date
    	    var htmlContent = `
    	    <p>
    	    	Address: ${location.address}
    	    </p>
    	    <p>
    	     	Killed: ${location.n_killed}
    	    </p>
    	    <p>
    	    	Injured: ${location.n_injured}
    	    </p>
    	    <p>
    	    	Date: ${location.date}
    	    </p>
    	    <p>
    	    	<a href=/incident/${location.incidentId}>Details<a/>
    	    </p>
    	    `
    	    //temp array.push
    	    tempArray.push(latitude,longitude,htmlContent);
    	    //Array push
    	    locations.push(tempArray);
    	    </c:forEach> 
    	    
    	    var infowindow =  new google.maps.InfoWindow();
    	    
    	    var marker, count;
    	    
        	  
        	  map = new google.maps.Map(document.getElementById('map'), {
                  center: {lat: locations[0][0], lng: locations[0][1]},
                  zoom: 10
                });
        	  
        	 for (count = 0; count < locations.length; count++) {
        		    marker = new google.maps.Marker({
        		    	animation: google.maps.Animation.DROP,
        		      position: new google.maps.LatLng(locations[count][0], locations[count][1]),
        		      map: map,
        		     /*  icon:image */
        		      
        		    }); 
        		    
        		    google.maps.event.addListener(marker,'click', (function (marker, count) {
        		    	
        		        return function () {
        		        	console.log(marker, count);
        		        	console.log(locations);
        		          infowindow.setContent(locations[count][2]);
        		          infowindow.open(map, marker);
        		        }
        		      })(marker, count));
          }
          }
   
   </script>      
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsys0GZf3YUkzCQt1n-qVwIjzI3ga3e5Y&callback=initMap"
    async defer></script> 
    <div id="map"></div>
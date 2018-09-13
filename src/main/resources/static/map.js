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
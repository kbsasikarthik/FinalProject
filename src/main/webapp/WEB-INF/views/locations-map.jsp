<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
        width: 800px;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      
      .side-by-side
    {
      float:left;
      padding:0px 20px;
    }
</style>
 
<script>
   function initMap() {
	   
	   var image = '/yellow.png';
	   var image1 = '/redpin.png';
	   var image2 = '/orangepin.png';
    	
    	 var locations = new Array(); 
    	 
    	    <c:forEach items="${incidents}" var="location">
    	    //Temp array
    	    var tempArray = new Array();
    	  //lat property 
    	    var latitude= ${location.latitude}; 
    	    //long property 
    	    var longitude= ${location.longitude}; 
    	    //number killed and date
    	    var killed =  ${location.n_killed}
    	    
    	    var injured = ${location.n_injured}
    	    //Additional content in view window 
    	    
    	    var htmlContent = `
    	    <p>
    	    	Address: ${location.address}
    	    </p>
    	    <p>
    	    	Injured: ${location.n_injured}
    	    </p>
    	    <p>
    	    	Killed: ${location.n_killed}
    	    </p>
    	    <p>
    	    	Date: ${location.date}
    	    </p>
    	    <p>
    	    	<a href=/incident/${location.incidentId}>Details<a/>
    	    </p>
    	    `
    	    //temp array.push
    	    tempArray.push(latitude,longitude,htmlContent,killed,injured);
    	    
    	    //Array push
    	    locations.push(tempArray);
    	    </c:forEach> 
    	    
    	    var infowindow =  new google.maps.InfoWindow();
    	    
    	    var marker, count;
    	    
        	  
        	  map = new google.maps.Map(document.getElementById('map'), {
                  center: {lat: locations[0][0], lng: locations[0][1]},
                  zoom: 10,
       
                 
                });
        	  
        	 for (count = 0; count < locations.length; count++) {
        		 
        		 
        		 if(locations[count][3] > 0){
        			 
        			  marker = new google.maps.Marker({
          		    	animation: google.maps.Animation.DROP,
          		      position: new google.maps.LatLng(locations[count][0], locations[count][1]),
          		      map: map,
          		        icon:image1
          		      
          		    });  
        			  
        			  
        		 }else if (locations[count][4] == 0 && locations[count][3] == 0 ){	 
        			 
        			 marker = new google.maps.Marker({
           		    	animation: google.maps.Animation.DROP,
           		      position: new google.maps.LatLng(locations[count][0], locations[count][1]),
           		      map: map,
           		        icon:image
           		      
           		    });  
         			  
        			 
        		 } else {
        			 
        			  marker = new google.maps.Marker({
          		    	animation: google.maps.Animation.DROP,
          		      position: new google.maps.LatLng(locations[count][0], locations[count][1]),
          		      map: map,
          	
          		         icon:image2
          		      
          		      
          		    }); 
          		    
        		 }
        		 
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
    <div style="width: 800px; margin: 0 auto;">
	        <div class="side-by-side" style = "
		margin-left:0px;
		height: 22px;
	    width: 90px;
	    background-color: red"><p 
	    style = "
	    align:left" >killed</p></div>
	   
	    <div class="side-by-side" style = "
	    margin-left: 20px;
		height: 22px;
	    width: 90px;
	    background-color: orange"><p 
	    style = "
	    align:left" >injured</p></div>
	  
	    <div class="side-by-side" style = "
	    margin-left: 20px;
		height: 22px;
	    width: 120px;
	    background-color: yellow"><p 
	    style = "
	    align:left" >not injured</p></div>
    
    </div>
<div align="center" class="w3-container" style="padding-left: 15px;padding-right: 15px;"><br>
    
    <div id="map"></div>
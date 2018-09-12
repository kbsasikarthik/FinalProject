
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
    <div id="map"></div>
    <script>   
    var locationsArray = new Array();
    <c:forEach items="incidents" var="location">
    c = new Object();
  //lat property 
    c.latitude= '${location.latitude}'; 
    //long property 
    c.longitude= '${location.longitude}'; 
    
    locationsArray.push(c);
    </c:forEach> 
    
    </script>
     <script src="map.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsys0GZf3YUkzCQt1n-qVwIjzI3ga3e5Y&callback=initMap"
    async defer></script>
   
  </body>

<%@page import="java.util.Random"%>
<%@page import="java.util.Arrays"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Home page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<%@include file="navbar.jsp"%>
 <style>
    .side-by-side
    {
      float:left;
      padding:0px 20px;
    }
  </style>
</head>
<body>

<<<<<<< Updated upstream:src/main/webapp/WEB-INF/views/index.jsp
<form action="/nameSearch" method="post">
<div class="side-by-side">
<h3>Enter name to Get Started </h3>
=======
<div class="jumbotron">
<center>  <h1 class="display-3">PROJECT A.I.M.</h1>
  <p class="lead">Awareness Into Movement</p>
  <p class="lead">
  </p>
  </center>
  <br>
 <div class="container">
	  	<div class="row">
		    <div class="col-12 col-md-">
		
 <div class="card text-white bg-primary mb-3" style="max-width: 35rem;">
  <div class="card-header">Search By Name</div>
  <div class="card-body">
    <h4 class="card-title">Enter First and Last Name</h4>
    <form action="/nameSearch" method="post" class="form">
>>>>>>> Stashed changes:src/main/webapp/WEB-INF/views/home.jsp
		<div class="form-group row">
			<!--  <label for="firstName" class="col-sm-2 col-form-label">First Name:</label>-->
    		<input class="form-control mr-sm-2" name= "firstName" type="text" placeholder="First Name">
		</div>
		<div class="form-group row">
		
			<!-- <label for="lastName" class="col-sm-2 col-form-label">Last Name:</label>-->
			<input class="form-control mr-sm-2" name= "lastName" type="text" placeholder="Last Name">
		</div>
<<<<<<< Updated upstream:src/main/webapp/WEB-INF/views/index.jsp
		<button>Search</button>
		
</div>
</form>

 <div class="side-by-side">
 <h3>Select a State to Get Started</h3>
=======
		<a class="btn btn-warning btn-lg" href="#" role="button">Search</a>
		 <button action= "submit">Submit</button>
		 </form>
     </div>
      </div>
    </div>
		 </div>	 
		 </div>
		 
		 <div class="card text-white bg-primary mb-3" style="max-width: 35rem;">
  <div class="card-header">Search By Name</div>
  <div class="card-body">
    <h4 class="card-title">Enter First and Last Name</h4>
    
    <h3>Select a State to Get Started</h3>
>>>>>>> Stashed changes:src/main/webapp/WEB-INF/views/home.jsp
	<form method="post" action="/listresults" id="state_form">
		<div class="form-group" >
		  	<label class="sr-only" for="state">State</label>
			<select class="form-control mb-2 mr-sm-2" id="state" name="state" >
			<option value="">State</option>
		  	<c:forEach items="${ states }" var="state">
		  		<option <c:if test="${ state eq param.state }">selected</c:if>>${ state }</option>
		  	</c:forEach>
		  	</select>
		 </div>	
		<div class="form-group" >

		  	<label class="sr-only" for="city">City</label>
			<select class="form-control mb-2 mr-sm-2" id="city" name="city">
			 <option value="">City</option>
		  	<c:forEach items="${ cities }" var="city">
		  		<option <c:if test="${ city eq param.city_or_county }">selected</c:if>>${ city }</option>
		  	</c:forEach>
		  	</select>
		  	<a class="btn btn-warning btn-lg" href="#" role="button">Search</a>
		 <button action = "submit">Submit</button>
<<<<<<< Updated upstream:src/main/webapp/WEB-INF/views/index.jsp
	</form>
</div>

<div class="jumbotron">
  <h4 class="alert-heading"><%=
=======
		 </form>
    
     </div>
      </div>
	
		 
		
	<center>
		<p class="Quotes"><%=
>>>>>>> Stashed changes:src/main/webapp/WEB-INF/views/home.jsp
		Arrays.asList("How many have to die before we will give up these dangerous toys?",
				"Not everybody needs a gun , to get things done.",
				"Know guns, know peace, know safety. No guns, no peace, no safety.",
				"You don’t spread democracy with a barrel of a gun.",
				"An armed man is a citizen. A disarmed man is a subject.")
		.get(new Random().nextInt(5))
<<<<<<< Updated upstream:src/main/webapp/WEB-INF/views/index.jsp
	%></h4>

</div>

=======
	%></p>
	
	</center>
>>>>>>> Stashed changes:src/main/webapp/WEB-INF/views/home.jsp

 <script>

var statesdropdown = document.getElementById("state");
var citiesdropdown = document.getElementById("city");
statesdropdown.addEventListener("change", function(){
	console.log(statesdropdown.value);
	var request = new XMLHttpRequest();
	request.open("GET", "/selectCity?state="+statesdropdown.value);
	request.onload = function(){
		var data = JSON.parse(request.responseText);
		renderHTML(data);
	};
	request.send();
});
function renderHTML(data){
	var htmlString
	for(var i=0; i<data.length; i++){
		
		var newelement = document.createElement("option");
		newelement.innerHTML = '<option>'+data[i]+'</option>';
	
		citiesdropdown.appendChild(newelement);
	}
}
citiesdropdown.addEventListener("change", function(){
	console.log(statesdropdown.value);
	console.log(citiesdropdown.value);
	var request = new XMLHttpRequest();
	request.open("GET","/listresults?state="+statesdropdown.value+"&city="+citiesdropdown.value);
	request.send(citiesdropdown.value);
	
});
	


</script>
</body>
</html>
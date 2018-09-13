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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/journal/bootstrap.min.css" />
<link rel="stylesheet" href="/style.css" />

</head>
<body>
<h1>Welcome to the Gun Violence Awareness Project</h1>
<br>
<h2>Search for Gun Violence by Location</h2>


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
 <h3>Select a State to Get Started</h3>
	<form method="post" action="/listresults" id="state_form">
		<div class="form-group" >
		  	<label class="sr-only" for="state">State</label>
			<select class="form-control mb-2 mr-sm-2" id="state" name="state" >
			 <!--  onchange="document.getElementByID('state_form').submit()">-->
			<option value="">State</option>
		  	<c:forEach items="${ states }" var="state">
		  		<option <c:if test="${ state eq param.state }">selected</c:if>>${ state }</option>
		  	</c:forEach>
		  	</select>
		 </div>	

		  	<label class="sr-only" for="city">City</label>
			<select class="form-control mb-2 mr-sm-2" id="city" name="city">
			 <option value="">City</option>
		  	<c:forEach items="${ cities }" var="city">
		  		<option <c:if test="${ city eq param.city_or_county }">selected</c:if>>${ city }</option>
		  	</c:forEach>
		  	</select>
		 </div>
		 <button action = "submit">Submit</button>
	</form>
	


	
		<p class="Quotes"><%=
		Arrays.asList("How many have to die before we will give up these dangerous toys?",
				"Not everybody needs a gun , to get things done.",
				"Know guns, know peace, know safety. No guns, no peace, no safety.",
				"You don’t spread democracy with a barrel of a gun.",
				"An armed man is a citizen. A disarmed man is a subject.")
		.get(new Random().nextInt(5))
	%></p>

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
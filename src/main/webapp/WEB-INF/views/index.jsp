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
<h1 align="center">Welcome to Team A.I.M !</h1>
<h2 align="center">(<u>A</u>wareness <u>I</u>n <u>M</u>ovement!)</h2>
<br>
<h2></h2>

<form action="/nameSearch" method="post" onsubmit="return validate();">
<div class="side-by-side">
<h3>Enter name to Get Started </h3>
		<div class="form-group row">
			<!--  <label for="firstName" class="col-sm-2 col-form-label">First Name:</label>-->
    		<input class="form-control mr-sm-2" name= "firstName" id= "firstName" type="text" placeholder="First Name" pattern="[a-zA-Z]*" title="Please enter only alphabets!">
		</div>
		<div class="form-group row">
		
			<!-- <label for="lastName" class="col-sm-2 col-form-label">Last Name:</label>-->
			<input class="form-control mr-sm-2" name= "lastName" id= "lastName" type="text" placeholder="Last Name" pattern="[a-zA-Z]*" title="Please enter only alphabets!">
		</div>
		<button>Search</button>
</div>
</form>

 <div class="side-by-side">
 <h3>Select a State to Get Started</h3>
	<form method="post" action="/stateandcity" id="state_form" method=POST>
		<div class="form-group" >
		  	<label class="sr-only" for="state">State</label>
			<select class="form-control mb-2 mr-sm-2" id="state" name="state" required>
			<option value="">State</option>
		  	<c:forEach items="${ states }" var="state">
		  		<option <c:if test="${ state eq param.state }">selected</c:if>>${ state }</option>
		  	</c:forEach>
		  	</select>
		 </div>	
		<div class="form-group" >

		  	<label class="sr-only" for="city">City</label>
			<select class="form-control mb-2 mr-sm-2" id="city" name="city" required>
			 <option value="">City</option>
		  	<c:forEach items="${ cities }" var="city">
		  		<option <c:if test="${ city eq param.city_or_county }">selected</c:if>>${ city }</option>
		  	</c:forEach>
		  	</select>
		 </div>
		 <button action = "submit">Submit</button>
	</form>
</div>

<div class="jumbotron">
  <h4 class="alert-heading"><%=
		Arrays.asList("How many have to die before we will give up these dangerous toys?",
				"Not everybody needs a gun , to get things done.",
				"Know guns, know peace, know safety. No guns, no peace, no safety.",
				"You don’t spread democracy with a barrel of a gun.",
				"An armed man is a citizen. A disarmed man is a subject.")
		.get(new Random().nextInt(5))
	%></h4>

</div>


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

function validate()
{
    var a = document.getElementById("firstName");
    var b = document.getElementById("lastName");
    if(a.value.length<=0 && b.value.length<=0)
       {
    	alert("Both first and last name cannot be empty!");
    	return false;
       }
    else
    	return true;
};
	
</script>
</body>
</html>
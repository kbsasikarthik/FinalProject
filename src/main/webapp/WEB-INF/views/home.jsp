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
<<<<<<< HEAD
	<p class="Quotes"><%=
		Arrays.asList("How many have to die before we will give up these dangerous toys?",
				"Not everybody needs a gun , to get things done.",
				"Know guns, know peace, know safety. No guns, no peace, no safety.",
				"You don’t spread democracy with a barrel of a gun.",
				"An armed man is a citizen. A disarmed man is a subject.")
		.get(new Random().nextInt(5))
	%></p>
	<form method="post" action="/repbyzip">
		<div class="form-group">
			<label for="num1">Zipcode: </label>
	    	<input class="form-control" id="zipcode"  name="zipcode" type="number" required >
		</div>
		<div class="form-group">
		  	<label class="sr-only" for="state">State</label>
			<select class="form-control mb-2 mr-sm-2" id="state" name="state">
			<option value="">State</option>
		  	<c:forEach items="${ states }" var="state">
		  		<option <c:if test="${ state eq param.state }">selected</c:if>>${ state }</option>
		  	</c:forEach>
		  	</select>
		 </div>
		<button action = "submit">Submit</button>
=======
<h1>Welcome to the Gun Violence Awareness Project</h1>
<br>
<h2>Search for Gun Violence by Address</h2>
<br>
	<form method="post" action="/MapResults">
	<div class="form-group row">
			<label for="streetNum" class="col-sm-2 col-form-label">Street Number:</label>
    		<div class="col-sm-10">
			<input class="form-control" name="streetNum" required minlength="1" maxlength="10"/>
			</div>
		</div>
		<div class="form-group row">
			<label for="streetName" class="col-sm-2 col-form-label" placeholder="(optional)">Street Name:</label>
			<div class="col-sm-10">
			<input class="form-control" name="streetName"/>
			</div>
		</div>
		<div class="form-group row">
			<label for="city" class="col-sm-2 col-form-label" >City:</label>
			<div class="col-sm-10">
			<input class="form-control" name="city"/>
			</div>
		</div>
		<div class="form-group row">
			<label for="state" class="col-sm-2 col-form-label" >State:</label>
			<div class="col-sm-10">
			<input class="form-control" name="state"/>
			</div>
		</div>
		<div class="form-group row">
			<label for="zip" class="col-sm-2 col-form-label" placeholder="(optional)">Zip Code:</label>
			<div class="col-sm-10">
			<input class="form-control" name="zip"/>
			</div>
		</div>
		<button type="submit">SEARCH</button>
>>>>>>> 21a0775518e2b099935a2f95a022b8684b8e29c0
	</form>
</body>
</html>
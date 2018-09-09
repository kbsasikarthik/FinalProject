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
	</form>

</body>
</html>
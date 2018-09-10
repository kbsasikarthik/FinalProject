<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

</head>
<body>
<h2>Results for City and State Search</h2>
<h3>Filter by Name</h3>
<br>
<form action="/nameSearch" method="post" class="form">
		<div class="form-group row">
			<label for="firstName" class="col-sm-2 col-form-label">First Name:</label>
    		<div class="col-sm-10">
			<input class="form-control" name="firstName" required minlength="2" maxlength="10"/>
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
<input type="text" name="daterange" value="01/01/2013 - 03/31/2018" />
<script type="text/javascript">
$(function() {
    $('input[name="daterange"]').daterangepicker();
});
</script>
<br>
<table>
<thead>
<tr>
<strong><td></td><td>Incident Date</td><td>Address</td><td>Number Killed</td><td>Number Injured</td>
</strong>
</tr>
</thead>

<c:forEach var="incident" items="${incidents }">
	<tr>
	<td><a href = "/incident/{incident.incidentId}" class="btn btn-secondary">Details</td>
	<td>${incident.date}</td>
	<td>${incident.address}</td>
	<td style="text-align:center">${incident.n_killed}</td>
	<td style="text-align:center">${incident.n_injured}</td>	
	</tr>
</c:forEach>

</table>


</body>
</html>
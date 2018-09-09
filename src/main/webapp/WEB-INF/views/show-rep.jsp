<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Representatives</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/journal/bootstrap.min.css" />
<link rel="stylesheet" href="/style.css" />

</head>
<body>

<h1>Here is your representative for zipcode ${ zipcode }</h1>

<table>
<thead>
<tr>
<strong><td>Incident Date</td><td>Location</td><td>Losses</td><td>Source</td>
</strong>
</tr>
</thead>
<c:forEach var="inc" items="${ incidents}">
	<tr>
	<td>${inc.date}</td>
	<td >${inc.address}</td>
	<td>${inc.n_killed}</td>
	<td>${inc.source_url }</td>
	
	</tr>
</c:forEach>

</table>
<table>
<thead>
<tr>
<strong><td>Name</td><td>Party</td><td>State</td>
</strong>
</tr>
</thead>

<c:forEach var="rep" items="${ represult}">
	<tr>
	<td><a href="/details/${rep.name }">${rep.name}</a></td>
	<td >${rep.party}</td>
	<td>${rep.state}</td>
	
	</tr>
</c:forEach>

</table>
</body>
</html>
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

<h1></h1>

<table>
<thead>
<tr>
<strong><td>Name</td><td>District</td><td>State</td><td>Party</td>
</strong>
</tr>
</thead>
<c:forEach var="rep" items="${ reps}">
	<tr>
	<td>${rep.full_name}</td>
	<td >${rep.district}</td>
	<td>${rep.state}</td>
	<td>${rep.party }</td>
	<td>${rep.chamber}</td>
	<td >${rep.email}</td>
	<td><img src=url("${rep.photo_url}")/></td>
	<td>${rep.url }</td>
	</tr>
</c:forEach>

</table>

</body>
</html>
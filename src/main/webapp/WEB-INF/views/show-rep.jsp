<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Representatives</title>
<!--  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/journal/bootstrap.min.css" />
<link rel="stylesheet" href="/style.css" />-->

</head>
<body>

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
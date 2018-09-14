<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<%@include file="navbar.jsp"%>
</head>
<body>
<div align="center" class="w3-container" >
<br>
<h1>Found ${number} matching results for Name: ${name }</h1>
<table>
<thead>
<tr>
<strong><td>Name</td><td>Incident Date</td><td>Address</td><td>Number Killed</td><td>Number Injured</td>
</strong>
</tr>
</thead>
<br>
 <%@include file="locations-map-byname.jsp"%>
<br>
<br>

<c:forEach var="incident" items="${matchingNames }">
	<tr>
	<td><c:forEach var="name" items="${incident.names }">
	<a href=/incident/${incident.incidentId}>${name }<a/>
	</c:forEach></td>
	<td>${incident.date}</td>
	<td>${incident.address}</td>
	<td style="text-align:center">${incident.n_killed}</td>
	<td style="text-align:center">${incident.n_injured}</td>	
	</tr>
</c:forEach>

</table>

</div>
<a href="/" class ="btn btn-secondary">Back</a>
</body>
</html>
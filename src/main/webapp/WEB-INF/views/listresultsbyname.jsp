<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Found ${number} matching results for Name: ${name }</h1>
<table>
<thead>
<tr>
<strong><td>Name</td><td>Incident Date</td><td>Address</td><td>Number Killed</td><td>Number Injured</td>
</strong>
</tr>
</thead>

<c:forEach var="incident" items="${matchingNames }">
	<tr>
	<td>${incident.participant_name}</td>
	<td>${incident.date}</td>
	<td>${incident.address}</td>
	<td style="text-align:center">${incident.n_killed}</td>
	<td style="text-align:center">${incident.n_injured}</td>	
	</tr>
</c:forEach>

</table>
</body>
</html>
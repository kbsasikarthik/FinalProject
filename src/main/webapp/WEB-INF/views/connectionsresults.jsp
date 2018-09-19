<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Connection Results</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<%@include file="navbar.jsp"%>

</head>
<body><div class="container">
<h2>Results For Your Search by Connection</h2>
<table class="table table-hover">
  <thead>
	<tr style="font-size:150%;">
      <th scope="col">Name</th>
      <th scope="col">Facebook</th>
      <th scope="col">Twitter</th>
      <th scope="col">Connection</th>
      <th scope="col">Victim</th>
    </tr>
  </thead>
  <tbody> 
	<c:forEach var="connection" items="${connections}">
    	<tr class="table-warning">
    	<td scope="row" title="Click for details"><a href = "/incident/${connection.incidentID}">${connection.participant}</a></td>
    	<td scope="row" style="text-align:center">${connection.facebook}</td>
    	<td scope="row" style="text-align:center">${connection.twitter}</td>
    	<td scope="row" style="text-align:center">${connection.connectionType}</td>
    	<td scope="row" style="text-align:center">${connection.name}</td>      
    	</tr>
	</c:forEach>
</table>
<button class="btn btn-secondary btn-sm" onclick="window.location.href='/connectionsearch'">BACK</button>
</div>
</body>
</html>
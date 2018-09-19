<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>View Connections</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<%@include file="navbar.jsp"%>
<title>Connect to A Participant</title>
</head>
<body><div class="w3-container">
<h2>Add Your Connection To: ${person}</h2>
<p>Existing connections, if any</p>
 <table>
<th><td><b><u>Name</u></b></td><td><b><u>Relationship</u></b></td><td><b><u>Facebook</u></b></td><td><b><u>Twitter</u></b></td></th>
	<c:forEach var="connection" items="${ connections }">
		 <tr>
		 	<td></td>
		    <td>${connection.participant}</td>
			<td>${connection.connectionType}</td>
			<td>${connection.facebook}</td>
			<td>${connection.twitter}</td>
		 </tr>  
	 </c:forEach>
</table>
<br> 
<h3>Add Your Own Connection</h3>	
	 <form action="/addConnection/create/${person}/${id}" method="post" class="form">
		<div class="form-group row">
			<label for="name" class="col-sm-2 col-form-label">Your Name:</label>
    		<div class="col-sm-5">
			<input class="form-control" name="name" required minlength="2" maxlength="30"/>
			</div>
		</div>
		<div class="form-group row">
			<label for="relationship" class="col-sm-2 col-form-label">Relationship:</label>
			<div class="col-sm-5">
			    <select name="connectionType" class="custom-select" id="inputGroupSelect">
			         <option selected>How are you connected to this victim? </option>
			         <option value="familyMember">Family Member</option>
			         <option value="friend">Friend</option>
			         <option value="coWorker">Co-Worker</option>
			         <option value="schoolMate">School Mate</option>
			         <option value="acquaintance">Acquaintance</option>
			         <option value="neighbor">Neighbor</option>
			         <option value="other">Other</option>
			    </select>
			</div>    
		</div>
		<div class="form-group row">
			<label for="facebook" class="col-sm-2 col-form-label">Facebook Account:</label>
				<div class="col-sm-5">
				<input class="form-control" name="facebook" placeholder="https://www.facebook.com/yourusername"/>
				</div>
		</div>
		<div class="form-group row">
			<label for="twitter" class="col-sm-2 col-form-label">Twitter Account:</label>
				<div class="col-sm-5">
				<input class="form-control" name="twitter" placeholder="@username"/>
				</div>
		</div>
		<button  class="btn btn-secondary btn-sm" >Submit</button>
  </form>
</div>
</body>
</html>
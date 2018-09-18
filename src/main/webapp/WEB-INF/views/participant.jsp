<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Connect to A Participant</title>
</head>
<body>
<h1>Add Your Connection</h1>
 <h3>${person} check</h3> 
<p>Existing connections, if any</p>
<table>
<th><td>Name</td><td>Relationship</td><td>Facebook</td><td>Twitter</td><th>
	<c:forEach var="connection" items="${ connections }">
		 <tr>
		    <td>${connection.name}</td>
			<td>${connection.connectionType}</td>
			<td>${connection.facebook}</td>
			<td>${connection.twitter}</td>
		 </tr>  
	 </c:forEach>
	 </table>
<p>Add Your Own Connection</p>
	
	 <form action="/addConnection/${participant}/${incidentID}" method="post" class="form">
		<div class="form-group row">
			<label for="name" class="col-sm-2 col-form-label">Your Name:</label>
    		<div class="col-sm-10">
			<input class="form-control" name="name" required minlength="2" maxlength="30"/>
			</div>
		</div>
		<div class="form-group row">
			<label for="relationship" class="col-sm-2 col-form-label">Relationship:</label>
			<div class="col-sm-10">
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
				<div class="col-sm-10">
				<input class="form-control" name="facebook" placeholder="https://www.facebook.com/yourusername"/>
				</div>
		</div>
		<div class="form-group row">
			<label for="twitter" class="col-sm-2 col-form-label">Twitter Account:</label>
				<div class="col-sm-10">
				<input class="form-control" name="twitter" placeholder="@username"/>
				</div>
		</div>
		<button class="btn btn-secondary btn-sm>Submit</button>
  </form>
  </div> 
</body>
</html>
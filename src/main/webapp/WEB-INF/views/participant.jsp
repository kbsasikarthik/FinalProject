<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>Participant</h3>

<c: forEach var="participant" items="${ participant }">

 <tr>
    <td>${participant.firstName}</td>
	<td>${participant.lastName}</td>
	<td>${participant.age}</td>
	<td>${participant.status}</td>
	
 </tr>  
 
 </c:>
	
<div class="input-group">
    <select name="connectionType" class="custom-select" id="inputGroupSelect">
         <option selected>How are you connected to this victim? </option>
         <option value="familyMember">Family Member</option>
         <option value="friend">Friend</option>
         <option value="coWorker">Co-Worker</option>
         <option value="schoolMate">School Mate</option>
         <option value="acquaintance">Acquaintance</option>
         <option value="other">Other</option>
    </select>
    
</div>    

  
<div class="input-group-append">
  
  
  
 <form action="/nameSearch" method="post" class="form">
		<div class="form-group row">
			<label for="firstName" class="col-sm-2 col-form-label">Your Name:</label>
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
  </form>
  
  </div>
 

</body>
</html>
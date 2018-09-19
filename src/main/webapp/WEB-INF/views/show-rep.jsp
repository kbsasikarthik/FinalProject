<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Representatives</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />

</head>
<body>

<h1></h1>


<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col" width=25px>Name</th>
      <th scope="col" width=12px>Chamber</th>
      <th scope="col" width=12px>Party</th>
      <th scope="col" width=20px>Email Address</th>
      <th scope="col" width=6px>Email/</th>
      <th scope="col" width=6px>Gmail/</th>
      <th scope="col" width=6px>Yahoo</th>
    </tr>
  </thead>
  	<tbody>
		<c:forEach var="rep" items="${reps}">
			<tr>
				<td>${rep.full_name}</td>
				<td>${rep.chamber}</td>
				<td>${rep.party }</td>
				<td>${rep.email}</td>
				<td colspan=3>
					<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
						<a class="a2a_button_email"></a>
						<a class="a2a_button_google_gmail"></a>
						<a class="a2a_button_yahoo_mail"></a>
					
					<script>
						var a2a_config = a2a_config || {};
						a2a_config.templates = a2a_config.templates || {};
						a2a_config.templates.email = {
						    to:"${rep.email}",
							subject: "I was impacted by gun violence on ${incident.date} in your district",
						    body: "Dear ${rep.full_name}, I knew someone who was involved in an incident in your district. I urge you to stand up to the gun lobby and take action to reduce the impact of gun violence in our lives. "
						};
					</script>
					
					<script async src="https://static.addtoany.com/menu/page.js"></script>	
				</div>
				</td>	
			</tr>
		</c:forEach>
	</tbody>
</table>

</body>

</html>
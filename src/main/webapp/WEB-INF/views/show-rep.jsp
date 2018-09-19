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
<style>
td {
    white-space: nowrap;
}
</style>
</head>

<body>

<div class="container">
<table class="table table-hover">
  <thead>
	<tr style="font-size:100%;">
      <th colspan=4>Name</th>
      <th scope="col">Chamber</th>
      <th scope="col">Party</th>
      <th scope="col">Email Address</th>
      <th scope="col">Email</th>
      <th scope="col">Gmail</th>
      <th scope="col">Yahoo</th>
    </tr>
  </thead>
  <tbody>
		<c:forEach var="rep" items="${reps}">
			<tr>
				<td colspan=4>${rep.full_name}</td>
				<td scope="row">${rep.chamber}</td>
				<td scope="row">${rep.party }</td>
				<td scope="row">${rep.email}</td>
				<td colspan=3>
					<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
						<a class="a2a_button_email"></a>
						<a style="margin-left: 100px;" class="a2a_button_google_gmail"></a>
						<a style="margin-left: 100px;" class="a2a_button_yahoo_mail"></a>
					
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
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>

</html>
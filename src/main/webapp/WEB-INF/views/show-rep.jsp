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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/journal/bootstrap.min.css" />
<link rel="stylesheet" href="/style.css" />

</head>
<body>

<h1></h1>

<table>
	<thead>
		<tr><strong><td>Name</td><td>Chamber</td><td>Party</td><td>Email</td></strong>
		</tr>
	</thead>
<c:forEach var="rep" items="${reps}">
	<tr>
		<td>${rep.full_name}</td>
		<td >${rep.chamber}</td>
		<td>${rep.party }</td>
		<td >${rep.email}</td>
	</tr><br>
	<tr><div class="a2a_kit a2a_kit_size_32 a2a_default_style">
			<a>Click to Open Email Client and Contact Rep</a>
			<a class="a2a_button_email"></a>
			<a class="a2a_button_google_gmail"></a>
			<a class="a2a_button_yahoo_mail"></a>
	</div></tr>
		<script>
			var a2a_config = a2a_config || {};
			a2a_config.templates = a2a_config.templates || {};
			
			a2a_config.templates.email = {
				subject: "I was impacted by gun violence on ${incident.date}",
			    body: "PASTE EMAIL: ${rep.email} Dear Representative, I knew someone who was involved in an incident (tell your story)"
			};
		</script>
	<script async src="https://static.addtoany.com/menu/page.js"></script>
</c:forEach>

</table>

</body>
</html>
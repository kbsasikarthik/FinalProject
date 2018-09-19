<%@page import="java.util.Random"%>
<%@page import="java.util.Arrays"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Incident Details</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<meta property="og:title" content="Take A.I.M. at Gun Violence">
<meta property="og:image" content="http://media.graytvinc.com/images/810*455/Gun+violence+awareness2.jpg">
<meta property="og:description" content="Summary of a gun violence incident.">
<meta property="og:url" content="http://localhost:8080/incident.jsp">
<%@include file="navbar.jsp"%>
</head>
<style>
.container {
    float: left;
    padding: 30px;
}
</style>
<body>
<h1 align="center"><u>Incident Details</u></h1>
<div class="container">
	<div class="row">
		<div class="col-6 col-md-4">
				<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
					<a class="a2a_button_twitter"></a>
					<p>Share</p>
					<script>
						var a2a_config = a2a_config || {};
						a2a_config.templates = a2a_config.templates || {};
						a2a_config.templates.twitter = {
					    text: "I was impacted by gun violence on ${incident.date}. Learn more www.projectaim.org #endgunviolence #gunviolence",
					    related: "I've been impacted by gun violence. "
						};
					</script>
					<script async src="https://static.addtoany.com/menu/page.js"></script>
				</div>
				<table>
					<tr><td><u>Date</u> </td><td>: ${incident.date}</td></tr>
					<tr><td><u>Number Killed</u> </td><td>: ${incident.n_killed}</td></tr>
					<tr><td><u>Number injured</u> </td><td>: ${incident.n_injured}</td></tr>
					<c:forEach var="chr" items="${incident.chars}">
					<tr><td><u>Type of Incident</u> </td><td>: ${chr}</td></tr>
					</c:forEach>
				</table>
				<u>Names of persons involved:</u>
				<ol>
					<c:forEach var="name" items="${incident.names}" >
						<p>${name}&emsp;<a href="/addConnection/${name}/${incident.incidentId}" method="post" class="btn btn-secondary btn-sm"  id="name">Add Connection</a></p>
					</c:forEach>
				</ol>
				<u>More details:</u>
				<ol>
					<c:forEach var="detail" items="${details}"> 
						<p>${detail }</p>
					</c:forEach>
				</ol>
				</div><br>
		
				<div class="col-6 col-md-4">
					<u>Data source:</u><br>
					<a target="_blank" href="${incident.source_url}"><img id="p2i_demo" src="http://api.page2images.com/directlink?p2i_url=${incident.source_url}&p2i_device=6&p2i_screen=1024x768&p2i_size=400x400&p2i_imageformat=jpg&p2i_key=4dfa1ec826f4f930" /></a>
					<script src="http://www.page2images.com/js/p2i.js"></script><script type="text/javascript" >
						var p2i=new page2images();
						p2i.thumbnail('p2i_demo');
					</script>
				</div>
				<div class="col-6 col-md-4">
					<u>Location Map:</u>
	    			<iframe width="300" height="300" frameborder="0" style="border:0"
			 			src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDsys0GZf3YUkzCQt1n-qVwIjzI3ga3e5Y
			 		  	&q=${incident.latitude}+${incident.longitude}">
					</iframe>
		   	 	</div>	
	</div>	
	<br><p align="left"><b style="font-size:150%;">&emsp;Representative Information</b></p>
	     <%@include file="show-rep.jsp"%>

       	
</body>
</html>
<%@page import="java.util.Random"%>
<%@page import="java.util.Arrays"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<meta property="og:title" content="Take A.I.M. at Gun Violence">
<meta property="og:image" content="http://media.graytvinc.com/images/810*455/Gun+violence+awareness2.jpg">
<meta property="og:description" content="Summary of a gun violence incident.">
<meta property="og:url" content="http://localhost:8080/incident.jsp">
<%@include file="navbar.jsp"%>
</head>
<body>
<div>
	<div class="container">
	  	<div class="row">
		    <div class="col-12 col-md-8">
			    <div>
					<h1>Incident Details</h1>
					<table>
						<thead>
							<strong><tr>
							<td>Date: ${incident.date} </td>
							<td>Number Killed: ${incident.n_killed} </td>
							<td>Number injured: ${incident.n_injured}</td>
							</tr></strong>
						</thead>
					</table>
				</div>
				<p>${incident.incident_characteristics}</p>
				<p>${incident.sources}</p>
				<p>${incident.source_url}</p>
				<c:forEach var="name" items="${incident.names}">
				<p>${name }<a href="/participant/${name }" class="btn btn-secondary">Add Connection</a></p>
				</c:forEach>
				<c:forEach var="detail" items="${details}"> 
				<p>${detail }</p>
				</c:forEach>
			</div><br>
			<p>Share your connection to this incident via Social Media</p>
			<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
				<a class="a2a_button_facebook"></a>
				<a class="a2a_button_twitter"></a>
			</div>
			<script>
				var a2a_config = a2a_config || {};
				a2a_config.templates = a2a_config.templates || {};
				
				a2a_config.templates.facebook = {
				    app_id: "1173731342792067",
				    redirect_uri: "http://localhost:8080"
				};
				
				a2a_config.templates.twitter = {
				    text: "I was impacted by gun violence on ${incident.date}.",
				    related: "I've been impacted by gun violence. Learn more Project A.I.M"
				};
			</script>
			<script async src="https://static.addtoany.com/menu/page.js"></script>
			
		<div id="shareBtn" class="btn btn-success clearfix">Share</div>
			<script>
				document.getElementById('shareBtn').onclick = function() {
				  FB.ui({
				    method: 'share',
				    display: 'popup',
				    href: 'https://developers.facebook.com/docs/',
				  }, function(response){});
				}
			</script>		
	</div>
	</div>	
		    <div class="col">
		    	<iframe width="300" height="300" frameborder="0" style="border:0"
			 	src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDsys0GZf3YUkzCQt1n-qVwIjzI3ga3e5Y
			   	&q=${incident.latitude}+${incident.longitude}">
				</iframe>
		    </div>
	</div>
  
  	<div class="row">
  		<div class="col-6">Rep Data<div class="row">
      		<div class="col-8 col-sm-6">
       			<%@include file="show-rep.jsp"%>
      		</div>
      	</div>
	</div>
	</div>
</body>
</html>
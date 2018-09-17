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
<style>
    .side-by-side
    {
      float:left;
      padding:0px 20px;
    }
  </style>
<body>
<div>
	<div class="container">
	  	<div class="row">
		    <div class="col-12 col-md-8">
			    <div>
					<h1>Incident Details</h1>
					<div class="a2a_kit a2a_kit_size_32 a2a_default_style">
						<a class="a2a_button_facebook"></a>
						<a class="a2a_button_twitter"></a>
						<p>Share</p>
					</div>
				<table>
					<tr><td>Date: </td><td>${incident.date}</td></tr>
					<tr><td>Number Killed: </td><td>${incident.n_killed}</td></tr>
					<tr><td>Number injured: </td><td>${incident.n_injured}</td></tr>
					<c:forEach var="chr" items="${incident.chars}">
					<tr><td>Type of Incident: </td><td>${chr}</td></tr>
					</c:forEach>
				</div>
				</table>
				<u>Data source:</u>
				<ol>
				<p><a target="_blank" href="${incident.source_url}">${incident.source_url}</a></p>
				</ol>
				<u>Names of persons involved:</u>
				<ol>
				<c:forEach var="name" items="${incident.names}">
				<p><a href="/addConnection/{participant}/{incidentID}" class="btn btn-secondary btn-sm" action="/showConnection/${name }/${incidentID}" id="incidentID">Add Connection</a>&nbsp${name }</p>
				</c:forEach>
				</ol>
				<u>More details:</u>
				<ol>
				<c:forEach var="detail" items="${details}"> 
				<p>${detail }</p>
				</c:forEach>
				</ol>
			</div><br>
			
	</div>	
	<div class="side-by-side">
		    <div align="right"  class="col">
		    	<iframe width="300" height="300" frameborder="0" style="border:0"
			 	src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDsys0GZf3YUkzCQt1n-qVwIjzI3ga3e5Y
			   	&q=${incident.latitude}+${incident.longitude}">
				</iframe>
		    </div>
	</div>
	</div>
 <div class="side-by-side"> 
  	<div class="row">
  		<div class="col-6">Representative information<div class="row">
      		<div class="col-8 col-sm-6">
       			<%@include file="show-rep.jsp"%>
      		</div>
      	</div>
	</div>
	</div>
</div>
<script>
				var a2a_config = a2a_config || {};
				a2a_config.templates = a2a_config.templates || {};
				
				a2a_config.templates.facebook = {
				    app_id: "1173731342792067",
				    redirect_uri: "http:www.projectaim.org"
				};
				
				a2a_config.templates.twitter = {
				    text: "I was impacted by gun violence on ${incident.date}. Learn more www.projectaim.org #endgunviolence #gunviolence",
				    related: "I've been impacted by gun violence. "
				};
			</script>
			<script async src="https://static.addtoany.com/menu/page.js"></script>
</body>
</html>
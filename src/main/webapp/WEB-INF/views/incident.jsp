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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/journal/bootstrap.min.css" />
<link rel="stylesheet" href="/style.css" />

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
<tr>
<th>Date: ${incident.date} </th>
<th>Number Killed: ${incident.n_killed} </th>
<th>Number injured: ${incident.n_injured}</th>
</tr>
</thead>
</table>
</div>
<p>${incident.notes}</p>
<p>${incident.sources}</p>
<p>${incident.source_url}</p>
<c:forEach var="name" items="${incident.names}">
<p>${name }<a href="/participant/${name }" class="btn btn-secondary">Add Connection</a></p>
</c:forEach>
<c:forEach var="detail" items="${details}"> 
<p>${detail }</p>
</c:forEach>
 
<a href="/repbyzip/${incident.latitude}/${incident.longitude}">Representatives</a>
    </div>
    <div class="col"><img src="https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg" alt="" height="200" width="200">
    </div>
  </div>
  
  <div class="row">
  <div class="col-6"><img src="http://www.dwreview.com/Data_mining/Images/Data_Mine_Table.GIF" alt="" height="300" width="400"> </div>
  <div class="col-6">Rep Data<div class="row">
      <div class="col-8 col-sm-6">
       <img src="https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg" alt="" height="200" width="200">
      </div>
      <div class="col-4 col-sm-6">
        <img src="https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg" alt="" height="200" width="200">
      </div></div>
</div>
</body>
</html>
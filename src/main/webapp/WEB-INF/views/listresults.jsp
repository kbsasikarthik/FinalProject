<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Search Results by Name</title>
<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" /> -->
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<script type="text/javascript" src="path_to/jquery.js"></script>
<script type="text/javascript" src="path_to/jquery.simplePagination.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<!-- <link rel="stylesheet" href="/style.css" /> -->
<%@include file="navbar.jsp"%>
</head>

<body>
<div class="container" align="center">
    <h2>Search results for ${city} in ${state}</h2>
    <div align="center" class="w3-container" style="padding-left: 15px;padding-right: 15px;"><br>
        <%@include file="locations-map.jsp"%>
    </div>
    <h4>Filter by Date Range<small>(Database starts Jan. 1, 2013)</small></h4>
<p></p>
<form action="/dateSearch/${state }/${city}" method=POST>
    <table>
        <thead><tr><td>FROM DATE</td><td>TO DATE</td></tr></thead>
        <tr><td><input type="date" name="fromDate" min="2013-01-01" max="2018-03-31"  value="${fromDate}"/></td>
        <td><input type="date" name="toDate" min="2013-01-01" max="2018-03-31" value="${toDate}" /></td>
        <td><input type="submit" value="Search"></tr>
    </table>
</form>

<div align="center" class="w3-container" style="padding-left: 15px;padding-right: 15px;"><br>

<table class="table table-hover">
 <thead>
    <tr style="font-size:150%;">
     <th scope="col">Incident Date</th>
     <th scope="col">Address</th>
     <th scope="col">Number Killed</th>
     <th scope="col">Number Injured</th>
   </tr>
 </thead>
 <tbody>
    <c:forEach var="incident" items="${incidents }">
       <tr class="table-warning">
       <td scope="row" title="Click to see more details"><a href = "/incident/${incident.incidentId}">${incident.date}</a></td>
       <td scope="row">${incident.address}</td>
       <td scope="row" style="text-align:center">${incident.n_killed}</td>
       <td scope="row" style="text-align:center">${incident.n_injured}</td>
       </tr>
    </c:forEach>
</table>
</div>
<h3>${pageNo }</h3>
<div name="page">
 <ul class="pagination">
 <c:if test="${lastPageNo gt 0}">
  <c:if test="${pageNo ne 0}">
    <li class="page-item">
    <a class="page-link" href="${url}1">First Page</a>
   </li>
   <li class="page-item">
     <a class="page-link" href="${url}${pageNo - 1}">&laquo;</a>
   </li> </c:if>
   <li class="page-item active">
     <a class="page-link"  href="${url}${pageNo + 0}">${pageNo + 0}</a>
   </li>
   <c:if test="${pageNo + 1 le lastPageNo}">
   <li class="page-item">
     <a class="page-link" href="${url}${pageNo + 1}">${pageNo + 1}</a>
   </li> </c:if>
    <c:if test="${pageNo + 2 le lastPageNo}">
   <li class="page-item">
     <a class="page-link" href="${url}${pageNo + 2}">${pageNo + 2}</a>
   </li></c:if>
   <c:if test="${pageNo + 3 le lastPageNo}">
   <li class="page-item">
     <a class="page-link" href="${url}${pageNo + 3}">${pageNo + 3}</a>
   </li> </c:if>
   <c:if test="${pageNo + 4 le lastPageNo}">
   <li class="page-item">
     <a class="page-link" href="${url}${pageNo+ 4}">${pageNo + 4}</a>
   </li> </c:if>
   <li class="page-item">
     <a class="page-link" href="${url}${lastPageNo}">Last Page</a>
   </li>

    </c:if>
 </ul>
</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Home page</title>
<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" /> -->
 <!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<!-- <link rel="stylesheet" href="/style.css" /> -->
<%@include file="navbar.jsp"%>
</head>

<body>

<div align="center"  >
	<br>
	<h2>Search results for ${city} in ${state}</h2><br><br>    
</div>
<div align="center" class="w3-container" style="padding-left: 15px;padding-right: 15px;"><br>
	<%@include file="locations-map.jsp"%>
</div>
	<h4>Filter by Date Range<small>(Database starts Jan. 1, 2013)</small></h4>
<p></p>
<form action="/dateSearch/${state }/${city}" method=POST>
	<table>
		<thead><strong><tr><td>FROM DATE</td><td>TO DATE</td></tr></strong></thead>
		<tr><td><input type="date" name="fromDate" min="2013-01-01" max="2018-03-31" value="2013-01-01"/></td>
		<td><input type="date" name="toDate" min="2013-01-01" max="2018-03-31" value="2018-03-31" /></td>
		<td><input type="submit" value="Search"></tr>
	</table>
</form>
<!--  
<div id="pagination">

    <c:url value="/stateandcity/listresults" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/stateandcity/listresults" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/stateandcity/listresults" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>-->
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
<form action="/listresults?state="+${state}+"&city="+${city}+"&pageNo=${i }">
	<c:forEach var="i" begin="0" end="${lastPageNo-1 }" >
		
		<input type="submit" value="${i+1 }" >&nbsp;&nbsp;&nbsp;&nbsp;	<!-- Displaying Page No -->
	</c:forEach>
</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results By Name</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<%@include file="navbar.jsp"%>
</head>


<body>

<div align="center" class="w3-container" >
<br>
<c:if test="${number eq 0}">
	<h1>Sorry, No match found for ${name}!</h1>
</c:if>
</div>


<c:if test="${number gt 0}">
	<h1>Found ${number} matching results for ${name }</h1>
		<div align="center" class="w3-container" style="padding-left: 15px;padding-right: 15px;"><br>
			<%@include file="locations-map-byname.jsp"%>
		</div>

	
	<div class="w3-container" style="padding-left: 15px;padding-right: 15px;"><br>
		<h4>Filter by Date Range<small>(Database starts Jan. 1, 2013)</small></h4>
		<form action="/dateSearch/${name}" method=POST>
		<table>
			<thead>
			<tr>
				<td>FROM DATE</td>
				<td>TO DATE</td>
			</tr>
			</thead>
			<tr><td><input type="date" name="fromDate" min="2013-01-01" max="2018-03-31"  value="${fromDate}"/></td>
			<td><input type="date" name="toDate" min="2013-01-01" max="2018-03-31" value="${toDate}" /></td>
			<td><input type="submit" value="Search"></tr>
		</table>
		</form>
	</div>
	<div align="center" class="w3-container" style="padding-left: 15px;padding-right: 15px;"><br>
		<table class="table table-hover" >
			<thead>
			<tr style="font-size:150%;">
			<td scope="col">Name</td>
			<td scope="col">Incident Date</td>
			<td scope="col">Address</td>
			<td scope="col">Number Killed</td>
			<td scope="col">Number Injured</td>
			</tr>
			</thead>
		<c:forEach var="incident" items="${matchingNames }">
			<tr class="table-warning">
			<td><c:forEach var="name" items="${incident.names }">
			<ol>
					<p><a href=/incident/${incident.incidentId}>${name }</a></p>
			</ol>
				</c:forEach></td>
			<td>${incident.date}</td>
			<td>${incident.address}</td>
			<td style="text-align:center">${incident.n_killed}</td>
			<td style="text-align:center">${incident.n_injured}</td>	
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
</c:if>
</body>
</html>
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
<script type="text/javascript" src="path_to/jquery.js"></script>
<script type="text/javascript" src="path_to/jquery.simplePagination.js"></script>
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


<%-- <c:forEach var="pageNo" begin="1" end="${lastPageNo}" >
        
        <a href="/listresults?state=${state}&city=${city}&pageNo=${pageNo}">${pageNo }</a>&nbsp;&nbsp;&nbsp;&nbsp;    
    
    </c:forEach> --%>
    
 <ul id="pagination" class="pagination"> </ul> 
    
<script>
$('#pagination').pagination({
    totalPages: 16,
    visiblePages: 6,
    next: 'Next',
    prev: 'Prev',
    onPageClick: function (event, page) {
        //fetch content and render here
        $('#page-content').text('Page ' + page) + ' content here';
    }
});
</script>

<!-- <nav>
   <ul class="pagination justify-content-center pagination-sm">
     <li id="previous-page" class="page-item"><a class="page-link" href="javascript:void(0)">Prev</a>
     </li>
   </ul>
 </nav>
 
 <script>
 
 var totalPages = Math.round(numberOfItems / 40);

//append the 1 page to the pagination

$(".pagination").append(
        "<li class='page-item current-page active'><a class='page-link'  href='javascript:void(0)'>" +
        1 +
        "</a></li>"
        );

//append the pages in sequential order after prev button (as seen in the html in codepen)

for (var i = 2; i <= totalPages; i++) {
    $(".pagination").append(
            "<li class='page-item current-page'><a class='page-link' href='javascript:void(0)'>" +
            i +
            "</a></li>"
            );
}

//appends the next button link as the final child element in the pagination

$(".pagination").append(
        "<li class='page-item' id='next-page'><a class='page-link' href='javascript:void(0)'>Next</a></li>"
        );

//When a page is selected, if it has "active" class return false, if no "active" class, go to page and add "active" class attribute and remove from any other element that has "active" on it.

$(".pagination li.current-page").on("click", function () {
    if ($(this).hasClass("active")) {
        return false;
    } else {
        var currentPage = $(this).index();
        $(".pagination li").removeClass("active");
        $(this).addClass("active");
        $("#jar .content").hide();

       //.hide will hide content that does not fit into that page (ie 0 and 1 on page one, 2 and 3 on page two and so on will show on appropriate page)  If it does not fall within the range for that page .hide, if it falls within the range .show content

        var grandTotal = limitPerPage * currentPage;

        for (var i = grandTotal - limitPerPage; i < grandTotal; i++) {
            $("#jar .content:eq(" + i + ")").show();
        }
    }
});

//when next is clicked if it is on the last page, return false otherwise move on to next page in pagination and remove "active" class from previous page and add "active" class to new page

/* $("#next-page").on("click", function () {
    var currentPage = $(".pagination li.active").index();
    if (currentPage === totalPages) {
        return false;
    } else {
        currentPage++;
        $(".pagination li").removeClass("active");
        $("#jar .content").hide();

        var grandTotal = limitPerPage * currentPage;

        for (var i = grandTotal - limitPerPage; i < grandTotal; i++) {
            $("#jar .content:eq(" + i + ")").show();
        }
        $(".pagination li.current-page:eq(" + (currentPage - 1) + ")").addClass(
   <!--            
  <!--               );
    }
});

//when prev is clicked if it is on the 1 page, return false otherwise move on to previous page and remove "active" class from last page visited and add "active" class to new page

$("#previous-page").on("click", function () {
    var currentPage = $(".pagination li.active").index();
    if (currentPage === 1) {
        return false;
    } else {
        currentPage--;
        $(".pagination li").removeClass("active");
        $("#jar .content").hide();

        var grandTotal = limitPerPage * currentPage;

        for (var i = grandTotal - limitPerPage; i < grandTotal; i++) {
            $("#jar .content:eq(" + i + ")").show();
        }
        $(".pagination li.current-page:eq(" + (currentPage - 1) + ")").addClass(
                "active"
                );
    }
});
 */ -->

<%-- <c:forEach var="pageNo" begin="1" end="${lastPageNo}" >
        
        <a href="/listresults?state=${state}&city=${city}&pageNo=${pageNo}">${pageNo }</a>&nbsp;&nbsp;&nbsp;&nbsp;    
    
    </c:forEach> --%>
   
    
    <%-- <c:forEach begin="1" end="${lastPageNo}" var="i">
   <c:choose>
       <c:when test="${pageNo eq i}">
           <li class="page-item active"><a class="page-link">
                   ${i} <span class="sr-only">(current)</span></a>
           </li>
       </c:when>
       <c:otherwise>
           <li class="page-item"><a class="page-link"
               href="/listresults?state=${state}&city=${city}&pageNo=${pageNo}">${pageNo }</a>
           </li>
       </c:otherwise>
   </c:choose>
</c:forEach>

   <c:if test="${pageNo != 1}">
   <li class="page-item"><a class="page-link"
       href="/listresults?state=${state}&city=${city}&pageNo=${pageNo}">${pageNo }></a>
   </li>
</c:if> --%>

<%-- <c:if if test="${pageNo <= lastPageNo}">
</c:if> --%>

    <h3>${pageNo }</h3>
<div name="page">
  <ul class="pagination">
  
   <c:if test="${pageNo ne 0}">
     <li class="page-item">
      <a class="page-link" href="/listresults?state=${state}&city=${city}&pageNo=1">First Page</a>
    </li>
    <li class="page-item"> 
      <a class="page-link" href="/listresults?state=${state}&city=${city}&pageNo=${pageNo - 1}">&laquo;</a>
    </li> </c:if>
    <li class="page-item active">
      <a class="page-link"  href="/listresults?state=${state}&city=${city}&pageNo=${pageNo + 0}">${pageNo + 0}</a>
    </li> 
    <c:if test="${pageNo + 1 le lastPageNo}">
    <li class="page-item">
      <a class="page-link" href="/listresults?state=${state}&city=${city}&pageNo=${pageNo + 1}">${pageNo + 1}</a>
    </li> </c:if>
     <c:if test="${pageNo + 2 le lastPageNo}">
    <li class="page-item">
      <a class="page-link" href="/listresults?state=${state}&city=${city}&pageNo=${pageNo + 2}">${pageNo + 2}</a>
    </li></c:if>
    <c:if test="${pageNo + 3 le lastPageNo}">
    <li class="page-item">
      <a class="page-link" href="/listresults?state=${state}&city=${city}&pageNo=${pageNo + 3}">${pageNo + 3}</a>
    </li> </c:if>
    <c:if test="${pageNo + 4 le lastPageNo}">
    <li class="page-item">
      <a class="page-link" href="/listresults?state=${state}&city=${city}&pageNo=${pageNo+ 4}">${pageNo + 4}</a>
    </li> </c:if>
    <li class="page-item">
      <a class="page-link" href="/listresults?state=${state}&city=${city}&pageNo=${lastPageNo}">Last Page</a>
    </li>
  </ul>
</div>
</div>
    
</body>
</html>
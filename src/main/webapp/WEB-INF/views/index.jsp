<%@page import="java.util.Random"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Home page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<%@include file="navbar.jsp"%>
<link rel="stylesheet" href="/style.css" />
</head>
<body>
<br>
<h1 align="center"><img src="https://i.postimg.cc/4NXJHdFr/header.png" alt="Header" style='width:100%'></h1>
<h2 align="center">(<u>A</u>wareness <u>I</u>nto <u>M</u>ovement!)</h2>
<br>
<h2></h2>
<h5 align="center">Our mission is to make people aware of the extent of gun violence and it's impact on people you know.</h5>
<h5 align="center"> Please feel free to search for gun violence incidents, add your connection to any victims and share via social media.
</h5>
<!-- <div class="w3-container">  -->
<!-- <div align="center"> -->
<div class="row">
  <div class="col-md-6"  style=background:#eb5e21><form action="/nameSearch" method="post" onsubmit="return validate();" style='width:100%'>
<div align="center" >
<h3>Enter name to Get Started </h3>
        <div class="form-group row" >
            <!--  <label for="firstName" class="col-sm-2 col-form-label">First Name:</label>-->
            <input class="form-control -md-5" name= "firstName" id= "firstName" type="text" placeholder="First Name" pattern="[a-zA-Z]*" title="Please enter only alphabets!" style='width:100%'>
        </div>
        <div class="form-group row" >
        
            <!-- <label for="lastName" class="col-sm-2 col-form-label">Last Name:</label>-->
            <input class="form-control md-5" name= "lastName" id= "lastName" type="text" placeholder="Last Name" pattern="[a-zA-Z]*" title="Please enter only alphabets!">
        </div>
        <button>Search</button>
</div>
</form></div>
  
  
  <div class="col-md-6" style=background:#eb5e21><div align="center" style='width:100%'>
 <h3>Select a State to Get Started</h3>
    <form method="post" action="/stateandcity" id="state_form" method=POST>
        <div class="form-group" >
            <label class="sr-only" for="state">State</label>
            <select class="form-control mb-2" id="state" name="state" required>
            <option value="">State</option>
            <c:forEach items="${ states }" var="state">
                <option <c:if test="${ state eq param.state }">selected</c:if>>${ state }</option>
            </c:forEach>
            </select> 
         </div>   
        <div class="form-group" >
            <label class="sr-only" for="city">City</label>
            <select class="form-control mb-2" id="city" name="city" required>
             <option value="">City</option>
            <c:forEach items="${ cities }" var="city">
                <option <c:if test="${ city eq param.city_or_county }">selected</c:if>>${ city }</option>
            </c:forEach>
            </select>
         </div>
         <button action = "submit">Submit</button>
    </form>
</div></div>
</div>
</div>
<div class="jumbotron" align="center"> 
  <h4 class="alert-heading"><%=
        Arrays.asList("\"How many have to die before we will give up these dangerous toys?\"",
                "\"Not everybody needs a gun , to get things done.\"",
                "\"Know guns, know peace, know safety. No guns, no peace, no safety.\"",
                "\"You don\'t spread democracy with a barrel of a gun.\"",
                "\"An armed man is a citizen. A disarmed man is a subject.\"")
        .get(new Random().nextInt(5))
    %></h4>
</div>
 <script>
var statesdropdown = document.getElementById("state");
var citiesdropdown = document.getElementById("city");
statesdropdown.addEventListener("change", function(){
    console.log(statesdropdown.value);
    var request = new XMLHttpRequest();
    request.open("GET", "/selectCity?state="+statesdropdown.value);
    request.onload = function(){
        var data = JSON.parse(request.responseText);
        renderHTML(data);
    };
    request.send();
});
function renderHTML(data){
    var htmlString
    for(var i=0; i<data.length; i++){
        
        var newelement = document.createElement("option");
        newelement.innerHTML = '<option>'+data[i]+'</option>';
    
        citiesdropdown.appendChild(newelement);
    }
}
citiesdropdown.addEventListener("change", function(){
    console.log(statesdropdown.value);
    console.log(citiesdropdown.value);
    var request = new XMLHttpRequest();
    request.open("GET","/listresults?state="+statesdropdown.value+"&city="+citiesdropdown.value);
    request.send(citiesdropdown.value);
    
});
function validate()
{
    var a = document.getElementById("firstName");
    var b = document.getElementById("lastName");
    if(a.value.length<=0 && b.value.length<=0)
       {
        alert("Both first and last name cannot be empty!");
        return false;
       }
    else
        return true;
};
    
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
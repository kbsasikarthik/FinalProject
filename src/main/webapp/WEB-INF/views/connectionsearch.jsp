<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Home page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<%@include file="navbar.jsp"%>
 <style>
    .side-by-side
    {
      float:left;
      padding:0px 20px;
    }
  </style>
</head>
<body>
<h1>Search by People You May Know</h1>
<p>You may not know someone involved in gun violence but chances are you know someone who does.</p>
<p>You can search your friends by using their name, Facebook profile or Twitter account to see if they have already claimed a connection to a incident of gun violence and see their connection to a victim.</p>
<form action="/connectionNameSearch" method="post">
	<div class="form-group row">
		<label for="connectionName" class="col-sm-2 col-form-label"><b>Search by Name:</b></label>
   		<input class="form-control mr-sm-2" name= "connectName" type="text" placeholder="Connection Name" pattern="[a-zA-Z]*" title="Please enter only alphabets!">
	</div>
	<button class="btn btn-secondary btn-sm">SUBMIT</button>
</form>
<form action="/facebookSearch" method="post">
	<div class="form-group row">
		<label for="facebookName" class="col-sm-2 col-form-label"><b>Search by Facebook Profile:</b></label>
   		<input class="form-control mr-sm-2" name="facebookName" type="text" placeholder="ex: https://www.facebook.com/username">
	</div>
	<button class="btn btn-secondary btn-sm">SUBMIT</button>
</form>
<form action="/twitterSearch" method="post">
	<div class="form-group row">
		<label for="twitterName" class="col-sm-2 col-form-label"><b>Search by Twitter Profile:</b></label>
   		<input class="form-control mr-sm-2" name="twitterName" type="text" placeholder="ex: @twittername">
	
	<button class="btn btn-secondary btn-sm">SUBMIT</button></div>
</form>
</body>
</html>
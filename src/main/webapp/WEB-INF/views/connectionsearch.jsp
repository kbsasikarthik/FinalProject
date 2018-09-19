<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Connection Search</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/united/bootstrap.min.css" />
<%@include file="navbar.jsp"%>
<style>
.namemargin {
	margin-left:93px;
}
.facebookmargin {
	margin-left: 10px;
}
.twittermargin {
	margin-left: 26px;
}
</style>
</head>
<body><div class="container">
<h1>Search by People You May Know</h1>
<p>You may not know someone involved in gun violence but chances are you know someone who does.</p>
<p>You can search your friends by using their name, Facebook profile or Twitter account to see if they have already claimed a connection to a incident of gun violence and see their connection to a victim.</p>
	<p><form class="form-inline" action="/connectionNameSearch" method="post">
	<div class="form-group row">
		<label for="connectionName" class="col-form-label"><b>Search by Name:</b></label>
   		<input style="display: inline;" class="namemargin" name= "connectName" type="text" placeholder="Connection Name" title="Please enter only alphabets!">
	<button class="btn btn-secondary btn-sm">SUBMIT</button></div>
</form></p>

<p><form class="form-inline" action="/facebookSearch" method="post">
	<div class="form-group row">
		<div width: 150px><label for="facebookName" class="col-form-label"><b>Search by Facebook Profile:</b></label></div>
   		<input class="facebookmargin" name="facebookName" type="text" placeholder="ex: https://www.facebook.com/username">
	<button &nbsp class="btn btn-secondary btn-sm">SUBMIT</button></div>
</form></p>

<p><form class="form-inline" action="/twitterSearch" method="post">
	<div class="form-group row">
		<label for="twitterName" class="col-form-label"><b>Search by Twitter Profile:</b></label>
   		<input class="twittermargin" name="twitterName" type="text" placeholder="ex: @twittername">
	<button class="btn btn-secondary btn-sm">SUBMIT</button></div>
</form></p>
</div>
</body>
</html>
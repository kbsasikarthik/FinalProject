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
.facebookmargin {
	margin-left: 10px;
}
.twittermargin {
	margin-left: 26px;
}
</style>
</head>
<body>
<div class="w3-container"   >
<h1>Search by People You May Know</h1>
<p>You may not know someone involved in gun violence but chances are you know someone who does.</p>
<p>You can search your friends by using their name, Facebook profile or Twitter account to see if they have already claimed a connection to a incident of gun violence and see their connection to a victim.</p>
<div align="center" class="col-md-6" >
	
<form  action="/connectionNameSearch" method="post">
	<div align="center" class="form-group row">
		<label for="connectionName" class="col-form-label"><b>Search by Name:</b></label>
   		<input class="form-control md-5" name="connectName" type="text" placeholder="Connection Name" title="Please enter only alphabets!">
	<button class="btn btn-secondary btn-sm">SUBMIT</button>
	</div>
</form>

<form  action="/facebookSearch" method="post">
	<div align="center"   class="form-group row">
		<label for="facebookName" class="col-form-label"><b>Search by Facebook Profile:</b></label>
   		<input class="form-control md-5" name="facebookName" type="text" placeholder="ex: https://www.facebook.com/username">
	<button class="btn btn-secondary btn-sm">SUBMIT</button>
	</div>
</form>

<form  action="/twitterSearch" method="post">
	<div class="form-group row">
		<label for="twitterName" class="col-form-label"><b>Search by Twitter Profile:</b></label>
   		<input class="form-control md-5" name="twitterName" type="text" placeholder="ex: @twittername">
	<button class="btn btn-secondary btn-sm">SUBMIT</button>
	</div>
</form>

</div>

</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>
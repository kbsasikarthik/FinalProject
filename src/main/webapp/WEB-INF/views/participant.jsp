<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Connect to A Participant</title>
</head>
<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.1&appId=1176145395808085&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<h1>Log-in to Facebook to add your connection to a person involved in gun violence</h1>

<div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="true" data-auto-logout-link="true" data-use-continue-as="true"></div>
<fb:login-button 
  scope="public_profile,email"
  onlogin="checkLoginState();">
</fb:login-button>

<script>
var finished_rendering = function() {
  console.log("finished rendering plugins");
  var spinner = document.getElementById("spinner");
  spinner.removeAttribute("style");
  spinner.removeChild(spinner.childNodes[0]);
}
FB.Event.subscribe('xfbml.render', finished_rendering);
</script>
<div id="spinner"
    style="
        background: #4267b2;
        border-radius: 5px;
        color: white;
        height: 40px;
        text-align: center;
        width: 250px;">
    Loading
    <div
    class="fb-login-button"
    data-max-rows="1"
    data-size="large"
    data-button-type="continue_with"
    data-use-continue-as="true"
    ></div>
</div>

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '{1173731342792067}',
      cookie     : true,
      xfbml      : true,
      version    : '{v3.1}'
    });
      
    FB.AppEvents.logPageView();   
      
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>

<h3>Person</h3> 
<p>Other connections, if any</p>

<c:forEach var="connection" items="${ connections }">

 <tr>
    <td>${connection.name}</td>
	<td>${connection.type}</td>
	<td>${connection.social}</td>
	
 </tr>  
 
 </c:>
	
<div class="input-group">
    <select name="connectionType" class="custom-select" id="inputGroupSelect">
         <option selected>How are you connected to this victim? </option>
         <option value="familyMember">Family Member</option>
         <option value="friend">Friend</option>
         <option value="coWorker">Co-Worker</option>
         <option value="schoolMate">School Mate</option>
         <option value="acquaintance">Acquaintance</option>
         <option value="neighbor">Neighbor</option>
         <option value="other">Other</option>
    </select>
    
</div>    

  
<div class="input-group-append">
  
  
  
 <form action="/addConnection" method="post" class="form">
		<div class="form-group row">
			<label for="name" class="col-sm-2 col-form-label">Your Name:</label>
    		<div class="col-sm-10">
			<input class="form-control" name="name" required minlength="2" maxlength="10"/>
		</div>
		</div>
		<div class="form-group row">
			<label for="social" class="col-sm-2 col-form-label">Facebook Account:</label>
			<div class="col-sm-10">
			<input class="form-control" name="social"/>
			</div>
		</div>
  </form>
  
  </div>
 

</body>
</html>
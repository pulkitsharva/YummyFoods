<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<c:if test="${sessionValue==null }">
<jsp:forward page="/index"></jsp:forward>
</c:if>
<script type="text/javascript">
var xmlHttp;
function ratingAssigned()
{
	var userRating=document.getElementById("userRating").value;
	var recipeId=document.getElementById("recipeId").value;
	var recipeAlreadyRated=document.getElementById("recipeAlreadyRated").value;
	var oldRating=null;
	if(recipeAlreadyRated=='true')
	{
		oldRating=document.getElementById("oldRating").value;
	}
	
	
	try 
    {
        if (window.XMLHttpRequest)
            xmlHttp = new XMLHttpRequest();
        else if (window.ActiveXObject)
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        if (!xmlHttp || xmlHttp == null) 
        {
            return;
        }
        var url = "assignUserRating?userRating=" +userRating+"&recipeId="+recipeId+"&oldRating="+oldRating+"&recipeAlreadyRated="+recipeAlreadyRated; // Here, I have mapped controller as "assignUserRating".
        xmlHttp.onreadystatechange = StateChanged;
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }
    catch (e)
    {
        alert("Some error occurred! Please try again");
    }
}
    function StateChanged()
	{
	    if ((xmlHttp.readyState == 4) && (xmlHttp.status == 200)) 
	    {
	       
	    	  alert(xmlHttp.responseText);
	    	  location.reload();
	       }
	    }
    function changeRating()
    {
    	var dropdown = document.getElementById("userRating");
    	var opt1 = document.createElement("option");
    	var opt2 = document.createElement("option");
    	var opt3 = document.createElement("option");
    	var opt4 = document.createElement("option");
    	var opt5 = document.createElement("option");
    	opt1.text = '1';
    	opt1.value = '1';
    	dropdown.options.add(opt1);
    	opt2.text = '2';
    	opt2.value = '2';
    	dropdown.options.add(opt2);
    	opt3.text = '3';
    	opt3.value = '3';
    	dropdown.options.add(opt3);
    	opt4.text = '4';
    	opt4.value = '4';
    	dropdown.options.add(opt4);
    	opt5.text = '5';
    	opt5.value = '5';
    	dropdown.options.add(opt5);
    }

</script>
<head>
	<meta charset="UTF-8">
	<title>Recipe - Food &amp; Recipes s</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
</head>
<body>
<div class="header">
		<div>
			<a href="index"><img src="<c:url value="/resources/images/logo.png" />" alt="Logo"></a>
		</div>
		<form:form action="doSearch?page=0" modelAttribute="recipe" method="post">
			<form:input path="name" id="search"/>
			<input type="submit" value="" id="searchbtn">
		</form:form>
	</div>
	
	
	<div class="body">
		<div>
			<div class="header">
		<nav id="nav_wrapper">
				<ul class="sf-menu" id="suckerfishnav">
					<li><a href="home">Home</a></li>
					<li class="haschildren"><a href="#" >A-Z Recipe</a>
						<ul>
							<li><a href="allRecipe?page=0" >All Recipe</a></li>
						</ul>
					</li>
					<li class="haschildren"><a href="#" >My Recipe</a>
						<ul>
							<li><a href="userAddRecipe" >Post</a></li>
							<li><a href="userRecipe?page=0" >View/Edit</a></li>		
						</ul>
					</li>
					
					<li class="current_page_ancestor"><a href="allVideo">Videos</a>
					</li>
					<li class="haschildren"><a href="#" >Settings</a>
						<ul>
							<li><a href="editProfile" >Profile</a></li>
							<li><a href="changePassword" >Change Password</a></li>
							<li><a href="doLogout" >Logout</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			</div>
				
				<div id="content">
					<c:forEach items="${recipeDetails }" var="recipe">
					<input type="hidden" id="recipeId" value=${recipe.recipeId }>
					<input type="hidden" id="recipeAlreadyRated" value=${recipeAlreadyRated }>
					
					<div>
						<div><br><br>
							<center><h2>${recipe.name }</h2>
								by:- ${recipe.user.userId }
							</center>
							
							<p><br>Ideal for ${recipe.forPeople } people.</p>
							<p>
							<b><u>Ingredients:</u></b>	${recipe.ingredients }.
							</p>
								<img src="image?recipeId=${recipe.recipeId }" alt="Image" width="650" height="300">
							<p>
								<br><b><u>Directions:</u></b> ${recipe.directions }.
							</p>
							<p>
								<br><font color="red">Current Rating:</font> ${recipe.currentRating }&nbsp;&nbsp;&nbsp;&nbsp; <font color="red">Your Rating: </font>
								<c:choose>
									<c:when test="${recipeAlreadyRated=='true' }">
										${userOldRating}
										<input type="hidden" id="oldRating" value=${userOldRating }>
										<a href="#" onClick="changeRating()">Change</a>
										<select name="userRating" id="userRating" onchange="ratingAssigned()"></select>
									</c:when>
									<c:otherwise>
										<select name="userRating" id="userRating" onchange="ratingAssigned()">
											<option selected></option>
											<option value=1>1</option>
											<option value=2>2</option>
											<option value=3>3</option>
											<option value=4>4</option>
											<option value=5>5</option>
										</select>
										
									</c:otherwise>
								</c:choose>		
								<br>
								<font color=red>Note: 5 is best and 1 is worst</font>
							</p>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		<div>
			<div>
				<h3>Cooking Video</h3>
				<iframe width="200" height="200" src="//www.youtube.com/embed/ngN4TWgL3sY" frameborder="0" allowfullscreen></iframe>
				
			</div>
			<div>
				<h3>Featured Recipes</h3>
				<ul id="featured">
				<c:forEach items="${sessionList}" var="recipe">
					<li>
					<a href="recipe?recipeId=<c:out value="${recipe.recipeId}"/>"><img src="image?recipeId=<c:out value="${recipe.recipeId}"/>" width="80" height="80" alt="Image"></a>
						<div>
							<h2><a href="recipe?recipeId=<c:out value="${recipe.recipeId}"/>"><c:out value="${recipe.name}"/></a></h2>
							<span>by: ${recipe.user.userId}</span>
						</div>
					</li>
					</c:forEach>
					
				</ul>

			</div>
			
			<div>
				<h3>Get Updates</h3>
				<a href="https://www.facebook.com/pulkit.sharva" target="_blank" id="facebook">Facebook</a>
				<a href="http://www.youtube.com/user/pulkitb4Mv" target="_blank" id="youtube">Youtube</a>
				<a href="https://plus.google.com/117192008917331015868/posts" target="_blank" id="googleplus">Google&#43;</a>
				<a href="http://stackoverflow.com/users/2219920/pulkit" target="_blank" id="stackoverflow">Stack Overflow</a>
				<a href="https://github.com/pulkitsharva" target="_blank" id="github">Github</a>
			</div>
		</div>
	</div>
	<div class="footer">
		<div>
			<p>
				&copy; Copyright 2014. All rights reserved
			</p>
		</div>
	</div>
</body>
</html>
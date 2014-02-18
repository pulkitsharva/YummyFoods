<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<c:if test="${sessionValue==null }">
<jsp:forward page="/index"></jsp:forward>
</c:if>
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
		<form action="index.html">
			<input type="text" value="Search from our 10,000+ Recipes around the world" id="search">
			<input type="submit" value="" id="searchbtn">
		</form>
	</div>
	
	<nav id="nav_wrapper">
				<ul class="sf-menu" id="suckerfishnav">
				<li>_____________________________________</li>
					<li><a href="home">Home</a></li>
					<li class="haschildren"><a href="#" >A-Z Recipe</a>
						<ul>
							<li><a href="userAllRecipe?page=0" >All Recipe</a></li>
							
						</ul>
					</li>
					<li class="haschildren"><a href="#" >My Recipe</a>
						<ul>
							<li><a href="userAddRecipe" >Post</a></li>
						<li><a href="userRecipe?page=0" >View</a></li>		
						</ul>
					</li>
					
					<li class="current_page_ancestor"><a href="allVideo">Videos</a>
					</li>
					<li class="haschildren"><a href="#" >Settings</a>
						<ul>
							<li><a href="#" >Profile</a></li>
						<li><a href="#" >Change Password</a></li>
						<li><a href="doLogout" >Logout</a></li>
						</ul>
					</li>
					<li>________________________________________________________</li>
					
					
				</ul>
			</nav>
	
	<div class="body">
		<div>
			
			<div class="body">
				<div id="content">
					<div>
						<ul>
							<c:forEach items="${recipeList }" var="recipe">
							 		<li>
										<a href="recipe?recipeId=${recipe.recipeId }"><img src="image?recipeId=${recipe.recipeId }" alt="Image" width="160" height="160"></a>
										<div>
											<h3><a href="recipe?recipeId=${recipe.recipeId }">${recipe.name }</a></h3>
											<p>
											${recipe.directions }.
										</p>
										</div>
									</li>
								
							</c:forEach>
						</ul>
						<div align="right">
							<c:if test="${pageValue1>1 }">
								<a href="userAllRecipe?page=-1">Previous </a>
							</c:if>
							<a href="userAllRecipe?page=${pageValue1-1 }">${pageValue1 }</a> 
							<a href="userAllRecipe?page=${pageValue2-1 }">${pageValue2 }</a> 
							<a href="userAllRecipe?page=${pageValue3-1 }">${pageValue3 }</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div>
				<h3>Cooking Video</h3>
				<iframe width="200" height="200" src="//www.youtube.com/embed/ngN4TWgL3sY" frameborder="0" allowfullscreen></iframe>
				<span>Vegetable &amp; Rice Topping</span>
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
				&copy; Copyright 2012. All rights reserved
			</p>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${sessionScope.registrationSuccess}">
	<div>
		<div class="alert alert-success alert-dismissible mt-4" role="alert">
			<span>Accesso eseguito</span>
			<a href='<spring:url value="index/ok"/>' class="btn-close"></a>
		</div>
	</div>
</c:if>
<c:if test="${sessionScope.loginSuccess}">
	<div>
		<div class="alert alert-success alert-dismissible mt-4" role="alert">
			<span>Accesso eseguito</span>
			<a class="btn-close" href="index/success"></a>
		</div>
	</div>
</c:if>
<c:if test="${sessionScope.logoutSuccess}">
	<div>
		<div class="alert alert-success alert-dismissible mt-4" role="alert">
			<span>Logout eseguito</span>
			<a class="btn-close" href="index/logout"></a>
		</div>
	</div>
</c:if>

<div id="sottotitolo" class="text-center">
   	<h5 class="card-title divisore">ULTIME NOTIZIE</h5>
</div>

<div class="container">
	<c:forEach items="${articles}" var="article">
		<div class="card mb-3 setBorderArticleHome" style="max-width: 100%; margin: 20px; height: 300px; text-align: center" >
		    <div class="row g-0">
		        <div class="col-md-4" >
		            <img class="img-fluid rounded-start" alt="Article Image" style="height: 295px; width: 450px;" src='<spring:url value="${article.image}"/>' />
		        </div>
		        <div class="col-md-8" align="center">
		        	<div style="height:220px">
			            <div class="card-body" style="height:100%; border:none">
			                <h5 class="card-title">${article.title}</h5>
			                <p class="card-text">${article.caption}</p>
			            </div>    
	                </div>
	                <div class="cardfooter">
			            <div class="col-md-8">
			            	<a href='<spring:url value="article?id=${article.id}"/>' class="btn btn-second">Vai alla notizia</a>
			            </div>
			            <div class="row">
				        	<div class="col-6">
				        		<span class="card-text">Pubblicato il: <fmt:formatDate value="${article.date}" pattern = "dd-MM-yyyy"/></span>
				        	</div>
				        	<div class="col-6">
				        		<a href='<spring:url value="/categories?id=${article.category.id}"/>' class="nav-link nav-link-white card-text">Categoria: ${article.category.description}</a>
				        	</div>
				        </div>
			        </div>
		        </div>
		    </div>
		</div>
	</c:forEach>
</div>
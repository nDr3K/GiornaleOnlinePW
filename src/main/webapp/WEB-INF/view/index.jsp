<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		        	<div style="height:225px">
			            <div class="card-body" style="height:100%; border:none">
			                <h5 class="card-title">${article.title}</h5>
			                <p class="card-text">${article.caption}</p>
			            </div>    
	                </div>
	                <div class="card-footer">
			            <div class="col-md-8">
			            	<a href='<spring:url value="article?id=${article.id}"/>' class="btn btn-warning">Vai alla notizia</a>
			            </div>
			            <div class="row">
				        	<div class="col-6">
				        		<span class="card-text">Pubblicato il: ${article.date}</span>
				        	</div>
				        	<div class="col-6">
				        		<span class="card-text">Categoria: ${article.category.description}</span>
				        	</div>
				        </div>
			        </div>
		        </div>
		    </div>
		</div>
	</c:forEach>
</div>
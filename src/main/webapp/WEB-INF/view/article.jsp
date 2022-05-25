<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	

<div class="container-fluid">
	<div class="card-group bg-warning">
	    <div class="card mb-3" align="center" style="max-width: 80%;margin: 20px; border-radius: 5px; border: 2px solid black">
	        <div class="row g-0 backgroundArticle">
	            <div class="col-md-12 " align="center">
	                <div class="card-body">
	                    <h5 class="card-title" style="text-align: left">${article.title}</h5>
	                </div>
	                <div class="row g-0">
	                    <div class="col-md-11" style="text-align: left; margin: 20px">
	                    	<img src='<spring:url value="${article.image}"/>' style="margin:5px" align="right" class="img-fluid rounded-start" alt="...">
	                       	<span class="card-text">${article.content}</span>
	                    </div>
	                    <hr>
	                    <div class="col-12 justify-content-center">
	                    <c:if test="${sessionScope.user != null}">
	                        <c:choose>
	                            <c:when test="${favorite}">
	                                <a class="btn btn-warning" href='<spring:url value="/article/remove?id=${article.id}"/>'>Rimuovi dai preferiti</a>
	                            </c:when>
	                            <c:otherwise>
	                                <a class="btn btn-warning" href='<spring:url value="/article/add?id=${article.id}"/>'>Aggiungi ai preferiti</a>
	                            </c:otherwise>
	                        </c:choose>
	                    </c:if>
	                    </div>
	                </div>
	                <hr>
	                <div class="row g-0">
	                    <div class="col-md-6" >
	                        <p class="card-text">di ${article.author}</p>
	                    </div>
	                    <div class="col-md-6">
	                        <p class="card-text">${article.date}</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="card" style="max-width: 20%; margin: 20px; border-radius: 5px; border: 2px solid black">
	        <div class="card-body">
	            <div class="card-title"></div>
	            <c:forEach items="${suggesteds}" var="suggested">
	                <c:if test="${suggested.id != article.id}">
	                    <a href='<spring:url value="/article?id=${suggested.id}"/>' class="nav-link">${suggested.title}</a><br>
	                </c:if>
	            </c:forEach>
	        </div>
	    </div>
	</div>
	
	<nav aria-label="Page navigation example" style="justify-content: center; display: flex; margin-top:30px;" >
	    <ul class="pagination" >
	        <li class="page-item">
	            <a class="page-link btn btn-primary" href='<spring:url value="/article/previous?id=${article.id}"/>' aria-label="Previous" style="margin-right: 200px;">
	                <span aria-hidden="true">&laquo; Articolo precedente</span>
	            </a>
	        </li>
	        <li>
	            <a class="page-link btn btn-primary" href='<spring:url value="/article/next?id=${article.id}"/>' aria-label="Next" style="margin-left: 200px;">
	                <span aria-hidden="true">Articolo successivo &raquo;</span>
	            </a>
	        </li>
	    </ul>
	</nav>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card text-center">
    <div class="card-body">
        <h5 class="card-title">ULTIME NOTIZIE</h5>
        <p class="card-text"></p>
    </div>
</div>

<c:forEach items="${articles}" var="article">
<div class="card mb-3" style="max-width: 100%; margin: 20px; max-height: 300px; text-align: center" >
    <div class="row g-0">
        <div class="col-md-4" >
        <img class="img-fluid rounded-start"  
							alt="Article Image" src="<c:url value="${article.image}" />">
        </div>
        <div class="col-md-8"align="center">
            <div class="card-body">
                <h5 class="card-title">${article.category.description}</h5>
                <p class="card-text">${article.title}</p>
                <p class="card-text">${article.caption}</p>
            </div>
            <div class="col-md-8">
                <a href='<spring:url value="article?id=${article.id}"/>' class="btn btn-primary">Vai alla notizia</a>
                <!-- <p class="card-text"><small class="text-muted">Update: ${article.lastUpdate}</small></p> -->
            </div>
        </div>
    </div>
</div>
</c:forEach>

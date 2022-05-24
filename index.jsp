<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div id="sottotitolo" class="text-center">
     	<h5 class="card-title divisore">ULTIME NOTIZIE</h5>
	</div>

<c:forEach items="${articles}" var="article">
<div class="card mb-3 " style="max-width: 100%; margin: 20px; height: 300px; text-align: center" >
    <div class="row g-0">
        <div class="col-md-4" >
            <img class="img-fluid rounded-start" alt="Article Image" style="height: 295px; width: 450px;" src="negozio1.jpg" />
        </div>
        <div class="col-md-8"align="center">
            <div class="card-body">
                <h5 class="card-title">${article.title}</h5>
                <p class="card-text">${article.caption}</p>

            <div class="col-md-8">
                <a href='#' class="btn btn-secondary">Vai alla notizia</a>
            </div>
            </div>
        </div>
    </div>
</div>
</c:forEach>

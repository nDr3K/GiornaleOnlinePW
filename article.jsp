<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	



    <div class="card-group bg-warning">
        <div class="card mb-3" align="center" style="max-width: 70%;margin: 20px; border-radius: 5px; border: 2px solid black">
            <div class="row g-0">
                <div class="col-md-12 " align="center">
                    <div class="card-body">
                        <h5 class="card-title" style="text-align: left">${article.title}</h5>
                    </div>
                    <div class="row g-0">
                        <div class="col-md-8" style="text-align: left; margin: 30px; max-width: 80%">
                            <p class="card-text">${article.content}</p>
                        </div>
                            <c:if test="${sessionScope.user != null}">
                                <c:choose>
                                    <c:when test="${favorite}">
                                        <a href='<spring:url value="/article/remove?id=${article.id}"/>'>Rimuovi dai preferiti</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href='<spring:url value="/article/add?id=${article.id}"/>'>Aggiungi ai preferiti</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        <div class="col-md-3" style="justify-content: center; margin-top:auto; margin-bottom:auto; max-width: 500px; max-height: 500px;">
                            <img src="${article.image}" class="img-fluid rounded-start" alt="...">
                        </div>
                    </div>
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
    <div class="card" style="max-width: 30%; margin: 20px; border-radius: 5px; border: 2px solid black">
        <div class="card-body">
            <div class="card-title"></div>
            <c:forEach items="${suggesteds}" var="suggested">
                <c:if test="${suggested.id != article.id}">
                    <span><a href='<spring:url value="/article?id=${suggested.id}"/>'>${suggested.title}</a></span>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>

<nav aria-label="Page navigation example" style="justify-content: center; display: flex; margin-top:30px;" >
    <ul class="pagination" >
        <li class="page-item">
            <a class="page-link" href='<spring:url value="/article/previous?id=${article.id}"/>' aria-label="Previous" style="margin-right: 200px;">
                <span aria-hidden="true">&laquo; Articolo precedente</span>
            </a>
        </li>
        <li>
            <a class="page-link" href='<spring:url value="/article/next?id=${article.id}"/>' aria-label="Next" style="margin-left: 200px;">
                <span aria-hidden="true">Articolo successivo &raquo;</span>
            </a>
        </li>
    </ul>
</nav>
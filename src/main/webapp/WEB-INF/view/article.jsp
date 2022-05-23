<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	


<div class="row">
	<div class="col-9">
		<div>
			<span>${article.title}</span>
			<br>
			<span>${article.author}</span>
			<hr>
			<br>
			<span>${article.content}</span>
			<br>
			<c:if test="${sessionScope.user != null}">
				<c:choose>
					<c:when test="${favorite}">
						<a href='<spring:url value="/article/remove?id=${article.id}"/>'>togli dai preferiti</a>
					</c:when>
					<c:otherwise>
						<a href='<spring:url value="/article/add?id=${article.id}"/>'>aggiungi ai preferiti</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
	</div>
	<div class="col-3">
		<c:forEach items="${suggesteds}" var="suggested">
			<c:if test="${suggested.id != article.id}">
				<span><a href='<spring:url value="/article?id=${suggested.id}"/>'>${suggested.title}</a></span>
			</c:if>
		</c:forEach>
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
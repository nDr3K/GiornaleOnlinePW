<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
	<c:forEach items="${categories}" var="category">
		<div class="row row-cols-1 row-cols-md-1 g-4" style="margin-top: 10px; margin-left: 150px; margin-right: 150px; margin-bottom: 10px; text-align: center; justify-content: center">
			<div class="col">
				<div class="card h-100">
					<div class="card-body">
						<button class="btn formatButtonCategory" type="button" onclick="showElements(${category.id})">${category.description}</button>
						<c:if test="${mode}">
							<script>
							window.onload = function() {
								document.getElementById(${category.id}).style.display = "block";
								};
							</script>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div id="${category.id}" class="row row-cols-1 row-cols-md-1 g-4" style="margin-left: 150px; margin-right: 150px; border-radius: 5px; display:none">
			<div class="card">
				<div class="card-body">
					<table class="table">
						<c:forEach items="${articles}" var="article">
							<c:if test="${article.category.id == category.id}">
								<tr>
									<td width="75%">
										<a href='<spring:url value="/article?id=${article.id}"/>' class="nav-link nav-link-white">${article.title}</a>
									</td>
									<td width="25%" align="right">
										<span class="nav-link nav-link-white"><fmt:formatDate value="${article.date}" pattern = "dd-MM-yyyy"/></span>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<script src="<c:url value="/static/javascript/script.js" />"></script>
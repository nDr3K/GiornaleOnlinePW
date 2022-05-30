<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<br><br>

<div class="row row-cols-1 row-cols-md-1 g-4" style="margin-left: 150px; margin-right: 150px; border-radius: 5px">
			<div class="card">
				<div class="card-body">
					<table class="table">
						<c:forEach items="${articles}" var="article">
							<c:if test="${!article.visible}">
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
		
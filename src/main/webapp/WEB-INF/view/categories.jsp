<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${categories}" var="category">
<div>
  <button class="btn btn-secondary">
    ${category.description}
  </button>
  <div>
  	<c:forEach items="${articles}" var="article">
  		<c:if test="${article.category.id == category.id}">
  			<a href='<spring:url value="/article?id=${article.id}"/>'>${article.title}</a><br/>
  		</c:if>
    </c:forEach>
  </div>
</div>
</c:forEach>
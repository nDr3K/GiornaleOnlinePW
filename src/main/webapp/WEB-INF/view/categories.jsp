<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${categories}" var="categorie">

<div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${categorie.description}
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <div class="dropdown-item">
                    <c:forEach items="${articles}" var="article">
                    <c:if test="${article.category.description == categorie.description}">
                    
                        <div class="row"> 
                        	
                        	<div class="col-4"><a href='<spring:url value="/article?id=${id}"/>'>${article.title}</a></div>
                        	<div class="col-8"><a href='<spring:url value="/article?id=${id}"/>'>${article.abstract}</a></div>
                        </div>	
                        
                        </c:if>
					</c:forEach>
					</div>
                    </div>
                </div>

</c:forEach>
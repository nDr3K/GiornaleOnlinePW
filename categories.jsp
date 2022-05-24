<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <div class="row row-cols-1 row-cols-md-1 g-4" style=" margin-top:10px; margin-left: 150px; margin-right:150px; margin-bottom: 10px; text-align: center; justify-content: center">
        <div class="col">
            <div class="card h-100 bordo">
                <div class="card-body">
                    <button class="btn categorie" type="button">
                        ${category.description}
                    </button>
                </div>
            </div>
        </div>
    </div>

<div class="row row-cols-1 row-cols-md-1 g-4"  style="margin-left: 150px; margin-right: 150px; border-radius: 5px;">
    <div class="card">
        <div class="card-body">
            <!--<c:forEach items="${suggesteds}" var="suggested">-->
              <!--  <c:if test="${suggested.id != article.id}">-->

            <table class="table">
                <tr>
                    <td>
                        <span><a href='<spring:url value="/article?id=${suggested.id}"/>'>${suggested.title}</a></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span><a href='<spring:url value="/article?id=${suggested.id}"/>'>${suggested.title}</a></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span><a href='<spring:url value="/article?id=${suggested.id}"/>'>${suggested.title}</a></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span><a href='<spring:url value="/article?id=${suggested.id}"/>'>${suggested.title}</a></span>
                    </td>
                </tr>
            </table>





                <!--    </c:if>
                </c:forEach>-->
            </div>
         </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="row mt-4">
	<div class="col-10 text-center">
		<h5>Benvenuto</h5>
	</div>
</div>
<div class="row">
	<div class="col-12">
		<table class="table table-striped table-responsive">
			<thead>
				<tr>
					<th>Username</th>
					<th>Password</th>
					<th>E-Mail</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td>${user.username}</td>
						<td>${user.password}</td>
						<td>${user.mail}</td>
						<td class="text-end">
							<a href='<spring:url value="/registration?id=${user.id}" />' 
								class="btn btn-primary btn-sm">
								Modifica
							</a>&emsp;
							<a href='<spring:url value="user/delete?id=${user.id}" />' 
								class="btn btn-danger btn-sm">
								Elimina
							</a>
						</td>
					</tr>
			</tbody>
		</table>
		<c:forEach items="${articles}" var="article">
		<span>${article.title}</span><br>
		</c:forEach>
	</div>
</div>
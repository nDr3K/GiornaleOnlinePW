<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row mt-4">
	<div class="col-6">
		<div class="row">
			<div class="col-12 text-center">
				<h5>${mode ? Nuovo Articolo : Aggiorna Articoli}</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<form:form method="POST" modelAttribute="article" acceptCharset="ISO-8859-1">
					<form:errors path="*" cssClass="alert alert-danger" element="div" 
						id="generalAlert"/>
					<div class="row">
						<div class="col-6">
							<form:hidden path="id"/>
							<label for="title">Titolo:</label>
							<form:input path="title" id="title" type="text" 
								cssClass="form-control" required="required" />
							<form:errors path="title" id="titleError" cssClass="text-danger"/>
						</div>
						<div class="col-6">
							<label for="abstract">Didascalia:</label>
							<form:textarea path="abstract" id="abstract" 
								cssClass="form-control" rows="2" style="resize:none;" 
								required="required" />
							<form:errors path="abstract" id="abstractError" cssClass="text-danger"/>
						</div>
						<div class="row">
						<div class="col-6">
							<form:select  path="categories">
							    <form:option value="NONE"> --Seleziona Categoria--</form:option>
							    <form:options items="${categories.description}"></form:options>
						    </form:select>
						</div>

						<div class="col-6">
							<label for="author">Autore:</label>
							<form:input path="author" id="author" type="text" 
								cssClass="form-control" required="required" />
							<form:errors path="author" id="authorError" cssClass="text-danger"/>
						</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<label for="description">Descrizione:</label>
							<form:textarea path="description" id="description" 
								cssClass="form-control" rows="4" style="resize:none;" 
								required="required" />
							<form:errors path="description" id="descriptionError" 
								cssClass="text-danger"/>
						</div>
					</div>
					<div class="row">
						<div class="col-6 text-center">
							<input type="submit" value="Aggiorna Articolo" 
								class="btn btn-primary mt-4">
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<div class="row mt-4">
	<div class="col-6">
		<div class="row">
			<div class="col-12 text-center">
				<h5>${mode ? Crea Categoria : Modifica Categoria}</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<form:form method="POST" modelAttribute="category" acceptCharset="ISO-8859-1">
					<form:errors path="*" cssClass="alert alert-danger" element="div" 
						id="generalAlert"/>
					<div class="row">
						<div class="col-8">
							<form:hidden path="id"/>
							<label for="description">Nome Categoria</label>
							<form:input path="description" id="description" type="text" 
								cssClass="form-control" required="required" />
							<form:errors path="description" id="descriptionError" cssClass="text-danger"/>
						<div class="col-4">
							<input type="submit" value='${mode ? Aggiungi Categoria : Modifica Categoria}'
								class="btn btn-primary mt-4">
						</div>
						</div>
					</div>	
				</form:form>	
			</div>
		</div>
	</div>
</div>				
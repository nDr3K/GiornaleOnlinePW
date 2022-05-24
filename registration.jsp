<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="form-body">
                <form:form method="POST" modelAttribute="user" acceptCharset="ISO-8859-1">
                <div class="row">
                    <div class="form-holder ">
                        <div class="form-content">
                            <div class="form-items">
                                <h3>Registrati!</h3>
                                <p>Compila i campi sottostanti</p>
                                <form PERANDREA>

                                    <div class="col-md-12">
                                        <input class="form-control" type="text" name="name" placeholder="Username" required>
                                        <label for="username">Username:</label>
                                        <form:input path="username" id="username" type="text" cssClass="form-control"
                                                    required="required" />
                                        <form:errors path="username" id="usernameError" cssClass="text-danger"/>
                                        <c:if test="${userExist}">
                                            <span>Nome utente gia preso</span>
                                        </c:if>

                                    </div>

                                    <div class="col-md-12">
                                        <input class="form-control" type="email" name="email" placeholder="Indirizzo E-Mail" required>
                                        <label for="mail">Indirizzo Mail:</label>
                                        <form:input path="mail" id="mail" type="mail" cssClass="form-control"
                                                    required="required" />
                                        <form:errors path="mail" id="mailError" cssClass="text-danger"/>
                                        <c:if test="${mailExist}">
                                            <span>Mail gia registrata</span>
                                            </c:if>
                                    </div>

                                    <div class="col-md-12">
                                        <input class="form-control" type="password" name="password" placeholder="Password" required>
                                        <label for="password">Password:</label>
                                        <form:input path="password" id="password" type="password" cssClass="form-control"
                                                    required="required" />
                                        <form:errors path="password" id="password" cssClass="text-danger"/>
                                    </div>

                                    <div class="form-button mt-3  d-flex justify-content-center">
                                        <button id="submit" type="submit" class="btn btn-primary">Registrati</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                </form:form>
            </div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	




    <nav aria-label="Page navigation example" style="justify-content: center; display: flex; margin-top:30px;" >
        <ul class="pagination" >
            <li class="page-item">
                <a class="page-link" href="/article?id=${article.id > 1 ? article.id - 1 : article.id}" aria-label="Previous" style="margin-right: 200px;">
                    <span aria-hidden="true">&laquo; Articolo precedente</span>
                </a>
            </li>
            <li>
                <a class="page-link" href="/article?id=${article.id < max ? article.id + 1 : articles.id}" aria-label="Next" style="margin-left: 200px;">
                    <span aria-hidden="true">Articolo successivo &raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
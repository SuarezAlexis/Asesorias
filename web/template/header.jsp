<%-- 
    Document   : header
    Created on : 4 oct 2019, 16:53:50
    Author     : JAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/08/ENPlogo.jpg" style="height: 150px; padding-right: 20px;"/>
        </div>
        <ul class="nav navbar-nav">
            <li>
                <h3>Asesor&iacute;as</h3>
                <h4>Universidad Nacional Aut&oacute;noma de M&eacute;xico</h4>
                <h4>Escuela Nacional Preparatoria</h4>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${not empty sessionScope.usuario}">
                <li>
                    <span class="glyphicon glyphicon-user"></span> 
                    Usuario: <c:out value="${sessionScope.usuario.username}" />                
                </li>
            </c:if>
        </ul>
    </div>
</nav>
<!-- 
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/08/ENPlogo.jpg" style="height: 150px; padding-right: 20px;"/>
        </div>
        <ul class="nav navbar-nav">
            <li>
                <h3>Asesor&iacute;as</h3>
                <h4>Universidad Nacional Aut&oacute;noma de M&eacute;xico</h4>
                <h4>Escuela Nacional Preparatoria</h4>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Iniciar sesi&oacute;n</a></li>
        </ul>
    </div>
</nav>
-->

<%--
<h3>Asesorías</h3>
<h4>D G E N P</h4>

<p style="text-align: right;">
    <c:if test="${not empty sessionScope.usuario}">
        Usuario: <c:out value="${sessionScope.usuario.username}" />
    </c:if>
</p>
--%>
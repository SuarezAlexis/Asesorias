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
        <div class="row">
            <div class="col-xs-2">
                <img src="https://upload.wikimedia.org/wikipedia/commons/0/08/ENPlogo.jpg" style="height: 150px; padding-right: 20px;"/>
            </div>
            <div class="col-xs-8 text-center">
                    <h3>Asesor&iacute;as</h3>
                    <h4>Universidad Nacional Aut&oacute;noma de M&eacute;xico</h4>
                    <h4>Escuela Nacional Preparatoria</h4>

            </div>
            <div class="col-xs-2">
                <img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/Escudo-UNAM-escalable.svg" style="height: 150px; padding-right: 20px;"/>
            </div>
        </div>
        <div class="row">
            <c:if test="${not empty sessionScope.usuario}">
                <div class="col-xs-2">
                    <span class="glyphicon glyphicon-user"></span> 
                    Usuario: <c:out value="${sessionScope.usuario.username}" />                
                </div>
                <div class="col-xs-8"></div>
                <div class="col-xs-2">
                    <a href="<c:url value="controller?accion=salir" />">
                        Salir <span class="glyphicon glyphicon-log-out"></span>
                    </a>    
                </div>
            </c:if>
        </div>
    </div>
</nav>

<%--
<h3>Asesorías</h3>
<h4>D G E N P</h4>

<p style="text-align: right;">
    <c:if test="${not empty sessionScope.usuario}">
        Usuario: <c:out value="${sessionScope.usuario.username}" />
    </c:if>
</p>
--%>
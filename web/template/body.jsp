<%-- 
    Document   : body
    Created on : 4 oct 2019, 16:54:07
    Author     : JAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<c:choose>
    <c:when test="${param.accion eq 'nuevo'}">
        <jsp:include page="/site/nuevo.jsp" />
    </c:when>
    <c:when test="${param.accion eq 'registros'}" >
        <jsp:include page="/site/registros.jsp" />
    </c:when>
    <c:when test="${param.accion eq 'salir'}" >
        <jsp:forward page="/login"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="/site/inicio.jsp" />
    </c:otherwise>
</c:choose>

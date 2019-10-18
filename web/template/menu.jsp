<%-- 
    Document   : menu
    Created on : 4 oct 2019, 16:53:58
    Author     : JAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<ul class="nav nav-pills nav-justified">
    <li class="active"><a href="#">P&aacute;gina principal</a></li>
    <c:if test="${not empty applicationScope.urlItems}">
        <c:forEach items="${applicationScope.urlItems}" var="item" >
            <li> 
                <a href="<c:url value="/controller?accion=${item.valor}"/>">
                    <c:out value="${item.etiqueta}" />
                </a>
            </li>
        </c:forEach>
    </c:if>
</ul>
<hr/>


<%--
<p>MENU</p>
<ul>
    <c:if test="${not empty applicationScope.urlItems}">
        <c:forEach items="${applicationScope.urlItems}" var="item" >
            <li> 
                <a href="<c:url value="/controller?accion=${item.valor}"/>">
                    <c:out value="${item.etiqueta}" />
                </a>
            </li>
        </c:forEach>
    </c:if>
</ul>
--%>
<%-- 
    Document   : index
    Created on : 4 oct 2019, 16:44:43
    Author     : JAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setBundle basename="asesorias" var="llaves" scope="application" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key="titulo" bundle="${applicationScope.llaves}"/></title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <a href="<c:url value="/login"/>" >Ingresar a aplicaci&oacute;n</a>
    </body>
</html>

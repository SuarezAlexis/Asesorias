<%-- 
    Document   : webapp
    Created on : 4 oct 2019, 16:55:35
    Author     : JAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/css/template.css"/>" />
        <title>Asesor&iacute;as</title>
    </head>
    <body>
        <div class="container">
            <div class="box header">
                <%-- se agrega el encabezado de la plantilla --%>
                <jsp:include page="/template/header.jsp" />
            </div>
            <div class="box left_menu">
                <%-- se agrega el menú de la plantilla --%>
                <jsp:include page="/template/menu.jsp" />
            </div>
            <div class="box main">
                <%-- se agrega el cuerpo de la plantilla --%>
                <jsp:include page="/template/body.jsp" />
            </div>
            <div class="box footer">
                <%-- se agrega el pie de la plantilla --%>
                <jsp:include page="/template/footer.jsp" />
            </div>
        </div>
    </body>
</html>

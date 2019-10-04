<%-- 
    Document   : webapp
    Created on : 4 oct 2019, 16:55:35
    Author     : JAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <title>Asesor&iacute;as</title>
    </head>
    <body style="background-color: darkblue;">
        <div class="container" style="background-color: darkgoldenrod;">
            <%-- se agrega el encabezado de la plantilla --%>
            <jsp:include page="/template/header.jsp" />

            <%-- se agrega el menú de la plantilla --%>
            <jsp:include page="/template/menu.jsp" />

            <%-- se agrega el cuerpo de la plantilla --%>
            <jsp:include page="/template/body.jsp" />

            <%-- se agrega el pie de la plantilla --%>
            <jsp:include page="/template/footer.jsp" />
            
        </div>
    </body>
</html>

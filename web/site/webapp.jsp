<%-- 
    Document   : webapp
    Created on : 4 oct 2019, 16:55:35
    Author     : JAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <title><fmt:message bundle="${applicationScope.llaves}" key="titulo.app"/></title>
    </head>
    <body>
        <div class="container">
            <div id="header" class="row text-center">
                <jsp:include page="/template/header.jsp" />
            </div>
            <div id="main" class="row">
                <div id="menu" class="col-xs-3">
                    <jsp:include page="/template/menu.jsp" />
                </div>
                <div id="body" class="col-xs-9">
                    <jsp:include page="/template/body.jsp" />
                </div>
            </div>
            <div class="row text-center">
                <hr/>
                <jsp:include page="/template/footer.jsp" />
            </div>
        </div>
    </body>

    <%--
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/css/template.css"/>" />
        <title><fmt:message bundle="${applicationScope.llaves}" key="titulo.app"/></title>
    </head>
    <body>
        <div class="container">
            <div class="box header">
                <jsp:include page="/template/header.jsp" />
            </div>
            <div class="box left_menu">
                <jsp:include page="/template/menu.jsp" />
            </div>
            <div class="box main">
                <jsp:include page="/template/body.jsp" />
            </div>
            <div class="box footer">
                <jsp:include page="/template/footer.jsp" />
            </div>
        </div>
    </body>
    --%>
</html>

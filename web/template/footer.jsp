<%-- 
    Document   : footer
    Created on : 4 oct 2019, 16:54:02
    Author     : JAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<p>
    <fmt:message bundle="${applicationScope.llaves}" key="texto.footer"/>
</p>
<p>
    <fmt:message bundle="${applicationScope.llaves}" key="texto.copyright"/>
</p>

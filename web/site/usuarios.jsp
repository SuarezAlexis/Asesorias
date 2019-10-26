<%-- 
    Document   : usuarios
    Created on : 18/10/2019, 10:46:27 AM
    Author     : alexis.suarez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<div class="row">
    <h3>Usuario</h3>
    <div id="errores" class="text-danger">
        <c:if test="${sessionScope.errorUsername != null}">
            <div> <c:out value="${sessionScope.errorUsername}" /> </div>
        </c:if>
        <c:if test="${sessionScope.errorNombre != null}">
            <div> <c:out value="${sessionScope.errorNombre}" /> </div>
        </c:if>
        <c:if test="${sessionScope.errorApellidos != null}">
            <div> <c:out value="${sessionScope.errorApellidos}" /> </div>
        </c:if>
        <c:if test="${sessionScope.errorEmail != null}">
            <div> <c:out value="${sessionScope.errorEmail}" /> </div>
        </c:if>
        <c:if test="${sessionScope.errorPassword != null}">
            <div> <c:out value="${sessionScope.errorPassword}" /> </div>
        </c:if>
    </div>
    <form id="nuevo" action="<c:url value="usuario" />" method="post" accept-charset="UTF-8">
        <div class="col-xs-3 form-group <c:out value="${sessionScope.errorUsername != null? 'text-danger' : ''}" />">
            <label for="username">Nombre de usuario</label>
            <input type="text" id="username" name="username" class="form-control <c:out value="${sessionScope.errorUsername != null? 'has-error' : ''}" />" value="<c:out value="${sessionScope.usuarioDto != null? sessionScope.usuarioDto.username : ''}"/>"/>
        </div>
        <div class="col-xs-3 form-group <c:out value="${sessionScope.errorNombre != null? 'text-danger' : ''}" />">
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre" class="form-control <c:out value="${sessionScope.errorNombre != null? 'has-error' : ''}" />" value="<c:out value="${sessionScope.usuarioDto != null? sessionScope.usuarioDto.nombre : ''}"/>"/>
        </div>
        <div class="col-xs-3 form-group <c:out value="${sessionScope.errorApellidos != null? 'text-danger' : ''}" />">
            <label for="apellidos">Apellidos</label>
            <input type="text" id="apellidos" name="apellidos" class="form-control <c:out value="${sessionScope.errorApellidos != null? 'has-error' : ''}" />" value="<c:out value="${sessionScope.usuarioDto != null? sessionScope.usuarioDto.apellidos : ''}"/>"/>
        </div>
        <div class="col-xs-3 form-group <c:out value="${sessionScope.errorEmail != null? 'text-danger' : ''}" />">
            <label for="email">Correo electr&oacute;nico</label>
            <input type="text" id="email" name="email" class="form-control <c:out value="${sessionScope.errorEmail != null? 'has-error' : ''}" />" value="<c:out value="${sessionScope.usuarioDto != null? sessionScope.usuarioDto.email : ''}"/>"/>
        </div>
        <div class="col-xs-3 form-group <c:out value="${sessionScope.errorPassword != null? 'text-danger' : ''}" />">
            <label for="password">Contrase&ntilde;a</label>
            <input type="password" id="password" name="password" class="form-control <c:out value="${sessionScope.errorPassword != null? 'has-error' : ''}" />" value="<c:out value="${sessionScope.usuarioDto != null? sessionScope.usuarioDto.password : ''}"/>"/>
        </div>
        <div class="col-xs-3 form-group <c:out value="${sessionScope.errorPassword != null? 'text-danger' : ''}" />">
            <label for="confirmacion">Confirmaci&oacute;n</label>
            <input type="password" id="password" name="confirmacion" class="form-control <c:out value="${sessionScope.errorPassword != null? 'has-error' : ''}" />"/>
        </div>
        <div class="col-xs-3 form-group">
            <label for="rol">Roles</label>
            <div>
                <c:set var="habilitado" value="false" />
                <c:forEach items="${requestScope.roles}" var="r">
                    <c:forEach items="${sessionScope.usuarioDto.roles}" var="ur" >
                        <c:if test="${ur eq r}">
                            <c:set var="habilitado" value="true" />
                        </c:if>
                    </c:forEach>
                    
                    <label><input type="checkbox" id="roles" name="roles" value="${r.id}" <c:out value="${habilitado? 'checked' : ''}"/>/><c:out value="${r.nombre}"/></label>
                </c:forEach>
            </div>
            <!-- 
            <select id="roles" name="roles" class="form-control" multiple>
                <c:forEach items="${requestScope.roles}" var="r">
                    <option value="${r.id}"><c:out value="${r.nombre}"/></option>
                </c:forEach>
            </select>
            -->
        </div>
        <div class="col-xs-3 form-group">
            <label></label>
            <div class="checkbox">
                <label><input type="checkbox" id="habilitado" name="habilitado" <c:out value="${sessionScope.usuarioDto != null and not sessionScope.usuarioDto.habilitado? '' : 'checked'}"/>/>Habilitado</label>
            </div>
        </div>
        <div class="col-xs-12">
            <button type="submit" id="submit" name="submit" class="btn btn-block btn-primary">
                Guardar &nbsp; <span class="glyphicon glyphicon-floppy-disk"></span>
            </button>
        </div>
    </form>
</div>
<hr/>
<div id="lista" class="row">
    <h3>Tabla de usuarios</h3>
    <c:choose>
        <c:when test="${requestScope.usuarios != null and not empty requestScope.usuarios}">
            <table class="table">
                <thead>
                    <tr>
                        <th>Usuario</th>
                        <th>Nombre completo</th>
                        <th>Correo electr&oacute;nico</th>
                        <th>Habilitado</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.usuarios}" var="u">
                        <tr>
                            <td><c:out value="${u.username}"/></td>
                            <td><c:out value="${u.nombre}"/><c:out value=" "/><c:out value="${u.apellidos}"/></td>
                            <td><c:out value="${u.email}"/></td>
                            <td><c:out value="${u.habilitado}"/></td>
                            <td class="text-center">
                                <form id="editar" action="<c:url value="usuario" />" method="post">
                                    <input type="hidden" id="editarUsername" name="editarUsername" value="<c:out value="${u.username}"/>"/>
                                    <button type="submit" class="btn btn-sm btn-block btn-warning">
                                        Editar &nbsp; <span class="glyphicon glyphicon-edit"></span>
                                    </button>
                                </form>
                            </td>
                            <td class="text-center">
                                <form id="eliminar" action="<c:url value="usuario" />" method="post">
                                    <input type="hidden" id="borrarUsername" name="borrarUsername" value="<c:out value="${u.username}"/>"/>
                                    <button type="submit" class="btn btn-sm btn-block btn-danger">
                                        Eliminar &nbsp; <span class="glyphicon glyphicon-remove"></span>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <div class="well">
                <fmt:message bundle="${applicationScope.llaves}" key="lista.vacia"/>
            </div>
        </c:otherwise>
    </c:choose>
</div>
    
    

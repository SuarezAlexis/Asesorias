<%-- 
    Document   : roles
    Created on : 18/10/2019, 01:12:13 PM
    Author     : alexis.suarez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<div class="row">
    <h3>Rol</h3>
    <div id="errores" class="text-danger">
        <c:if test="${sessionScope.errorNombre != null}">
            <div> <c:out value="${sessionScope.errorNombre}" /> </div>
        </c:if>
        <c:if test="${sessionScope.errorDescripcion != null}">
            <div> <c:out value="${sessionScope.errorApellidos}" /> </div>
        </c:if>
    </div>
    <form id="nuevo" action="<c:url value="rol" />" method="post" accept-charset="UTF-8" >
        <div class="col-xs-1 form-group">
            <label>ID</label>
            <div>
                <c:out value="${sessionScope.rolDto != null? sessionScope.rolDto.id : ''}" />
                <input type="hidden" id="id" name="id" value="${sessionScope.rolDto != null? sessionScope.rolDto.id : '-1'}"/>
            </div>
        </div>
        <div class="col-xs-3 form-group <c:out value="${sessionScope.errorNombre != null? 'text-danger' : ''}" />">
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre" class="form-control <c:out value="${sessionScope.errorNombre != null? 'has-error' : ''}" />" value="<c:out value="${sessionScope.rolDto != null? sessionScope.rolDto.nombre : ''}"/>"/>
        </div>
        <div class="col-xs-5 form-group <c:out value="${sessionScope.errorDescripcion != null? 'text-danger' : ''}" />">
            <label for="descripcion">Descripcion</label>
            <input type="text" id="descripcion" name="descripcion" class="form-control <c:out value="${sessionScope.errorDescripcion != null? 'has-error' : ''}" />" value="<c:out value="${sessionScope.rolDto != null? sessionScope.rolDto.descripcion : ''}"/>"/>
        </div>
        <div class="col-xs-3 form-group">
            <label></label>
            <div class="checkbox">
                <label><input type="checkbox" id="habilitado" name="habilitado" <c:out value="${sessionScope.rolDto != null and not sessionScope.rolDto.habilitado? '' : 'checked'}"/>/>Habilitado</label>
            </div>
        </div>
        <div class="col-xs-12">
          <button type="submit" id="submit" name="submit" class="btn btn-block btn-primary">
              Guardar &nbsp; <span class="glyphicon glyphicon-floppy-disk"></span>
          </button>
        </div>
    </form>
</div>
<div calss="row">
    <h3>Tabla de roles</h3>
    <c:choose>
        <c:when test="${requestScope.roles != null and not empty requestScope.roles}">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripci&oacute;n</th>
                        <th>Habilitado</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.roles}" var="r">
                        <tr>
                            <td><c:out value="${r.id}"/></td>
                            <td><c:out value="${r.nombre}"/></td>
                            <td><c:out value="${r.descripcion}"/></td>
                            <td><c:out value="${r.habilitado}"/></td>
                            <td class="text-center">
                                <form id="editar" action="<c:url value="rol" />" method="post">
                                    <input type="hidden" id="editarId" name="editarId" value="<c:out value="${r.id}"/>"/>
                                    <button type="submit" class="btn btn-sm btn-block btn-warning">
                                        Editar &nbsp; <span class="glyphicon glyphicon-edit"></span>
                                    </button>
                                </form>
                            </td>
                            <td class="text-center">
                                <form id="eliminar" action="<c:url value="rol" />" method="post">
                                    <input type="hidden" id="borrarId" name="borrarId" value="<c:out value="${r.id}"/>"/>
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

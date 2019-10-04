<%-- 
    Document   : Login
    Created on : 4 oct 2019, 16:50:51
    Author     : JAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asesorías :: Iniciar sesión</title>
    </head>
    <body>
        <div class="container">
            <div>
                <h4>Sistema de asesorías de cómputo de la DGENP</h4>
            </div>
            <div>
                <h2>Iniciar sesión</h2>
                <p>Para iniciar sesión ingresa tus credenciales.</p>
            </div>
            <div>
                <form name="login" action="/login" method="post">
                    <div class="row form-group">
                        <div class="col-xs-2">
                            <label>Nombre de usuario</label>
                        </div>
                        <div class="col-xs-10">
                            <input id="username" type="text" class="form-control"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-xs-2">
                            <label>Contraseña</label>
                        </div>
                        <div class="col-xs-10">
                            <input id="password" type="password" class="form-control"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <input id="recordar" type="checkbox" />
                        <label>Recordar usuario en este equipo</label>
                    </div>
                    <div class="row">
                        <input type="submit" value="Iniciar sesión" class="btn btn-block"/>
                    </div>
                </form>
                <div>
                    <a href="#">Olvidé mi contraseña</a>
                </div>
            </div>
            <p>
                <a href="http://validator.w3.org/check?uri=referer">
                    <img src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Strict" height="31" width="88" />
                </a>
            </p>
        </div>
    </body>
</html>

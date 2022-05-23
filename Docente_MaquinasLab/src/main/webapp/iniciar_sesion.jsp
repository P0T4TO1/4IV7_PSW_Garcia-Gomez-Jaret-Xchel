<%-- 
    Document   : iniciar_sesion
    Created on : 22/05/2022, 04:09:55 PM
    Author     : Jaret
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="images/logo-ipn.png"/>
        <title>Iniciar Sesion</title>
    </head>
    <body>
        <div class="inicio-container" >
            <form method="post" name="inicio" action="verificarUsuario" >
                <br>
                <h1>Inicio de Sesion</h1>        
                <br>
                <table border="1" >
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text" name="txtUsuario" ></td>
                    </tr>
                    <tr>
                        <td>Contraseña</td>
                        <td><input type="password" name="txtPassword" ></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Ingresar" ></td>
                        <td><input type="reset" value="Cancelar" ></td>
                    </tr>
                </table>
            </form>
        </div>
        <br>
        <a href="index.html">Regresar a la pagina principal</a>
    </body>
</html>

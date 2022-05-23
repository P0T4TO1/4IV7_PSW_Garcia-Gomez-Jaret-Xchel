<%-- 
    Document   : regsitro
    Created on : 22/05/2022, 11:35:35 AM
    Author     : Jaret
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="images/logo-ipn.png"/>
        <title>Registrar Docente</title>
    </head>
    <body>
        
            <form method="post" name="registro" action="guardarElemento">
                <label>Numero de Empleado</label>
                <br>
                <input type="number" name="num_empleado">
                <br>
                <label>Nombre</label>
                <br>
                <input type="text" name="nombre">
                <br>
                <label>Apellido Paterno</label>
                <br>
                <input type="text" name="appat">
                <br>
                <label>Apellido Materno</label>
                <br>
                <input type="text" name="apmat">
                <br>
                <label>Sexo</label>
                <br>
                <select name="sexo" >
                    <option>Masculino</option>
                    <option>Femenino</option>
                </select>
                <br>
                <label>Fecha de Nacimiento</label>
                <br>
                <input type="date" name="fecha_nac">
                <br>
                <label>Usuario</label>
                <br>
                <input type="text" name="usuario">
                <br>
                <label>Contraseña</label>
                <br>
                <input type="password" name="password">
                <br>
                <label>Grupo</label>
                <br>
                <select>
                    <option>1. 4IV7</option>
                    <option>2. 4IV8</option>
                    <option>3. 4IV9</option>
                    <option>4. 4IV10</option>
                    <option>5. Ninguno</option>
                </select>
                <input type='number' name='grupo'>
                <br>        
                <label>Seleccione un rol</label>
                <br>
                <select>
                    <option>1. Alumno</option>
                    <option>2. Docente</option>
                    <option>3. Tecnico</option>
                    <option>4. Administrador</option>
                </select>
                <input type='number' name='rol'>
                <br> 
                <input type="submit" value="Registrar nuevo Empleado">
                <input type="reset" value="Borrar">
            </form>
        
        <br>
        <a href="index.html">Regresar a la pagina principal</a>
    </body>
</html>

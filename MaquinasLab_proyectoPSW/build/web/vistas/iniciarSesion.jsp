<%-- 
    Document   : iniciarSesion
    Created on : 31/05/2022, 11:33:23 PM
    Author     : Jaret
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String usuario = "";
    //creamos una sesion para verificar que exista en la BD
    HttpSession sesionusu = request.getSession();
    if(sesionusu.getAttribute("usuario") == null){
        
%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Maquinas Batiz -Iniciar Sesión</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400|Roboto:300,400,700">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
    <link rel="icon" href="assets/img/ico.png">
</head>

<body>
    <div class="login-card bg-white"><img class="profile-img-card" src="../assets/img/icono.png">
        <p class="profile-name-card text- text-dark" style="font-family: sans-serif;">Iniciar Sesion</p>
        <form class="form-signin" method="post" name="inicio" action="../servletPersona?accion=verificarPersona">
            <div>
                <input class="form-control" type="text" placeholder="Usuario" name="txtUsuario"/>
            </div>
            <div>
                <input id="inputPassword" class="form-control" type="password" required placeholder="Contraseña" name="txtPassword"/>
                <span class="eye-password2" id="eye"><i class="fas fa-eye-slash"></i></span>
            </div>
            <button class="btn btn-primary btn-lg d-block btn-signin w-100" type="submit">Iniciar Sesion</button>
            <button class="btn btn-primary btn-lg d-block btn-signin w-100" type="reset">Borrar</button>
        </form>
        <div class="dropdown" style="display: flex; justify-content: center;">
            <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">No tienes una cuenta?, registrate aqui!</a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="registrarAlumno.jsp">Registrar Alumno</a>
                <a class="dropdown-item" href="registrarEmpleado.jsp">Registrar Empleado</a>
            </div>
        </div>
        <div class="text-center" id="regresar"><a class="small" href="../index.html">Regresar al inicio</a></div>
    </div>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/extra-scripts.js"></script>
    <script src="../js/validarForm.js"></script>
</body>

</html>
<%
    }else if(sesionusu.getAttribute("usuario")!= null){
        response.sendRedirect("inicioPersona.jsp");
    }
%>
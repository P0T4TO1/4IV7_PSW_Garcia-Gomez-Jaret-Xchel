<%-- 
    Document   : consultarReportes
    Created on : 2/06/2022, 03:26:51 PM
    Author     : Jaret
--%>

<%@page import="Modelo.MReporte"%>
<%@page import="Control.AccionesReportes"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String usuario = "", nombre;
    int rol = 0;
    //creamos una sesion para verificar que exista en la BD
    HttpSession sesionusu = request.getSession();
    
    if(session.getAttribute("usuario") != null){
    
    rol = (int)sesionusu.getAttribute("rol");
    request.setAttribute("getRol", rol);
    System.out.println(rol);
    }
%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Maquinas Batiz -Reportes</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400|Roboto:300,400,700">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="../assets/css/Manage-Users.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
    <link rel="icon" href="assets/img/ico.png">
</head>

<body>
    <%
        if(sesionusu.getAttribute("usuario") != null){
    %>
    <nav class="navbar navbar-dark navbar-expand-md bg-dark py-3" id="navbar-main">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="https://www.cecyt9.ipn.mx#" target="_blank">
                <span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon">
                    <img id="img-nav" src="../assets/img/icono.png">
                </span>
                <span>CECyT 9 "Juan de Dios B??tiz"</span>
            </a>
            <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
                <span class="visually-hidden">Toggle navigation</span>
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link active" href="inicioPersona.jsp">Inicio</a></li>
                </ul>
                <div class="dropdown">
                    <a class="dropdown-toggle text-light nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                        <span><i class="far fa-user"></i></span>
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="perfilPersona.jsp?id=<%=sesionusu.getAttribute("id")%>">Perfil</a>
                        <a class="dropdown-item" href="../servletPersona?accion=cerrar">Cerrar Sesi??n</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div class="container-fluid reportes">
        <h3 class="text-dark mb-4" style="text-align: center;">Reportes</h3>
        <div class="card shadow card-reportes">
            <div class="card-header py-3">
                <p class="text-primary m-0 fw-bold">Reportes</p>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <div class="text-md-end dataTables_filter" id="dataTable_filter">
                            <label class="form-label">
                                <input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Buscar">
                            </label>
                        </div>
                    </div>
                </div>
                <div class="table-responsive table mt-2" id="dataTable-1" role="grid" aria-describedby="dataTable_info">
                    <table class="table my-0" id="dataTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Etiqueta</th>
                                <th>Usuario que levanto el reporte</th>
                                <th>Prioridad</th>
                                <th>Estado</th>
                                <th>Cantidad de reportes</th>
                                <th>Asignatura</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Consultar equipo</th>
                            <%if(rol == 4){                               
                            %>
                                <th>Editar Reporte</th>
                                <th>Eliminar Reporte</th>
                            </tr>
                        </thead>
                        <%
                            }
                            List<MReporte> lista = AccionesReportes.getAllReportes();
                            for(MReporte r : lista){
                        %>
                        <tbody>
                            <tr>
                                <td><%=r.getReporte_id()%></td>
                                <td><%=r.getEtiqueta_nombre()%></td>
                                <td><%=r.getPersonareporte_user()%></td>
                                <td><%=r.getPrioridad_tipo()%></td>
                                <td><%=r.getEstadoreporte_tipo()%></td>
                                <td><%=r.getCantidadreportes_id()%></td>
                                <td><%=r.getAsignatura_nombre()%></td>
                                <td><%=r.getFechareporte()%></td>
                                <td><%=r.getHorareporte()%></td>
                                <td>
                                    <a href="#"><button class="btn btn-primary btn-reportes" type="button">Consultar</button>
                                    </a>
                                </td>
                                <%
                                if(rol == 4){    
                                %>
                                <td>
                                    <a href="#">
                                        <button class="btn btn-primary btn-reportes" type="button">
                                            <span><i class="far fa-edit"></i></span>
                                        </button>
                                    </a>
                                </td>
                                <td><a href="#">
                                        <button class="btn btn-primary btn-reportes" type="button">
                                            <span><i class="far fa-trash-alt"></i></span>
                                        </button>
                                    </a>
                                </td>
                                <%}%>
                            </tr>
                        </tbody>
                        <%}%>
                        <tfoot>
                            <tr>
                                <td><strong>ID</strong></td>
                                <td><strong>Etiqueta</strong></td>
                                <td><strong>Usuario que levanto el reporte</strong></td>
                                <td><strong>Prioridad</strong></td>
                                <td><strong>Estado</strong></td>
                                <td><strong>Cantidad de reporte</strong></td>
                                <td><strong>Asignatura</strong></td>
                                <td><strong>Fecha</strong></td>
                                <td><strong>Hora</strong></td>
                                <td><strong>Consultar equipo</strong></td>
                                <%
                                if(rol == 4){    
                                %>
                                <td><strong>Editar Reporte</strong></td>
                                <td><strong>Eliminar Reporte</strong></td>
                                <%}%>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%
        if(rol == 1 || rol == 2){
    %>
    <section class="py-4 py-xl-5">
        <div class="container h-100">
            <div class="row h-100">
                <div class="col-md-10 col-xl-8 text-center d-flex d-sm-flex d-md-flex justify-content-center align-items-center mx-auto justify-content-md-start align-items-md-center justify-content-xl-center">
                    <div>
                        <p class="mb-4">Si usted necesita crear un reporte para un equipo de alg??n laboratorio de click en el bot??n de abajo</p><button class="btn btn-primary fs-5 me-2 py-2 px-4 btn-reportes" type="button" style="font-size: 16px !important;">Crear un reporte aqui!</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="py-4 py-xl-5">
        <div class="container h-100">
            <div class="row h-100">
                <div class="col-md-10 col-xl-8 text-center d-flex d-sm-flex
                     d-md-flex justify-content-center align-items-center mx-auto 
                     justify-content-md-start align-items-md-center justify-content-xl-center">
                    <div>
                        <p class="mb-4" style="font-size: 18px;">Estas viendo todos los reportes que 
                            se han guardado. Si quieres ver, editar o eliminar solo tus reportes da 
                            click en el bot??n de abajo</p>
                        <a href="misReportes.jsp?id=<%=sesionusu.getAttribute("id")%>">
                            <button class="btn btn-primary fs-5 me-2 py-2 px-4 btn-reportes" type="button" style="
                                    font-size: 16px !important;">Consultar mis reportes</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%
        }
            }else if(sesionusu.getAttribute("usuario") == null){          
    %>
    <nav class="navbar navbar-dark navbar-expand-md bg-dark py-3" id="navbar-main">
        <div class="container"><a class="navbar-brand d-flex align-items-center" href="https://www.cecyt9.ipn.mx#" target="_blank">
                <span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon">
                    <img id="img-nav" src="../assets/img/icono.png"></span><span id="spans">CECyT 9 "Juan de Dios B??tiz"</span></a>
                    <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
                        <span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span>
                    </button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link active" href="../index.html">Inicio</a></li>
                </ul>
                <a class="nav-link text-light" href="iniciarSesion.jsp">Iniciar Sesion</a>
                <div class="dropdown"><a class="dropdown-toggle text-light nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">Registrarse</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="registrarAlumno.jsp">Registrar Alumno</a>
                        <a class="dropdown-item" href="registrarEmpleado.jsp">Registrar Empleado</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div class="container-fluid reportes">
        <h3 class="text-dark mb-4" style="text-align: center;">Reportes</h3>
        <div class="card shadow card-reportes">
            <div class="card-header py-3">
                <p class="text-primary m-0 fw-bold">Reportes</p>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <div class="text-md-end dataTables_filter" id="dataTable_filter">
                            <label class="form-label">
                                <input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Buscar">
                            </label>
                        </div>
                    </div>
                </div>
                <div class="table-responsive table mt-2" id="dataTable-1" role="grid" aria-describedby="dataTable_info">
                    <table class="table my-0" id="dataTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Etiqueta</th>
                                <th>Usuario que levanto el reporte</th>
                                <th>Prioridad</th>
                                <th>Estado</th>
                                <th>Cantidad de reportes</th>
                                <th>Asignatura</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Consultar equipo</th>
                            </tr>
                        </thead>
                        <%
                            List<MReporte> lista = AccionesReportes.getAllReportes();
                            for(MReporte r : lista){
                        %>
                        <tbody>
                            <tr>
                                <td><%=r.getReporte_id()%></td>
                                <td><%=r.getEtiqueta_nombre()%></td>
                                <td><%=r.getPersonareporte_user()%></td>
                                <td><%=r.getPrioridad_tipo()%></td>
                                <td><%=r.getEstadoreporte_tipo()%></td>
                                <td><%=r.getCantidadreportes_id()%></td>
                                <td><%=r.getAsignatura_nombre()%></td>
                                <td><%=r.getFechareporte()%></td>
                                <td><%=r.getHorareporte()%></td>
                                <td>
                                    <a href="#"><button class="btn btn-primary btn-reportes" type="button">Consultar</button>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                        <%}%>
                        <tfoot>
                            <tr>
                                <td><strong>ID</strong></td>
                                <td><strong>Etiqueta</strong></td>
                                <td><strong>Usuario que levanto el reporte</strong></td>
                                <td><strong>Prioridad</strong></td>
                                <td><strong>Estado</strong></td>
                                <td><strong>Cantidad de reporte</strong></td>
                                <td><strong>Asignatura</strong></td>
                                <td><strong>Fecha</strong></td>
                                <td><strong>Hora</strong></td>
                                <td><strong>Consultar equipo</strong></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
    <footer style="margin-top: 11rem">
        <div class="row">
            <div class="col-sm-6 col-md-4 footer-navigation">
                <h3><a href="#"><img id="img-nav" src="../assets/img/icono.png"></a></h3><p class="links">
                    <a href="#">Incio</a><strong> ?? </strong><a href="#">Consultar reportes</a></p>
                <p class="company-name">Reportes Maquinas CECyT 9 ?? 2022</p>
            </div>
            <div class="col-md-4 footer-about">
                <h4><br>Garcia Gomez Jaret Xchel y Gomez Herrera Axel<br><br></h4>
                <p>4IV7<br>Programaci??n de Servicios Web<br></p>
                <div class="social-links social-icons">
                    <a href="https://github.com/P0T4TO1/4IV7_PSW_Garcia-Gomez-Jaret-Xchel.git" target="_blank"">
                        <i class="fa fa-github"></i>
                    </a>
                </div>
            </div>
        </div>
    </footer>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>

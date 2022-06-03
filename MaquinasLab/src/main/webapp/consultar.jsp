<%-- 
    Document   : consultar
    Created on : 22/05/2022, 02:11:39 PM
    Author     : Jaret
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="mvc.Modelo.Persona"%>
<%@page import="mvc.Controlador.AccionesPersona"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Perfil</title>
        <link rel='stylesheet' href='css/style.css'> 
        <link rel="shortcut icon" type="image/x-icon" href="images/logo-ipn.png"/>
    </head>
    <body>
        <div class="consulta-conatiner" align='center' style='padding-top: 2rem;'>
            <table border="1">
                <thead>
                    <tr>
                      <th>ID</th>
                      <th>Numero de empleado</th>
                      <th>Nombre</th>
                      <th>Apellido Paterno</th>
                      <th>Apellido Materno</th>
                      <th>Sexo</th>
                      <th>Fecha de naciemiento</th>
                      <th>Usuario</th>
                      <th>Contraseña</th>
                      <th>Grupo</th>
                      <th>Rol</th>
                      <th>Privilegio</th>
                      <th>Editar</th>
                      <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%     
                        List<Persona> lista = AccionesPersona.getConsultaDocente();
                        
                        for(Persona p: lista){
                    %>
                    <tr>
                      <td><%=p.getPersona_id()%></td>
                      <td><%=p.getEmpleado_num()%></td>
                      <td><%=p.getPersona_nombre()%></td>
                      <td><%=p.getPersona_appat()%></td>
                      <td><%=p.getPersona_apmat()%></td>
                      <td><%=p.getPersona_sexo()%></td>
                      <td><%=p.getPersona_fechaNacimiento()%></td>
                      <td><%=p.getPersona_user()%></td>
                      <td><%=p.getPersona_password()%></td>
                      <td><%=p.getGrupo_id()%></td>
                      <td><%=p.getRol_id()%></td>
                      <td><%=p.getPrivilegio_id()%></td>
                      <td><a href="editarDocente.jsp?id=<%=p.getPersona_id()%>" >Editar</a></td>
                      <td><a href="eliminarElemento?id=<%=p.getPersona_id()%>" >Eliminar</a></td>
                    </tr>
                    <%
                        }
                    %>                  
                </tbody>
          </table>
        </div>
        <br>
        <a href="inicio.jsp">Regresar a la pagina principal</a>
    </body>
</html>

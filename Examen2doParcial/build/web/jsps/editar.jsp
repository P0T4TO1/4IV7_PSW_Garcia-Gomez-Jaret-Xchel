<%-- 
    Document   : editarperfil
    Created on : 23/04/2022, 09:26:28 PM
    Author     : Jaret
--%>

<%@page contentType="text/html" language="java"
        import="java.sql.*, java.util.*, java.text.*" 
        pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="editar" action="actualizaralumno.jsp" method="post" >
            

        
        <% 
        //esa codigo java
        Connection con = null;
        Statement set = null;
        ResultSet rs = null;
        
        String userName, URL, password, driver;
        
        URL = "jdbc:sqlserver://localhost:8080;"
                + "database=docente";
        
        userName = "sa";
        password = "Jxgg227430Jxgg.";
        driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(URL, userName, password);
            
            try{
                int id = Integer.parseInt(request.getParameter("id"));
                //necesitamos los parametros
                String q = "select * from docente where docentereal  ="+id;
                
                set = con.createStatement();
                
                rs = set.executeQuery(q);
                
                while(rs.next()){
                
                %>
                
                <label>Número de empleado</label>
                <br>
                <input type="hidden" name="numEmpleado2" 
                       value="<%=rs.getInt("num_empleado")%>" >
                <br>
                <label>Nombre</label>
                <br>
                <input type="text" name="nombre2" 
                       value="<%=rs.getString("nombre")%>" >
                <br>
                <label>Apellido Paterno</label>
                <br>
                <input type="text" name="appat2" 
                       value="<%=rs.getString("appat")%>" >
                <br>
                <label>Apellido Materno</label>
                <br>
                <input type="text" name="apmat2" 
                       value="<%=rs.getString("apmat")%>" >
                <br>
                <label>Sexo</label>
                <br>
                <input type="text" name="sexo2" 
                       value="<%=rs.getString("sexo")%>" >
                <br>
                <label>Fecha de nacimiento</label>
                <br>
                <input type="text" name="nacimeinto2" 
                       value="<%=rs.getString("fechanacimiento")%>" >
                <br>                
                <input type="submit" value="Actualizar Datos" >
                <br>
                <input type="reset" value="Borrar Datos" >
                
                
                <%
                    }
            }catch(SQLException es){
                System.out.println("Error al actualizar en la tabla");
                System.out.println(es.getMessage());
                %>
                
                 <h1>Error al consultar la tabla de la tabla</h1>
                 
                <%
                
            }
        }catch(Exception e){
        System.out.println("Error al conectar BD");
        System.out.println(e.getMessage());
        %>
        
        <h1>No conected T_T</h1
        
        <%
        
        }
        
        
        
        
        
        %>
        
        </form>
        <br>
        <a href="../index.html" >Regresar a Principal</a>
    </body>
</html>

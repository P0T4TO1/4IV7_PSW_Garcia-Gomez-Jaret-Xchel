<%-- 
    Document   : mouse
    Created on : 23/04/2022, 10:18:15 PM
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
                //necesitamos los parametros
                String id, descrip;
                
                id = request.getParameter("num");
                descrip = request.getParameter("des");
                
                
                set = con.createStatement();
                
                String q = "insert into mmouse "
                        + "values ("+id+", '"+descrip+"')";
                
                int registro = set.executeUpdate(q);
                
                %>
                 <h1>Gracias</h1>
                <%
            
            }catch(SQLException es){
                System.out.println("Error al registrar en la tabla");
                System.out.println(es.getMessage());
                %>
                 <h1>Error en el registro de la tabla</h1>
                <%
                
            }
        }catch(Exception e){
        System.out.println("Error al conectar BD");
        System.out.println(e.getMessage());
        %>
        <h1>No conected T_T</h1>
        <%
        
        }
        
        
        
        
        
        %>
        
        <br>
        <a href="index.html" >Regresar a Principal</a>
    </body>
</html>

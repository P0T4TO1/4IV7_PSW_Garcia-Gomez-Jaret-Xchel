/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc.Controlador;


/**
 *
 * @author Alumno
 */
import java.sql.*;

public class Conexion {
    
    public static Connection getConnection(){
 
        Connection con = null;
        
        String URL = "jdbc:mysql://localhost/empresa";
        
        String username = "root";
        /*String password = "n0m3l0";*/
        String password = "227430Jxgg.";
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            
            con = DriverManager.getConnection(URL, username, password);
            
            System.out.println("Se conecto a la BD");
            
        }catch(Exception e){
            
            System.out.println("No se conecto a la BD");
            System.out.println(e.getMessage());
        }
        return con;
    }
}

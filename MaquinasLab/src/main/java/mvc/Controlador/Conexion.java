/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mvc.Controlador;

import java.sql.*;
/**
 *
 * @author Jaret
 */
public class Conexion {
    
    public static Connection getConection(){
        String url, username, password;
        
        url = "jdbc:mysql://localhost/maquinasbatiz";
        username = "root";
        password = "227430Jxgg.";
        /*password = "n0m3l0";*/
        
        Connection con = null;
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Se conecto con la BD");
        }catch(Exception e){
            System.out.println("No se conecto con la bd");
            System.out.println(e.getMessage());
        
        }
        return con;
    }
}

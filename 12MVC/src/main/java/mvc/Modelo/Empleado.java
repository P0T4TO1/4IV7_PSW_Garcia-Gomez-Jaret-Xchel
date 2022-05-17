/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc.Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import mvc.Controlador.Conexion;

/**
 *
 * @author Alumno
 */
public class Empleado {
    
    private int id;
    private String nombre, password, email, pais;

    public Empleado() {
        
    }
      
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
    
    
    public Empleado verificarUsuario(String user, String pass) throws ClassNotFoundException{
        Empleado e = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConnection();
            String q = "select * from empleado where nombre = ? AND password = ?";
            ps = con.prepareStatement(q);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while(rs.next()){
                e = new Empleado();
                e.setId(rs.getInt("id"));
                e.setNombre(rs.getString("nombre"));
                e.setPassword(rs.getString("password"));
                e.setEmail(rs.getString("email"));
                e.setPais(rs.getString("pais"));
                break;
            }
        
        }catch(SQLException sq){
            System.out.println("Error al verificar al usuario");
            System.out.println(sq.getMessage());
            e = null;
        }finally{
            try{
                rs.close();
                ps.close();
                con.close();
            
            }catch(Exception ex){
                System.out.println("No encontro la clase");
                System.out.println(ex.getMessage());
            }
        }
        return e;
    }
    
}

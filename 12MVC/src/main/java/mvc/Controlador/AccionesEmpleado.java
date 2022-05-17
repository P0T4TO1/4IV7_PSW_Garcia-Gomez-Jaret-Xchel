/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc.Controlador;

/**
 *
 * @author Alumno
 * CRUD
 */

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import mvc.Modelo.Empleado;

public class AccionesEmpleado {
    
    //registro
    public static int registrarEmpleado(Empleado e){
        int estatus = 0;
        try{
            //coneccion
            Connection con = Conexion.getConnection();
            String q = "insert into empleado(nombre, password, email, pais)"
                    + "values(?, ?, ?, ?)";
            
            //formato a la query con PreparedStatement
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getPassword());
            ps.setString(3, e.getEmail());
            ps.setString(4, e.getPais());
            
            //se ejecuta
            
            estatus = ps.executeUpdate();
            
            con.close();
            
            System.out.println("Registro existoso del empleado");
            
        }catch(Exception ex){
            System.out.println("Error al registrar empleado");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    //Consultar toda la lista de empleados
    
    public static List<Empleado> getAllEmpleados(){
        //arry de objetos de empleado
        List<Empleado> lista = new ArrayList<Empleado>();
        
        try{
            Connection con = Conexion.getConnection();
            
            String q = "select * from empleado";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //necesito el objeto del empleado
                //cada fila es un objeto del registro
                Empleado e = new Empleado();
                
                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setPassword(rs.getString(3));
                e.setEmail(rs.getString(4));
                e.setPais(rs.getString(5));
                
                lista.add(e);
            }
            System.out.println("Se encontro el empleado");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al consultar empleado");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    
    //Buscar por id empleado
    
    public static Empleado buscarEmpleadoporID(int id){
        Empleado e = new Empleado();
        
        try{
            Connection con = Conexion.getConnection();
            
            String q = "select * from empleado where id = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                //necesito el objeto del empleado
                //cada fila es un objeto del registro
                
                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setPassword(rs.getString(3));
                e.setEmail(rs.getString(4));
                e.setPais(rs.getString(5));
                
            }
            System.out.println("Se encontro el empleado");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al consultar empleado");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    //eliminar por id de mepleado
    
    public static int eliminarEmpleado(int id){
        int estado = 0;
        
        try{
            Connection con = Conexion.getConnection();
            
            String q = "delete from empleado where id = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            
            estado = ps.executeUpdate();
            
            
            System.out.println("Se elimino el empleado");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al eliminar empleado");
            System.out.println(ex.getMessage());
        }
        return estado;
    }
    
    
    //actualizar empleado
    
    public static int actualizarEmpleado(Empleado e){
        int estado = 0;
        
        try{
            Connection con = Conexion.getConnection();
            
            String q = "update empleado set nombre = ?, "
                    + "password = ?, email = ?, pais = ? "
                    + "where id = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getPassword());
            ps.setString(3, e.getEmail());
            ps.setString(4, e.getPais());
            ps.setInt(5, e.getId());           
            
            estado = ps.executeUpdate();
            
            System.out.println("Se actualizo el empleado");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al actualizar empleado");
            System.out.println(ex.getMessage());
        }
        return estado;
    }
        
}

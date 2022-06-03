/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mvc.Controlador;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import mvc.Modelo.Persona;

/**
 *
 * @author Jaret
 */
public class AccionesPersona {
    
    public static int registrarDocente(Persona p){
        int estatus = 0;
        
        try{
            Connection con = Conexion.getConection();
            String q = "insert into persona(empleado_num, persona_nombre, persona_appat, "
                    + "persona_apmat, persona_sexo, persona_fechanacimiento, "
                    + "persona_user, persona_pass, grupo_id, rol_id, privilegio_id)"
                    + " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            //ahora debo de preparar la sentencia 
            
            PreparedStatement ps = con.prepareStatement(q);
            
            //objeto del empleado
            
            ps.setInt(1, p.getEmpleado_num());
            ps.setString(2, p.getPersona_nombre());
            ps.setString(3, p.getPersona_appat());
            ps.setString(4, p.getPersona_apmat());
            ps.setString(5, p.getPersona_sexo());
            ps.setString(6, p.getPersona_fechaNacimiento());
            ps.setString(7, p.getPersona_user());
            ps.setString(8, p.getPersona_password());
            ps.setInt(9, p.getGrupo_id());
            ps.setInt(10, p.getRol_id());
            ps.setInt(11, p.getPrivilegio_id());
            
            //ejecutar la querry
            estatus = ps.executeUpdate();
            
            System.out.println("Registro Exitoso");
            con.close();
            
        }catch(Exception e){
            System.out.println("Error al registrar usuario");
            System.out.println(e.getMessage());
        }
        return estatus; 
    }
    
    
    public static int eliminarDocenteID(int id){
        int estatus = 0;
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "delete from persona where persona_id =?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            
            estatus = ps.executeUpdate();
            
            System.out.println("Se elimino al Docente");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al eliminar el empleado");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    
    public static int ActualizarDocente(Persona p){
        int estatus = 0;
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "update persona set empleado_num = ?, "
                    + "persona_nombre = ?, persona_appat = ?, persona_apmat = ?,"
                    + "persona_sexo = ?, persona_fechanacimiento = ?,"
                    + "persona_user = ?, persona_pass = ?"
                    + "where id = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, p.getEmpleado_num());
            ps.setString(2, p.getPersona_nombre());
            ps.setString(3, p.getPersona_appat());
            ps.setString(4, p.getPersona_apmat());
            ps.setString(5, p.getPersona_sexo());
            ps.setString(6, p.getPersona_fechaNacimiento());
            ps.setString(7, p.getPersona_user());
            ps.setString(8, p.getPersona_password());
            ps.setInt(9, p.getPersona_id());
            
            estatus = ps.executeUpdate();
            
            System.out.println("Se actualizo al empleado");
            con.close();
            
        }catch(Exception e){
            System.out.println("Error al actualizar docente");
            System.out.println(e.getMessage());
        }
        return estatus;
    }
    
    
    public static List<Persona> getConsultaDocente(){
        //primero necesito un array de objetos de empleado
        List<Persona> lista = new ArrayList<Persona>();
        
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "select persona_id, empleado_num, persona_nombre, persona_appat, persona_apmat,"
                      +  "persona_sexo, persona_fechanacimiento, persona_user, persona_pass, gru.grupo_tipo, "
                      +  "ro.rol_tipo, pri.privilegio_tipo from persona as per"
                      +  "inner join privilegio as pri on per.privilegio_id = pri.privilegio_id"
                      +  "inner join grupo as gru on per.grupo_id = gru.grupo_id"
                      +  "inner join rol as ro on per.rol_id = ro.rol_id"
                      +  "where persona_id = 1";
            
            PreparedStatement ps = con.prepareStatement(q);   
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //necesito el objeto del empleado
                //cada fila es un objeto del registro
                Persona p = new Persona();
                //getter y setter
                p.setPersona_id(rs.getInt(1));
                p.setEmpleado_num(rs.getInt(2));
                p.setPersona_nombre(rs.getString(3));
                p.setPersona_appat(rs.getString(4));
                p.setPersona_apmat(rs.getString(5));
                p.setPersona_sexo(rs.getString(6));
                p.setPersona_fechaNacimiento(rs.getString(7));
                p.setPersona_user(rs.getString(8));
                p.setPersona_password(rs.getString(9));
                p.setGrupo_id(rs.getInt(10));
                p.setRol_id(rs.getInt(11));
                p.setPrivilegio_id(rs.getInt(12));
                //los agrego a mi lista
                lista.add(p);
            }
            System.out.println("Se encontro al docente");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al consultar el docente");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Control;

import Modelo.MEquipo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jaret
 */
public class AccionesEquipo {
    
    public static int registrarEquipo(MEquipo e){
        int estatus = 0;
        
        try{
            Connection con = Conexion.getConection();
            String q = "insert into equipo(equipo_etiqueta, lab_id, marca_id, cpu_serial, "
                    + "accesorio_id, monitor_id, config_id, estadoreporte_id, problema)"
                    + "values (? , ? , ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getEquipo_etiqueta());
            ps.setInt(2, e.getLab_id());
            ps.setInt(3, e.getMarca_id());
            ps.setString(4, e.getCpu_serial());
            ps.setInt(5, e.getAccesorio_id());
            ps.setString(6, e.getMonitor_id());
            ps.setString(7, e.getConfig_id());
            ps.setInt(8, e.getEstadoreporte_id());
            ps.setString(9, e.getProblema());
            
            estatus = ps.executeUpdate();
            
            System.out.println("Regsitroso exitoso");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("Error al registrar usuario");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    
    public static List<MEquipo> getAllEquipos(){
        List <MEquipo> lista = new ArrayList<MEquipo>();
        
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "select equipo_etiqueta, lab.lab_nom, mar.marca_nom, cpu_serial," +
                        "ac.config_descripcionTeclado, ac.config_descripcionMouse, mo.monitor_descripcion," +
                        "co.config_descripcion, esr.estadoreporte_tipo, problema from equipo as eq" +
                        "inner join laboratorio as lab on eq.lab_id = lab.lab_id" +
                        "inner join marca as mar on eq.marca_id = mar.marca_id" +
                        "inner join accesorio as ac on eq.accesorio_id = ac.accesorio_id" +
                        "inner join monitor as mo on eq.monitor_id = mo.monitor_id" +
                        "inner join configuracion as co on eq.config_id = co.config_id" +
                        "inner join estadoreporte as esr on eq.estadoreporte_id = esr.estadoreporte_id";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //necesito el objeto del empleado
                //cada fila es un objeto del registro
                MEquipo e = new MEquipo();
                //getter y setter
                e.setEquipo_etiqueta(rs.getString(1));
                e.setLab_nom(rs.getString(2));
                e.setMarca_nom(rs.getString(3));
                e.setCpu_serial(rs.getString(4));
                e.setConfig_teclado(rs.getString(5));
                e.setConfig_mouse(rs.getString(6));
                e.setMonitor_descripcion(rs.getString(7));
                e.setConfig_descripcion(rs.getString(8));                
                e.setEstadoreporte_tipo(rs.getString(9));
                e.setProblema(rs.getString(10));
                //los agrego a mi lista
                lista.add(e);
            }
            
        }catch(Exception ex){
            System.out.println("Error al consultar el empleado");
            System.out.println(ex.getMessage());
        }       
        return lista;       
    } 
    
    
    public static MEquipo buscarEquipoporID(String etiqueta){
            //necesito el objeto del empleado
            //cada fila es un objeto del registro
            MEquipo e = new MEquipo();
        
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "select equipo_etiqueta, lab.lab_nom, mar.marca_nom, cpu_serial, " 
                     +   "ac.config_descripcionTeclado, ac.config_descripcionMause, mo.monitor_descripcion, " 
                     +   "co.config_descripcion, esr.estadoreporte_tipo, problema from equipo as eq " 
                     +   "inner join laboratorio as lab on eq.lab_id = lab.lab_id " 
                     +   "inner join marca as mar on eq.marca_id = mar.marca_id " 
                     +   "inner join accesorio as ac on eq.accesorio_id = ac.accesorio_id " 
                     +   "inner join monitor as mo on eq.monitor_id = mo.monitor_id " 
                     +   "inner join configuracion as co on eq.config_id = co.config_id " 
                     +   "inner join estadoreporte as esr on eq.estadoreporte_id = esr.estadoreporte_id " 
                     +   "where equipo_etiqueta = ? ";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, etiqueta);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                //getter y setter
                e.setEquipo_etiqueta(rs.getString(1));
                e.setLab_nom(rs.getString(2));
                e.setMarca_nom(rs.getString(3));
                e.setCpu_serial(rs.getString(4));
                e.setConfig_teclado(rs.getString(5));
                e.setConfig_mouse(rs.getString(6));
                e.setMonitor_descripcion(rs.getString(7));
                e.setConfig_descripcion(rs.getString(8));
                e.setEstadoreporte_tipo(rs.getString(9));
                e.setProblema(rs.getString(10));               
                //los agrego a mi lista               
            }
            System.out.println("Se encontro el equipo");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al consultar equipo");
            System.out.println(ex.getMessage());
        }
        return e;       
    }
    
    public static MEquipo buscarEquipoporPersona_id(int persona_id){
            //necesito el objeto del empleado
            //cada fila es un objeto del registro
            MEquipo e = new MEquipo();
        
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "select equipo_etiqueta, lab.lab_nom, mar.marca_nom, cpu_serial, " 
                     +   "ac.config_descripcionTeclado, ac.config_descripcionMause, mo.monitor_descripcion, " 
                     +   "co.config_descripcion, esr.estadoreporte_tipo, problema from equipo as eq " 
                     +   "inner join laboratorio as lab on eq.lab_id = lab.lab_id " 
                     +   "inner join marca as mar on eq.marca_id = mar.marca_id " 
                     +   "inner join accesorio as ac on eq.accesorio_id = ac.accesorio_id " 
                     +   "inner join monitor as mo on eq.monitor_id = mo.monitor_id " 
                     +   "inner join configuracion as co on eq.config_id = co.config_id " 
                     +   "inner join estadoreporte as esr on eq.estadoreporte_id = esr.estadoreporte_id " 
                     +   "where reporteper_id = ? ";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, persona_id);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                //getter y setter
                e.setEquipo_etiqueta(rs.getString(1));
                e.setLab_nom(rs.getString(2));
                e.setMarca_nom(rs.getString(3));
                e.setCpu_serial(rs.getString(4));
                e.setConfig_teclado(rs.getString(5));
                e.setConfig_mouse(rs.getString(6));
                e.setMonitor_descripcion(rs.getString(7));
                e.setConfig_descripcion(rs.getString(8));
                e.setEstadoreporte_tipo(rs.getString(9));
                e.setProblema(rs.getString(10));               
                //los agrego a mi lista               
            }
            System.out.println("Se encontro el equipo");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al consultar equipo");
            System.out.println(ex.getMessage());
        }
        return e;       
    }
}

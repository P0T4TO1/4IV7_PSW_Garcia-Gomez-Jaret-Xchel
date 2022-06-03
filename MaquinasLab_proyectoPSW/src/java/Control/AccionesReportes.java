/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Control;

import Modelo.MReporte;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jaret
 */
public class AccionesReportes {
    
    public static int registrarReporte(MReporte r){
        int estatus = 0;
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "insert into reporte (equiposrepor_id, reporteper_id, prioridad_id, estadoreporte_id, " 
                      +  "maestrareporte_id, asigantura_id, fecha, hora) " 
                      +  "values (?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, r.getEtiqueta_id());
            ps.setInt(2, r.getPersonareporte_id());
            ps.setInt(3, r.getPrioridad_id());
            ps.setInt(4, r.getEstadoreporte_id());
            ps.setInt(5, r.getCantidadreportes_id());
            ps.setInt(6, r.getAsignaturareporte_id());
            ps.setString(7, r.getFechareporte());
            ps.setString(8, r.getHorareporte());
            
            estatus = ps.executeUpdate();
            
            System.out.println("Registro de reporte exitoso");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar reporte");
            System.out.println(ex.getMessage());
        }       
        return estatus;       
    }
    
    public static List<MReporte> getAllReportes(){
        List<MReporte> lista = new ArrayList<MReporte>();
        
        try{
            Connection con = Conexion.getConection();
            
            String q = "select detallereporte_id, er.equipo_etiqueta, per.persona_user, pr.prioridad_tipo, " 
                       + "ere.estadoreporte_tipo, mr.maestrareporte_cantidadrepeticiones, asi.asignatura_nombre, fecha, hora " 
                       + "from reporte as rep " 
                       + "inner join equiposreportados as er on er.equiposrepor_id = rep.equiposrepor_id " 
                       + "inner join reportespersona as rp on rep.reporteper_id = rp.reporteper_id " 
                       + "inner join persona as per on rp.persona_id = per.persona_id " 
                       + "inner join prioridad as pr on rep.prioridad_id = pr.prioridad_id " 
                       + "inner join estadoreporte as ere on rep.estadoreporte_id = ere.estadoreporte_id " 
                       + "inner join maestrareporte as mr on rep.maestrareporte_id = mr.maestrareporte_id " 
                       + "inner join asignatura as asi on rep.asignatura_id = asi.asignatura_id ";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                MReporte r = new MReporte();
                
                r.setReporte_id(rs.getInt(1));
                r.setEtiqueta_nombre(rs.getString(2));
                r.setPersonareporte_user(rs.getString(3));
                r.setPrioridad_tipo(rs.getString(4));
                r.setEstadoreporte_tipo(rs.getString(5));
                r.setCantidadreportes_id(rs.getInt(6));
                r.setAsignatura_nombre(rs.getString(7));
                r.setFechareporte(rs.getString(8));
                r.setHorareporte(rs.getString(9));
                
                lista.add(r);
            }
            System.out.println("Se encontraron los reportes");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al consultar todos los reportes");
            System.out.println(ex.getMessage());
        }
        
        return lista;        
    }
    
    
    public static List<MReporte> getReportesporIDPersona(int idPersona){
        List<MReporte> lista = new ArrayList<MReporte>();
               
        try{
            Connection con = Conexion.getConection();
            
            String q = "select detallereporte_id, er.equipo_etiqueta, per.persona_user, pr.prioridad_tipo, " +
                            "ere.estadoreporte_tipo, mr.maestrareporte_cantidadrepeticiones, asi.asignatura_nombre, fecha, hora " +
                            "from reporte as rep " +
                            "inner join equiposreportados as er on er.equiposrepor_id = rep.equiposrepor_id " +
                            "inner join reportespersona as rp on rep.reporteper_id = rp.reporteper_id " +
                            "inner join persona as per on rp.persona_id = per.persona_id " +
                            "inner join prioridad as pr on rep.prioridad_id = pr.prioridad_id " +
                            "inner join estadoreporte as ere on rep.estadoreporte_id = ere.estadoreporte_id " +
                            "inner join maestrareporte as mr on rep.maestrareporte_id = mr.maestrareporte_id " +
                            "inner join asignatura as asi on rep.asignatura_id = asi.asignatura_id " +
                            "where rep.reporteper_id = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, idPersona);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                MReporte r = new MReporte();
                
                r.setReporte_id(rs.getInt(1));
                r.setEtiqueta_nombre(rs.getString(2));
                r.setPersonareporte_user(rs.getString(3));
                r.setPrioridad_tipo(rs.getString(4));
                r.setEstadoreporte_tipo(rs.getString(5));
                r.setCantidadreportes_id(rs.getInt(6));
                r.setAsignatura_nombre(rs.getString(7));
                r.setFechareporte(rs.getString(8));
                r.setHorareporte(rs.getString(9));
                
                lista.add(r);
            }
            System.out.println("Se encontraron los reportes");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al obtener reportes");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
}


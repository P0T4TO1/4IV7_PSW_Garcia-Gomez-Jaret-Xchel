/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mvc.Modelo;

/**
 *
 * @author Jaret
 */
public class Reporte {
    
    private int equiposreportados, estado, persona, prio, maestra, asignatura;
    private String fecha, hora;

    public Reporte() {
        
    }

    public int getEquiposreportados() {
        return equiposreportados;
    }

    public void setEquiposreportados(int equiposreportados) {
        this.equiposreportados = equiposreportados;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getPersona() {
        return persona;
    }

    public void setPersona(int persona) {
        this.persona = persona;
    }

    public int getPrio() {
        return prio;
    }

    public void setPrio(int prio) {
        this.prio = prio;
    }

    public int getMaestra() {
        return maestra;
    }

    public void setMaestra(int maestra) {
        this.maestra = maestra;
    }

    public int getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(int asignatura) {
        this.asignatura = asignatura;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    
    
}

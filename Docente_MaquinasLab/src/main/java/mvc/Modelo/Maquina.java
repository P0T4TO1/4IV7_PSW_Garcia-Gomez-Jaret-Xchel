/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mvc.Modelo;

/**
 *
 * @author Jaret
 */
public class Maquina {
    
    private int etiqueta, laborarotio, marca, cpu_serial, accesorio, monitor,
            config, estado;
    private String problema;

    public Maquina() {
        
    }

    public int getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(int etiqueta) {
        this.etiqueta = etiqueta;
    }

    public int getLaborarotio() {
        return laborarotio;
    }

    public void setLaborarotio(int laborarotio) {
        this.laborarotio = laborarotio;
    }

    public int getMarca() {
        return marca;
    }

    public void setMarca(int marca) {
        this.marca = marca;
    }

    public int getCpu_serial() {
        return cpu_serial;
    }

    public void setCpu_serial(int cpu_serial) {
        this.cpu_serial = cpu_serial;
    }

    public int getAccesorio() {
        return accesorio;
    }

    public void setAccesorio(int accesorio) {
        this.accesorio = accesorio;
    }

    public int getMonitor() {
        return monitor;
    }

    public void setMonitor(int monitor) {
        this.monitor = monitor;
    }

    public int getConfig() {
        return config;
    }

    public void setConfig(int config) {
        this.config = config;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getProblema() {
        return problema;
    }

    public void setProblema(String problema) {
        this.problema = problema;
    }

    
}

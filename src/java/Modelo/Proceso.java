/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Timestamp;

/**
 *
 * @author ANGELO
 */
public class Proceso {
    
    private int codigoProceso;
    private String empleado;
    private Timestamp fecha;

    public Proceso(int codigoProceso, String empleado, Timestamp fecha) {
        this.codigoProceso = codigoProceso;
        this.empleado = empleado;
        this.fecha = fecha;
    }

    public Proceso() {
    }

    
    
    public int getCodigoProceso() {
        return codigoProceso;
    }

    public void setCodigoProceso(int codigoProceso) {
        this.codigoProceso = codigoProceso;
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    
}

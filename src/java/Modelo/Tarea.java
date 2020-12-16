
package Modelo;

import java.sql.Timestamp;

/**
 *
 * @author ANGELO
 */
public class Tarea {
    
    private int codigoTarea;
    private String categoria;
    private String nombre;
    private String descripcion;
    private String prioridad;
    private int dias;
    private Timestamp fechaCreacion;
    private String imagen;

    public Tarea(int codigoTarea, String categoria, String nombre, String descripcion, String prioridad, int dias, Timestamp fechaCreacion, String imagen) {
        this.codigoTarea = codigoTarea;
        this.categoria = categoria;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.prioridad = prioridad;
        this.dias = dias;
        this.fechaCreacion = fechaCreacion;
        this.imagen = imagen;
    }

    public Tarea(int codigoTarea, String categoria, String nombre, String descripcion, String prioridad, int dias) {
        this.codigoTarea = codigoTarea;
        this.categoria = categoria;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.prioridad = prioridad;
        this.dias = dias;
    }

    public Tarea(String categoria, String nombre, String descripcion, String prioridad, int dias, String imagen) {
        this.categoria = categoria;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.prioridad = prioridad;
        this.dias = dias;
        this.imagen = imagen;
    }
    
    
    
    public int getCodigoTarea() {
        return codigoTarea;
    }

    public void setCodigoTarea(int codigoTarea) {
        this.codigoTarea = codigoTarea;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public int getDias() {
        return dias;
    }

    public void setDias(int dias) {
        this.dias = dias;
    }

    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
   
    
    
}


package Modelo;

/**
 *
 * @author ANGELO
 */
public class TareaProceso {
    
    private int codigoTarea;
    private int codigoProceso;
    private String nota;
    private String estado;
    
    private Tarea tarea;
    private Proceso proceso;

    public TareaProceso(int codigoTarea, int codigoProceso, String nota, String estado, Tarea tarea, Proceso proceso) {
        this.codigoTarea = codigoTarea;
        this.codigoProceso = codigoProceso;
        this.nota = nota;
        this.estado = estado;
        this.tarea = tarea;
        this.proceso = proceso;
    }

    public TareaProceso(int codigoTarea, int codigoProceso, String nota, String estado) {
        this.codigoTarea = codigoTarea;
        this.codigoProceso = codigoProceso;
        this.nota = nota;
        this.estado = estado;
    }
    
    
    public TareaProceso() {
    }
    

    public int getCodigoTarea() {
        return codigoTarea;
    }

    public void setCodigoTarea(int codigoTarea) {
        this.codigoTarea = codigoTarea;
    }

    public int getCodigoProceso() {
        return codigoProceso;
    }

    public void setCodigoProceso(int codigoProceso) {
        this.codigoProceso = codigoProceso;
    }

    public String getNota() {
        return nota;
    }

    public void setNota(String nota) {
        this.nota = nota;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Tarea getTarea() {
        return tarea;
    }

    public void setTarea(Tarea tarea) {
        this.tarea = tarea;
    }

    public Proceso getProceso() {
        return proceso;
    }

    public void setProceso(Proceso proceso) {
        this.proceso = proceso;
    }
    
    
}

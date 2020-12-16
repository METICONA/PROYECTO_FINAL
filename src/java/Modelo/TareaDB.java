
package Modelo;

import Utils.Conexion;
import java.sql.*;
import java.util.ArrayList;


/**
 *
 * @author ANGELO
 */
public class TareaDB {
    
    public static ArrayList<Tarea> obtener_Tarea() {
        ArrayList<Tarea> lista = new ArrayList<Tarea>();
        try {
            CallableStatement cl=Conexion.getConexion().prepareCall("{call pa_listarTarea()}");
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                Tarea t = new Tarea(rs.getInt(1),rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getTimestamp(7),rs.getString(8));
                lista.add(t);
            }
        } catch (Exception e) {}
        return lista;
    }
    public static Tarea obtener_TareaId(int codigo) {
        Tarea t=null;
        try {
            CallableStatement  cl = Conexion.getConexion().prepareCall("{CALL tareaCod(?)}");
            cl.setInt(1, codigo);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                t = new Tarea(rs.getInt(1),rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getTimestamp(7),rs.getString(8));
            }
        }catch (Exception e) {}
        return t;
    }
    public static boolean actualizar_Tarea(Tarea vartarea) {
        boolean rpta = false;
        try {
            Connection cn = Conexion.getConexion();
            CallableStatement cl = cn.prepareCall( "{call pa_actualizarTarea(?,?,?,?,?,?)}");
            cl.setInt(1, vartarea.getCodigoTarea());
            cl.setString(2, vartarea.getCategoria());
            cl.setString(3, vartarea.getNombre());
            cl.setString(4, vartarea.getDescripcion());
            cl.setString(5, vartarea.getPrioridad());
            cl.setInt(6, vartarea.getDias());
            
            int i=cl.executeUpdate();
            if(i==1){
            rpta = true;
            }else{
            rpta = false;
            }
        } catch (Exception e) {}
        return rpta;
    }
    public static boolean insertar_Tarea(Tarea t) {
        boolean rpta = false;
        try {
            Connection cn = Conexion.getConexion();
            CallableStatement cl = cn.prepareCall("{CALL insertarTarea(?,?,?,?,?,?)}");
            cl.setString(1, t.getCategoria());
            cl.setString(2, t.getNombre());
            cl.setString(3, t.getDescripcion());
            cl.setString(4, t.getPrioridad());
            cl.setInt(5, t.getDias());
            cl.setString(6, t.getImagen());
            
            int i=cl.executeUpdate();
            if(i==1){
                rpta=true;
            }else{
                rpta=false;
            }
        } catch (Exception e) { }
        return rpta;
    }
}

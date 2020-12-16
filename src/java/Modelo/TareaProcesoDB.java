
package Modelo;

import Utils.Conexion;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author ANGELO
 */
public class TareaProcesoDB {
    
        public static ArrayList<TareaProceso> obtener_TareaProceso(int num) {
        
       ArrayList<TareaProceso> lista = new ArrayList<TareaProceso>();
        try {
            CallableStatement cl = Conexion.getConexion().prepareCall("{call tareaproceso(?)}");
            cl.setInt(1, num);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                TareaProceso tp=new TareaProceso(rs.getInt(1),
                        rs.getInt(2),rs.getString(3),rs.getString(4));
                lista.add(tp);
            }
        }catch (Exception e) {System.out.println(e);}
        return lista;
    }
}

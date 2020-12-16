
package Modelo;

import java.util.ArrayList;
import java.sql.*;
import Utils.Conexion;
import javax.swing.JOptionPane;

/**
 *
 * @author ANGELO
 */
public class ProcesoDB {
    
    public static boolean insertar_Proceso(Proceso varproceso, ArrayList<TareaProceso> tp) {
        boolean rpta = false;
        try {
            Connection cn = Conexion.getConexion();
            CallableStatement cl = cn.prepareCall("{call registrarProceso(?,?)}");
            cl.registerOutParameter(1, Types.INTEGER);
            cl.setString(2, varproceso.getEmpleado());
            int i=cl.executeUpdate();
            
            int i2=0;
            varproceso.setCodigoProceso(cl.getInt(1));
            CallableStatement cl2 = cn.prepareCall("{CALL registrarDetalle(?,?,?,?)}");
            for (TareaProceso aux : tp) {
            cl2.setInt(1, aux.getCodigoTarea());
            cl2.setInt(2, varproceso.getCodigoProceso());
            cl2.setString(3, aux.getNota());
            cl2.setString(4, aux.getEstado());
            i2=cl2.executeUpdate();
            }
            if(i2==1){
                rpta=true;
            }
        }catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);}
        return rpta;
    }
    public static ArrayList<Proceso> obtener_Proceso() {
        
        ArrayList<Proceso> lista = new ArrayList<Proceso>();
        
        try {
            CallableStatement cl=Conexion.getConexion().prepareCall("{call proceso()}");
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                Proceso p=new Proceso(rs.getInt(1), rs.getString(2), 
                        rs.getTimestamp(3));
                lista.add(p);
            }
        } catch (Exception e) {System.out.println("ventas-->"+e);}
        return lista;
    }
}

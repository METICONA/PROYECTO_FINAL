
package Modelo;
import Utils.Conexion;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author ANGELO
 */
public class UsuarioDB {
    
    public static ArrayList<Usuario> obtener_Usuario() {
        
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        try {
            CallableStatement cl=Conexion.getConexion().prepareCall("{call listarUsuario()}");
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario(rs.getInt(1),rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
                lista.add(u);
            }
        } catch (Exception e) {}
        return lista;
    }
    
    public static Usuario obtener_UsuarioId(int codigo) {
        Usuario u=null;
        try {
            CallableStatement  cl = Conexion.getConexion().prepareCall("{CALL usuarioCod(?)}");
            cl.setInt(1, codigo);
            ResultSet rs = cl.executeQuery();
            while (rs.next()) {
                u = new Usuario(rs.getInt(1),rs.getString(2),
                        rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
            }
        }catch (Exception e) {}
        return u;
    }
}

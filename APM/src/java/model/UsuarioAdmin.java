package model;

import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioAdmin {
    private String usuario;
    private String clave;

    // Constructor vacío
    public UsuarioAdmin() {}

    // Constructor con parámetros
    public UsuarioAdmin(String usuario, String clave) {
        this.usuario = usuario;
        this.clave = clave;
    }

    // Getters y setters
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    // Método para validar el usuario en la base de datos
    public static boolean validarUsuario(String usuario, String clave) {
        Conexion conexionDB = new Conexion();
        Connection conexion = conexionDB.getConexion();
        String sql = "SELECT * FROM usuariosadmin WHERE correo = ? AND clave = ?";
        try (PreparedStatement ps = conexion.prepareStatement(sql)) {
            ps.setString(1, usuario);
            ps.setString(2, clave);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next(); // Devuelve true si encuentra un registro
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            conexionDB.cerrar();
        }
    }
}

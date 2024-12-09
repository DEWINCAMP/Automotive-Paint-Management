package conexion;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    private Connection conexion;
    private Statement stm;

    public Conexion() {
        try {
            // Intentando cargar el controlador JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver JDBC cargado con éxito.");

            // Intentando establecer la conexión a la base de datos
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/apm_data_base", "root", "");
            System.out.println("Conexión a la base de datos establecida con éxito.");

            stm = conexion.createStatement();
            System.out.println("Statement creado con éxito.");
        } catch (ClassNotFoundException e) {
            System.out.println("Error al cargar el driver JDBC: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error de SQL al establecer la conexión: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public int insertarActualizarEliminar(String sql) {
        try {
            // Convertir el texto a bytes con la codificación UTF-8
            byte[] textBytes = sql.getBytes("UTF-8");

            // Crear una nueva cadena de texto a partir de los bytes con la codificación UTF-8
            sql = new String(textBytes, "UTF-8");

            // Ejecutando la operación SQL
            stm.execute(sql);
            System.out.println("Operación SQL ejecutada con éxito: " + sql);
            return 1;
        } catch (SQLException ex) {
            System.out.println("Error en la operación SQL: " + ex.getMessage());
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            System.out.println("Error de codificación al procesar el SQL: " + ex.getMessage());
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ResultSet consultar(String sql) {
        ResultSet r = null;
        try {
            // Ejecutando la consulta SQL
            r = stm.executeQuery(sql);
            System.out.println("Consulta SQL ejecutada con éxito: " + sql);
        } catch (SQLException ex) {
            System.out.println("Error en la consulta SQL: " + ex.getMessage());
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }

    public void cerrar() {
        try {
            if (stm != null) {
                stm.close();
                System.out.println("Statement cerrado con éxito.");
            }
            if (conexion != null) {
                conexion.close();
                System.out.println("Conexión a la base de datos cerrada con éxito.");
            }
        } catch (Exception e) {
            System.out.println("Error al cerrar la conexión: " + e.getMessage());
            e.printStackTrace();
        }
    }

    static void closeConnection(Connection conn) {
        try {
            if (conn != null) {
                conn.close();
                System.out.println("Conexión cerrada con éxito.");
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    public Connection getConexion() {
        return conexion;
    }
}

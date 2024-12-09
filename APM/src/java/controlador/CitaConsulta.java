package controlador;

import conexion.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CitaConsulta {

    public List<Cita> obtenerCitasPorCedula(String cedula) {
        List<Cita> citas = new ArrayList<>();
        Conexion conexion = new Conexion();
        String sql = "SELECT * FROM citas WHERE numeroCedula = ? ORDER BY fechaCita DESC, horaCita DESC";

        try {
            PreparedStatement statement = conexion.getConexion().prepareStatement(sql);
            statement.setString(1, cedula);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Cita cita = new Cita();
                cita.setNumeroCedula(resultSet.getString("numeroCedula"));
                cita.setNombreCliente(resultSet.getDate("nombreCliente"));
                cita.setApellidoCliente(resultSet.getTime("apellidoCliente"));
                cita.setCorreoCliente(resultSet.getString("correoCliente"));
                cita.setTelefonoCliente(resultSet.getString("telefonoCliente"));
                cita.setCiudadCliente(resultSet.getString("telefonoCliente"));
                cita.setFechaCita(resultSet.getString("fechaCita"));
                cita.setHoraCita(resultSet.getString("horaCita"));
                cita.setTipoServicio(resultSet.getString("tipoServicio"));
                cita.setNumeroPlaca(resultSet.getString("numeroPlaca"));
                cita.setModelo(resultSet.getString("modelo"));
                cita.setMarca(resultSet.getString("marca"));
                cita.setComentarios(resultSet.getString("comentarios"));
                citas.add(cita);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener citas: " + e.getMessage());
            e.printStackTrace();
        } finally {
            conexion.cerrar(); // Cierra la conexión después de usarla
        }
        return citas;
    }

    private static class Cita {

        public Cita() {
        }

        private void setNumeroCedula(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setNombreCliente(Date date) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setApellidoCliente(Time time) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setCorreoCliente(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setTelefonoCliente(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setCiudadCliente(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setFechaCita(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setHoraCita(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setTipoServicio(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setNumeroPlaca(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setModelo(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setMarca(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setComentarios(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }
    }
}

package model;

import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CitaAdmin {
    private int idCita;
    private String fechaCita;
    private String horaCita;
    private String numeroPlaca;
    private String tipoServicio;
    private String estadoCita;
    private String sedeCita;
    private String nombreCliente;
    private String cedulaCliente;
    private String comentarios;

    // Getters y Setters
    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public String getFechaCita() {
        return fechaCita;
    }

    public void setFechaCita(String fechaCita) {
        this.fechaCita = fechaCita;
    }

    public String getHoraCita() {
        return horaCita;
    }

    public void setHoraCita(String horaCita) {
        this.horaCita = horaCita;
    }

    public String getNumeroPlaca() {
        return numeroPlaca;
    }

    public void setNumeroPlaca(String numeroPlaca) {
        this.numeroPlaca = numeroPlaca;
    }

    public String getTipoServicio() {
        return tipoServicio;
    }

    public void setTipoServicio(String tipoServicio) {
        this.tipoServicio = tipoServicio;
    }

    public String getEstadoCita() {
        return estadoCita;
    }

    public void setEstadoCita(String estadoCita) {
        this.estadoCita = estadoCita;
    }
    
    public String getSedeCita() {
        return sedeCita;
    }

    public void setSedeCita(String sedeCita) {
        this.sedeCita = sedeCita;
    }
    
     public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getCedulaCliente() {
        return cedulaCliente;
    }

    public void setCedulaCliente(String cedulaCliente) {
        this.cedulaCliente = cedulaCliente;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }
    

    // Método para obtener todas las citas
    public static List<CitaAdmin> obtenerTodasLasCitas() {
        List<CitaAdmin> citas = new ArrayList<>();
        Conexion conexionDB = new Conexion();
        try (Connection conexion = conexionDB.getConexion();
             PreparedStatement ps = conexion.prepareStatement("SELECT * FROM citas")) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CitaAdmin citaAd = new CitaAdmin();
                citaAd.setIdCita(rs.getInt("idCita"));
                citaAd.setFechaCita(rs.getString("fechaCita"));
                citaAd.setHoraCita(rs.getString("horaCita"));
                citaAd.setNombreCliente(rs.getString("nombreCliente"));
                citaAd.setSedeCita(rs.getString("sedeCita"));
                citaAd.setNumeroPlaca(rs.getString("numeroPlaca"));
                citaAd.setTipoServicio(rs.getString("tipoServicio"));
                citaAd.setEstadoCita(rs.getString("estadoCita"));
                citaAd.setComentarios(rs.getString("comentarios"));
                
                citas.add(citaAd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return citas;
    }

    // Método para buscar citas por placa
    public static List<CitaAdmin> buscarCitasPorPlaca(String placa) {
        List<CitaAdmin> citas = new ArrayList<>();
        Conexion conexionDB = new Conexion();
        try (Connection conexion = conexionDB.getConexion();
             PreparedStatement ps = conexion.prepareStatement("SELECT * FROM citas WHERE numeroPlaca = ?")) {
            ps.setString(1, placa);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CitaAdmin cita = new CitaAdmin();
                cita.setIdCita(rs.getInt("idCita"));
                cita.setFechaCita(rs.getString("fechaCita"));
                cita.setHoraCita(rs.getString("horaCita"));
                cita.setNombreCliente(rs.getString("nombreCliente"));
                cita.setSedeCita(rs.getString("sedeCita"));
                cita.setNumeroPlaca(rs.getString("numeroPlaca"));
                cita.setTipoServicio(rs.getString("tipoServicio"));
                cita.setEstadoCita(rs.getString("estadoCita"));
                cita.setComentarios(rs.getString("comentarios"));

                citas.add(cita);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return citas;
    }
}

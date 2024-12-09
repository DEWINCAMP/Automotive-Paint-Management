package controlador;

import conexion.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;

@WebServlet(name = "RegistroCita", urlPatterns = {"/RegistroCita"})
public class RegistroCita extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Usuario u = new Usuario();
            u.setNumeroCedula(request.getParameter("numeroCedula"));            
            u.setNombreCliente(request.getParameter("nombreCliente"));
            u.setApellidoCliente(request.getParameter("apellidoCliente"));
            u.setCorreoCliente(request.getParameter("correoCliente"));
            u.setTelefonoCliente(request.getParameter("telefonoCliente"));
            u.setCiudadCliente(request.getParameter("ciudadCliente"));
            u.setFechaCita(request.getParameter("fechaCita"));
            u.setHoraCita(request.getParameter("horaCita"));
            u.setTipoServicio(request.getParameter("tipoServicio"));
            u.setNumeroPlaca(request.getParameter("numeroPlaca"));
            u.setModelo(request.getParameter("modelo"));
            u.setMarca(request.getParameter("marca"));
            u.setComentarios(request.getParameter("comentarios"));
            u.setEstadoCita("Cita asignada");

            Conexion conexion = new Conexion();
            String sedeCita = null;
            try {
                // Consulta para obtener la sede del taller según la ciudad seleccionada
                String querySede = "SELECT ciudad, direccion FROM talleresciudad WHERE ciudad = ?";

                Connection conn = conexion.getConexion();
                PreparedStatement ps = conn.prepareStatement(querySede);
                ps.setString(1, u.getCiudadCliente());
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    sedeCita = rs.getString("ciudad") + ", " + rs.getString("direccion");
                } else {
                    sedeCita = "No disponible"; // Valor por defecto si no se encuentra la ciudad
                }

                u.setSedeCita(sedeCita);

                rs.close();
                ps.close();
            } catch (Exception e) {
                System.out.println("Error al obtener la sede de la ciudad: " + e.getMessage());
                sedeCita = "Error"; // Manejo de error
            }

            // Inserción de la cita con sedeCita
            String sql = "INSERT INTO citas (numeroCedula, nombreCliente, apellidoCliente, correoCliente, telefonoCliente, ciudadCliente, sedeCita, fechaCita, horaCita, tipoServicio, numeroPlaca, modelo, marca, comentarios, estadoCita)"
                       + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try {
                PreparedStatement psInsert = conexion.getConexion().prepareStatement(sql);
                psInsert.setString(1, u.getNumeroCedula());
                psInsert.setString(2, u.getNombreCliente());
                psInsert.setString(3, u.getApellidoCliente());
                psInsert.setString(4, u.getCorreoCliente());
                psInsert.setString(5, u.getTelefonoCliente());
                psInsert.setString(6, u.getCiudadCliente());
                psInsert.setString(7, sedeCita);
                psInsert.setString(8, u.getFechaCita());
                psInsert.setString(9, u.getHoraCita());
                psInsert.setString(10, u.getTipoServicio());
                psInsert.setString(11, u.getNumeroPlaca());
                psInsert.setString(12, u.getModelo());
                psInsert.setString(13, u.getMarca());
                psInsert.setString(14, u.getComentarios());
                psInsert.setString(15, u.getEstadoCita());                

                psInsert.executeUpdate();
                psInsert.close();
                
                response.sendRedirect("agendarCita.jsp?success=true");

                System.out.println("Cita registrada con éxito con sede: " + sedeCita);

            } catch (Exception e) {
                System.out.println("Error al insertar la cita: " + e.getMessage());
                response.sendRedirect("agendarCita.jsp?success=false");                
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

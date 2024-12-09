package controlador;

import conexion.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CitaAdmin;

@WebServlet(name = "EditarCitaServlet", urlPatterns = {"/EditarCitaServlet"})
public class EditarCitaServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idCita = request.getParameter("idCita");

        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.getConexion();

            String sql = "SELECT * FROM citas WHERE idCita = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, idCita);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                CitaAdmin cita = new CitaAdmin();
                cita.setIdCita(rs.getInt("idCita"));
                cita.setFechaCita(rs.getString("fechaCita"));
                cita.setHoraCita(rs.getString("horaCita"));
                cita.setNumeroPlaca(rs.getString("numeroPlaca"));
                cita.setTipoServicio(rs.getString("tipoServicio"));
                cita.setEstadoCita(rs.getString("estadoCita"));
                cita.setNombreCliente(rs.getString("nombreCliente"));
                cita.setCedulaCliente(rs.getString("numeroCedula"));
                cita.setSedeCita(rs.getString("sedeCita"));
                cita.setComentarios(rs.getString("comentarios"));

                request.setAttribute("cita", cita);
                request.getRequestDispatcher("editarCita.jsp").forward(request, response);
            } else {
                response.getWriter().println("No se encontró la cita.");
            }

            rs.close();
            ps.close();
            conexion.cerrar();
        } catch (Exception e) {
            response.getWriter().println("Error al obtener los datos de la cita: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}

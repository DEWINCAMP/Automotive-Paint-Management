package controlador;

import conexion.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ActualizarCitaServlet", urlPatterns = {"/ActualizarCitaServlet"})
public class ActualizarCitaServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idCita = request.getParameter("idCita");
        String fechaCita = request.getParameter("fechaCita");
        String horaCita = request.getParameter("horaCita");
        String numeroPlaca = request.getParameter("numeroPlaca");
        String tipoServicio = request.getParameter("tipoServicio");
        String estadoCita = request.getParameter("estadoCita");

        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.getConexion();

            String sql = "UPDATE citas SET fechaCita = ?, horaCita = ?, numeroPlaca = ?, tipoServicio = ?, estadoCita = ? WHERE idCita = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fechaCita);
            ps.setString(2, horaCita);
            ps.setString(3, numeroPlaca);
            ps.setString(4, tipoServicio);
            ps.setString(5, estadoCita);
            ps.setString(6, idCita);

            ps.executeUpdate();
            ps.close();
            conexion.cerrar();

            response.sendRedirect("administracionCitas.jsp?success=true");
        } catch (Exception e) {
            response.getWriter().println("Error al actualizar la cita: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}

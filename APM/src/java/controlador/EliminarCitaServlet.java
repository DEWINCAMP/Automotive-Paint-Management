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

@WebServlet(name = "EliminarCitaServlet", urlPatterns = {"/EliminarCitaServlet"})
public class EliminarCitaServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idCita = request.getParameter("idCita");

        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.getConexion();

            String sql = "DELETE FROM citas WHERE idCita = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, idCita);
            ps.executeUpdate();

            ps.close();
            conexion.cerrar();
            
            response.sendRedirect("administracionCitas.jsp");
        } catch (Exception e) {
            response.getWriter().println("Error al eliminar la cita: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}

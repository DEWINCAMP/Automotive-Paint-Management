
package controlador;

import model.Cita;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CitaAdmin;

@WebServlet(name = "CitaServlet", urlPatterns = {"/CitaServlet"})
public class CitaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String placa = request.getParameter("numeroPlaca");

        List<CitaAdmin> citas;
        if (placa != null && !placa.isEmpty()) {
            // Buscar citas por placa
            citas = CitaAdmin.buscarCitasPorPlaca(placa);
        } else {
            // Obtener todas las citas
            citas = CitaAdmin.obtenerTodasLasCitas();
        }

        // Pasar los resultados al JSP
        request.setAttribute("citas", citas);
        request.getRequestDispatcher("administracionCitas.jsp").forward(request, response);
    }
}

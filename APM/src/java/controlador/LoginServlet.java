package controlador;

import model.UsuarioAdmin;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener parámetros del formulario
        String usuario = request.getParameter("username");
        String clave = request.getParameter("password");

        // Validar las credenciales con el modelo
        if (UsuarioAdmin.validarUsuario(usuario, clave)) {
            // Credenciales válidas: guardar en sesión y redirigir
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);
            response.sendRedirect("administracionCitas.jsp");
        } else {
            // Credenciales inválidas: redirigir al login con mensaje de error
            request.setAttribute("error", "Usuario o contraseña incorrectos. ❌");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

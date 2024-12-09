<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>AMP - Registro de Cliente</title>
    <link rel="stylesheet" href="css/design.css">
    <link css" rel="stylesheet" href="css/consultaCita.css" type="text/css"/>
</head>
<body>
    <header>
        <div id="encabezado">
            <h1>Automotive Paint Management</h1>
            <nav>
                <ul>
                    <li><a href="index.html">Inicio 🏠</a></li>
                    <li><a href="Trabajos.jsp">Trabajos 🛠️</a></li>
                    <li><a href="cliente.jsp">Clientes 🔎</a></li>
                    <li><a href="talleres.jsp">Talleres 🏪</a></li>
                    <li><a href="agendarCita.jsp">Agendar 🗓️</a></li>
                    <li><a href="login.jsp">Login 👤</a></li>
                </ul>
            </nav>
        </div>        
    </header>

    <main>
            <h2>Consulta el estado y detalles de tu Cita</h2>
            <p style="font-size: 1.1em; color: #333;">
            ¡Bienvenido! Aquí puedes conocer los detalles y el estado actual de tus citas. 
            Ingresa tu número de identificación para revisar toda la información relacionada 
            con los servicios que has agendado. Verifica fechas, horarios y el progreso del trabajo en tu vehículo.
            </p>
        
        <!-- Formulario para buscar citas por número de cédula -->
        <form action="cliente.jsp" method="get">
            <label for="numeroCedula">Número de Identificación:</label>
            <input type="text" id="numeroCedula" name="numeroCedula" required placeholder="Agrega tu número de identificación *">
            <button type="submit">Buscar Citas</button>
        </form>

        <% 
        // Conexión a la base de datos y consulta de citas
        String numeroCedula = request.getParameter("numeroCedula");
        if (numeroCedula != null && !numeroCedula.isEmpty()) {
            Connection conexion = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                // Establecer conexión con la base de datos
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexion = DriverManager.getConnection("jdbc:mysql://localhost/apm_data_base", "root", "");

                // Consulta SQL para obtener las citas del cliente
                String sql = "SELECT idCita, fechaCita, horaCita, nombreCliente, apellidoCliente, sedeCita, numeroCedula, tipoServicio, numeroPlaca, modelo, marca, estadoCita " +
                             "FROM citas WHERE numeroCedula = ?";
                ps = conexion.prepareStatement(sql);
                ps.setString(1, numeroCedula);
                rs = ps.executeQuery();

                // Mostrar las citas en una tabla
                //out.println("<h3>Resultados de la búsqueda:</h3>");
                if (rs.next()) {
                    String nombreCliente = rs.getString("nombreCliente"); // Recupera el nombre del cliente
                    String apellidoCliente = rs.getString("apellidoCliente"); // Recupera el apellido del cliente
                    out.println("<h3>Resultados de la búsqueda para el cliente: " + nombreCliente + " " + apellidoCliente + "</h3>");
                    out.println("<p style='font-size: 1em; color: #666;'>En la siguiente tabla encontrarás los detalles de tu cita, incluyendo su estado actual. Si tienes alguna duda, no dudes en contactarnos.</p>");
                    out.println("<table border='1'>");
                    out.println("<tr><th>Id Cita</th><th>Fecha</th><th>Hora</th><th>Cedula</th><th>Sede Cita</th><th>Servicio</th><th>Placa</th><th>Modelo</th><th>Marca</th><th>Estado Cita</th></tr>");
                    do {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("idCita") + "</td>");
                        out.println("<td>" + rs.getString("fechaCita") + "</td>");
                        out.println("<td>" + rs.getString("horaCita") + "</td>");
                        out.println("<td>" + rs.getString("numeroCedula") + "</td>");
                        out.println("<td>" + rs.getString("sedeCita") + "</td>");
                        out.println("<td>" + rs.getString("tipoServicio") + "</td>");
                        out.println("<td>" + rs.getString("numeroPlaca") + "</td>");
                        out.println("<td>" + rs.getString("modelo") + "</td>");
                        out.println("<td>" + rs.getString("marca") + "</td>");
                        out.println("<td>" + rs.getString("estadoCita") + "</td>");
                        out.println("</tr>");
                    } while (rs.next());
                    out.println("</table>");
                } else {
                    out.println("<p>No se encontraron citas para el cliente con número de cédula ☠️: " + numeroCedula + "</p>");
                }

            } catch (ClassNotFoundException | SQLException e) {
                out.println("<p>Error al consultar las citas: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conexion != null) conexion.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        %>
    </main>

    <footer>
        <div class="footer-container">
            <p>&copy; 2024 Automotive Paint Management. Todos los derechos reservados.</p>
            <div class="footer-info">
                <p><strong>Información de Contacto:</strong></p>
                <p>Teléfono: +57 312 345 6789</p>
                <p>Correo Electrónico: <a href="mailto:info@tallercolision.com">info@tallercolision.com</a></p>
                <p>Dirección: Calle 123 #45-67, Bogotá, Colombia</p>
            </div>
            <div class="footer-social">
                <p><strong>Síguenos en:</strong></p>
                <a href="https://facebook.com/tallercolision" target="_blank">Facebook</a> |
                <a href="https://twitter.com/tallercolision" target="_blank">Twitter</a> |
                <a href="https://instagram.com/tallercolision" target="_blank">Instagram</a>
            </div>
        </div>
    </footer>
</body>
</html>

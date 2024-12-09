<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>APM - Login</title>
    <link rel="stylesheet" href="css/design.css">
    <style>
        /* Toast */
        .toast {
            visibility: hidden;
            min-width: 250px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            border-radius: 8px;
            padding: 15px;
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 1001;
            font-size: 16px;
            transition: visibility 0.5s, opacity 0.5s ease;
        }

        .toast.show {
            visibility: visible;
            opacity: 1;
        }

        .toast.hide {
            opacity: 0;
        }
    </style>
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
        <h2>Login para administradores</h2>
        <p style="font-size: 1.1em; color: #666; margin-bottom: 20px;">
            Esta sección es exclusiva para administradores. Aquí podrán iniciar sesión para gestionar y supervisar 
            las citas que los clientes han registrado. Si eres un cliente, no necesitas acceder a esta página.
        </p>
            <form action="Login" method="post">
                <label for="username">Usuario:</label>
                <input type="text" id="username" name="username" placeholder="Ingresa tu usuario"required>
                
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" placeholder="Ingresa tu contraseña"required>
                
                <button type="submit">Ingresar</button>
            </form>
            <!-- Mostrar mensaje de error si existe -->
            <% if (request.getAttribute("error") != null) { %>
                <p style="color: red;"><%= request.getAttribute("error") %></p>
            <% } %>
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
 
    <!-- Toast -->
    <div id="toast">¡Sesión cerrada exitosamente!</div>

    <script>
        // Mostrar el toast si el parámetro success está presente
        const params = new URLSearchParams(window.location.search);
        if (params.get('success') === 'true') {
            const toast = document.getElementById('toast');
            toast.classList.add('show');
            setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }
    </script>
</body>
</html>
 
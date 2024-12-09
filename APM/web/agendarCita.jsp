<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>AMP - Agendar cita</title>
    <link rel="stylesheet" href="css/design.css">
       <style>
        /* Estilo para el toast */
        #toast {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: #4CAF50;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            left: 50%;
            bottom: 30px;
            font-size: 17px;
            transition: visibility 0s, opacity 0.5s linear;
        }

        #toast.show {
            visibility: visible;
            opacity: 1;
        }

        #toast.hide {
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
        <h2>Registro de Cita</h2>
        <p class="info-text">
            ✅ Por favor, complete los siguientes campos para agendar su cita en nuestro taller. Asegúrese de ingresar 
            información precisa para que podamos atenderlo de manera efectiva.<br>
            ✅ Proporcione la información de contacto del cliente. Es importante que el correo y el teléfono sean válidos 
            para enviarle confirmaciones y actualizaciones sobre su cita.<br>
            ✅ Seleccione la fecha y hora deseada para su cita. Tenga en cuenta que la disponibilidad depende de 
            los horarios de cada taller.<br>
            ✅ Ingrese la información del vehículo que requiere el servicio. Verifique que la placa sea correcta 
             para evitar inconvenientes.
        </p>
        <form action="RegistroCita" method="post" onsubmit="return validarHora() && validarCheckboxes()">
            
            <!-- Sección de Datos del Cliente -->
            <div class="section">
                <h3>Datos del Cliente</h3>
                
                
                <label for="numeroCedula">Número de Identificación:</label>
                <input type="text" id="numeroCedula" name="numeroCedula" required placeholder="Número de identificación *">

                <label for="nombreCliente">Nombre:</label>
                <input type="text" id="nombreCliente" name="nombreCliente" required placeholder="Nombre*">
                
                <label for="apellidoCliente">Apellidos</label>
                <input type="text" id="apellidoCliente" name="apellidoCliente" required placeholder="Apellidos*">

                <label for="correoCliente">Correo Electrónico:</label>
                <input type="email" id="correoCliente" name="correoCliente" required placeholder="Correo electrónico *">

                <label for="telefonoCliente">Teléfono:</label>
                <input type="text" id="telefonoCliente" name="telefonoCliente" placeholder="Número de teléfono">

                <label for="ciudadCliente">Ciudad:</label>
                <select id="ciudadCliente" name="ciudadCliente" required>
                    <option value="">Selecciona una ciudad</option>
                    <option value="Bogota">Bogotá</option>
                    <option value="Medellin">Medellín</option>
                    <option value="Cali">Cali</option>
                    <option value="Barranquilla">Barranquilla</option>
                    <option value="Cartagena">Cartagena</option>
                    <option value="Bucaramanga">Bucaramanga</option>
                </select>
            </div>
            
            <!-- Sección de Datos de la Cita -->
            <div class="section">
                <h3>Datos de la Cita</h3>

                <label for="fechaCita">Fecha de la Cita:</label>
                <input type="date" id="fechaCita" name="fechaCita" required>

                <label for="horaCita">Hora de la Cita:</label>
                <input type="time" id="horaCita" name="horaCita" required><br></br>

                <label for="tipoServicio">Tipo de Servicio:</label>
                <select id="tipoServicio" name="tipoServicio" required>
                    <option value="colision">Selecciona un tipo de servicio</option>
                    <option value="colision">Colisión</option>
                    <option value="reparacion">Reparación</option>
                    <option value="mantenimiento">Mantenimiento</option>
                </select>
            </div>

            <!-- Sección de Datos del Vehículo -->
            <div class="section">
                <h3>Datos del Vehículo</h3>

                <label for="numeroPlaca">Número de Placa:</label>
                <input type="text" id="numeroPlaca" name="numeroPlaca" required placeholder="Número de placa del vehículo *">

                <label for="modelo">Modelo:</label>
                <input type="text" id="modelo" name="modelo" required placeholder="Modelo del vehículo *">

                <label for="marca">Marca:</label>
                <input type="text" id="marca" name="marca" required placeholder="Marca del vehículo *">
            </div>

            <!-- Comentarios adicionales -->
            <div class="section">
                <label for="comentarios">Comentarios adicionales:</label>
                <textarea id="comentarios" name="comentarios" placeholder="Agrega comentarios adicionales"></textarea>
            </div>

            <button type="submit">Agendar Cita</button>
        </form>
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
        <div id="toast">¡Cita registrada con éxito!</div>

        <!-- Script para mostrar el toast -->
        <script>
            // Obtén el parámetro 'success' de la URL
            const params = new URLSearchParams(window.location.search);
            if (params.get('success') === 'true') {
                const toast = document.getElementById('toast');
                toast.classList.add('show');

                // Oculta el toast después de 3 segundos
                setTimeout(() => {
                    toast.classList.add('hide');
                    setTimeout(() => toast.classList.remove('show', 'hide'), 500);
                }, 3000);
            }
        </script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>APM - Talleres</title>
    <link rel="stylesheet" href="css/design.css">
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
        <h2>Información de Talleres</h2>

        <!-- Taller en Bogotá -->
        <section class="taller">
            <h3>Taller - Bogotá</h3>
            <p><strong>Ubicación:</strong> Calle 123 # 45-67, Bogotá</p>
            <p><strong>Descripción:</strong> Este taller especializado en reparación y pintura de vehículos ofrece los mejores servicios en la ciudad. Contamos con un equipo altamente calificado y equipos de última tecnología para trabajos rápidos y efectivos. Servicios disponibles:
                <ul>
                    <li>Reparación de colisiones</li>
                    <li>Pintura automotriz</li>
                    <li>Restauración de vehículos antiguos</li>
                </ul>
            </p>
            <div class="img-container">
                <img src="images/tallerBog.png" alt="Imagen del Taller 1" width="300">
                <img src="images/trabajo.png" alt="Imagen del Trabajos" width="300" height="300">
            </div>
        </section>

        <!-- Taller en Medellín -->
        <section class="taller">
            <h3>Taller - Medellín</h3>
            <p><strong>Ubicación:</strong> Avenida 80 # 20-34, Medellín</p>
            <p><strong>Descripción:</strong> Nuestro taller en Medellín es reconocido por la calidad de su servicio y la rapidez en los trabajos. Servicios principales:
                <ul>
                    <li>Personalización de vehículos</li>
                    <li>Pulido y encerado profesional</li>
                    <li>Reparaciones rápidas</li>
                </ul>
            </p>
            <div class="img-container">
                <img src="images/tallerMed.jpg" alt="Imagen del Taller 2" width="300">
                <img src="images/trabajos2.png" alt="Imagen del Taller 2" width="300">
            </div>
        </section>

        <!-- Taller en Cali -->
        <section class="taller">
            <h3>Taller - Cali</h3>
            <p><strong>Ubicación:</strong> Carrera 39 # 22-11, Cali</p>
            <p><strong>Descripción:</strong> Este taller está equipado con tecnología avanzada para la reparación de vehículos. Especialidades del taller:
                <ul>
                    <li>Reparación de colisiones graves</li>
                    <li>Pintura automotriz con horno</li>
                    <li>Reparación de chasis</li>
                </ul>
            </p>
            <div class="img-container">
                <img src="images/tallerCal.png" alt="Imagen del Taller 3" width="300">
                <img src="images/trabajos3.png" alt="Imagen del Taller 3" width="300">
            </div>
        </section>

        <!-- Taller en Cartagena -->
        <section class="taller">
            <h3>Taller - Cartagena</h3>
            <p><strong>Ubicación:</strong> Calle 50 # 14-56, Cartagena</p>
            <p><strong>Descripción:</strong> Nuestro taller en Cartagena ofrece servicios personalizados para vehículos particulares y comerciales. Servicios destacados:
                <ul>
                    <li>Pintura marina y protección anticorrosiva</li>
                    <li>Reparación y mantenimiento de flotillas</li>
                    <li>Servicio de grúas 24/7</li>
                </ul>
            </p>
            <div class="img-container">
                <img src="images/tallerCart.jpg" alt="Imagen del Taller 4" width="300">
                <img src="images/trabajos4.png" alt="Imagen del Taller 4" width="300">
            </div>    
        </section>

        <!-- Taller en Barranquilla -->
        <section class="taller">
            <h3>Taller - Barranquilla</h3>
            <p><strong>Ubicación:</strong> Carrera 21 # 9-32, Barranquilla</p>
            <p><strong>Descripción:</strong> En Barranquilla, nuestro taller está diseñado para ofrecer servicios rápidos y de alta calidad, ideales para el clima de la región. Servicios incluidos:
                <ul>
                    <li>Protección UV para pintura</li>
                    <li>Reparaciones de impacto menor</li>
                    <li>Inspección y diagnóstico rápido</li>
                </ul>
            </p>
            <div class="img-container">
                <img src="images/tallerBaq.png" alt="Imagen del Taller 5" width="300"><br>
                <img src="images/trabajos5.png" alt="Imagen del Taller 5" width="300">
            </div>
        </section>

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

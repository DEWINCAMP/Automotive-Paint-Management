<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Admin de Citas/Trabajos APM</title>
    <link href="css/admin.css" rel="stylesheet" type="text/css"/>
    <style>
        /* Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-content {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            width: 500px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        .modal-content label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .modal-content input, .modal-content select, .modal-content textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }

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
        }

        .toast.show {
            visibility: visible;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }

        @keyframes fadein {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeout {
            from { opacity: 1; }
            to { opacity: 0; }
        }

        /* Botones */
        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }

        .btn-edit {
            background-color: #4CAF50; /* Verde */
            color: white;
        }

        .btn-edit:hover {
            background-color: #45a049;
        }

        .btn-delete {
            background-color: #ff5c5c; /* Rojo */
            color: white;
        }

        .btn-delete:hover {
            background-color: #ff2f2f;
        }

        /* Alinear botones */
        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
    </style>
</head>
<body>
    <header>
        <div id="encabezado">
            <h1>Administración de Citas/Trabajos</h1>
            <nav>
                <ul>
                    <li><a href="LogoutServlet" class="logout-link">Cerrar sesión</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main>
        <h2>Administración</h2>
        <p>Esta sección está destinada exclusivamente para administradores. Aquí puedes gestionar las citas y los trabajos registrados, 
           así como consultar por placa de vehículo para obtener información detallada sobre las citas.</p>

        <section class="admin-section">
            <h3>Consultar Citas</h3>
            <form action="CitaServlet" method="post">
                <label for="numeroPlaca">Placa del Vehículo (opcional):</label>
                <input type="text" id="numeroPlaca" name="numeroPlaca" placeholder="Ingrese la placa del vehículo"><br>
                <button type="submit" class="btn btn-primary">🔍 Consultar Citas Totales</button>
            </form>

            <!-- Mostrar resultados -->
            <%
                List<model.CitaAdmin> citas = (List<model.CitaAdmin>) request.getAttribute("citas");
                if (citas != null && !citas.isEmpty()) {
            %>
                <h3>Resultados de la búsqueda</h3>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Cliente</th>
                        <th>Sede Cita</th>                                               
                        <th>Placa</th>
                        <th>Servicio</th>
                        <th>Comentarios</th> 
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                    <% for (model.CitaAdmin cita : citas) { %>
                    <tr>
                        <td><%= cita.getIdCita() %></td>
                        <td><%= cita.getFechaCita() %></td>
                        <td><%= cita.getHoraCita() %></td>
                        <td><%= cita.getNombreCliente() %></td>
                        <td><%= cita.getSedeCita() %></td>
                        <td><%= cita.getNumeroPlaca() %></td>
                        <td><%= cita.getTipoServicio() %></td>
                        <td><%= cita.getComentarios() %></td>
                        <td><%= cita.getEstadoCita() %></td>
                        <td>
                            <div class="action-buttons">
                                <button class="btn btn-edit" onclick="openEditModal(<%= cita.getIdCita() %>, '<%= cita.getFechaCita() %>', '<%= cita.getHoraCita() %>', '<%= cita.getNumeroPlaca() %>', '<%= cita.getTipoServicio() %>', '<%= cita.getEstadoCita() %>', '<%= cita.getComentarios() %>')">✏️ Editar</button>
                                <form action="EliminarCitaServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="idCita" value="<%= cita.getIdCita() %>">
                                    <button class="btn btn-delete" type="submit" onclick="return confirm('¿Está seguro de que desea eliminar esta cita?')">🗑️ Eliminar</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% } else { %>
                <p>No se encontraron citas.</p>
            <% } %>
        </section>
    </main>
    <!-- Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <button class="close-btn" onclick="closeEditModal()">✖</button>
            <form id="editForm" action="ActualizarCitaServlet" method="post">
                <input type="hidden" id="editIdCita" name="idCita">
                <label for="editFecha">Fecha:</label>
                <input type="date" id="editFecha" name="fechaCita" required>

                <label for="editHora">Hora:</label>
                <input type="time" id="editHora" name="horaCita" required>

                <label for="editPlaca">Placa:</label>
                <input type="text" id="editPlaca" name="numeroPlaca" required>

                <label for="editServicio">Servicio:</label>
                <select id="editServicio" name="tipoServicio" required>
                    <option value="Colision">Colisión</option>
                    <option value="Reparacion">Reparación</option>
                    <option value="Mantenimiento">Mantenimiento</option>
                </select>

                <label for="editEstado">Estado:</label>
                <select id="editEstado" name="estadoCita" required>
                    <option value="Cita asignada">Cita asignada</option>
                    <option value="Trabajo en proceso">Trabajo en proceso</option>
                    <option value="Trabajo finalizado">Trabajo finalizado</option>
                    <option value="Cita cancelada">Cita cancelada</option>
                </select>

                <label for="editComentarios">Comentarios:</label>
                <textarea id="editComentarios" name="comentarios" rows="4"></textarea>

                <button type="submit" class="btn btn-primary">🚀️ Guardar Cambios</button>
            </form>
        </div>
    </div>

    <!-- Toast -->
    <div id="toast" class="toast">Cambios guardados exitosamente</div>
    <script>
        // Mostrar el toast si el parámetro success está presente
        const params = new URLSearchParams(window.location.search);
        if (params.get('success') === 'true') {
            const toast = document.getElementById('toast');
            toast.className = 'toast show';
            setTimeout(() => { toast.className = toast.className.replace('show', ''); }, 3000);
        }
    </script>

    <script>
        function openEditModal(id, fecha, hora, placa, servicio, estado, comentarios) {
            document.getElementById('editIdCita').value = id;
            document.getElementById('editFecha').value = fecha;
            document.getElementById('editHora').value = hora;
            document.getElementById('editPlaca').value = placa;
            document.getElementById('editServicio').value = servicio;
            document.getElementById('editEstado').value = estado;
            document.getElementById('editComentarios').value = comentarios;
            document.getElementById('editModal').style.display = 'flex';
        }

        function closeEditModal() {
            document.getElementById('editModal').style.display = 'none';
        }

        function showToast() {
            const toast = document.getElementById('toast');
            toast.className = 'toast show';
            setTimeout(() => { toast.className = toast.className.replace('show', ''); }, 3000);
        }
    </script>
</body>
</html>

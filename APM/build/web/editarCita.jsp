<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.CitaAdmin" %>
<%
    CitaAdmin cita = (CitaAdmin) request.getAttribute("cita");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>APM - Editar Cita</title>
    <link href="css/admin.css" rel="stylesheet" type="text/css"/>
    <style>
        /* Mejor diseño del formulario */
        main {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            background-color: #f4f4f4;
        }

        form {
            background: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }

        label {
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
        }

        input[type="text"], input[type="date"], input[type="time"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        button i {
            font-size: 18px;
        }

        header {
            width: 100%;
            background: #333;
            color: #fff;
            padding: 10px 20px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        #encabezado h1 {
            font-size: 1.5em;
            color: #fff;
        }
    </style>
</head>
<body>
    <header>
        <div id="encabezado">
            <h1>Automotive Paint Management</h1>
        </div>
    </header>
    
    <main>
        <form action="ActualizarCitaServlet" method="post">
            <input type="hidden" name="idCita" value="<%= cita.getIdCita() %>">
            
            <label for="fechaCita">Fecha:</label>
            <input type="date" name="fechaCita" value="<%= cita.getFechaCita() %>" required>

            <label for="horaCita">Hora:</label>
            <input type="time" name="horaCita" value="<%= cita.getHoraCita() %>" required>

            <label for="numeroPlaca">Placa:</label>
            <input type="text" name="numeroPlaca" value="<%= cita.getPlacaVehiculo() %>" required>

            <label for="tipoServicio">Servicio:</label>
            <select name="tipoServicio">
                <option value="Colision" <%= cita.getTipoServicio().equals("Colision") ? "selected" : "" %>>Colisión</option>
                <option value="Reparacion" <%= cita.getTipoServicio().equals("Reparacion") ? "selected" : "" %>>Reparación</option>
                <option value="Mantenimiento" <%= cita.getTipoServicio().equals("Mantenimiento") ? "selected" : "" %>>Mantenimiento</option>               
            </select>

            <label for="estadoCita">Estado:</label>
            <select name="estadoCita">
                <option value="Cita asignada" <%= cita.getEstadoCita().equals("Cita asignada") ? "selected" : "" %>>Cita asignada</option>
                <option value="Trabajo en proceso" <%= cita.getEstadoCita().equals("Trabajo en proceso") ? "selected" : "" %>>Trabajo en proceso</option>
                <option value="Trabajo finalizado" <%= cita.getEstadoCita().equals("Trabajo finalizado") ? "selected" : "" %>>Trabajo finalizado</option>
                <option value="Vehiculo entregado" <%= cita.getEstadoCita().equals("Vehiculo entregado") ? "selected" : "" %>>Vehículo entregado</option>
                <option value="Cita cancelada" <%= cita.getEstadoCita().equals("Cita cancelada") ? "selected" : "" %>>Cita cancelada</option>
            </select>

            <button type="submit">
                <i>🌶️</i> Guardar Cambios
            </button>
        </form>
    </main>
</body>
</html>

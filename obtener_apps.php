<?php
include 'conexion.php';

header('Content-Type: application/json; charset=utf-8');
$sql = "SELECT a.*, t.nombre AS nombre_tipo_app FROM aplicacion a LEFT JOIN tipo_aplicacion t ON a.id_tipo_aplicacion = t.id_tipo_aplicacion"; 
$result = $conn->query($sql);
$apps = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // Si el campo imagen está vacío o nulo, asigna una por defecto
        if (empty($row['ubicacion_imagen'])) {
            $row['ubicacion_imagen'] = 'img/logo_defecto.png';
        }
        if (empty($row['nombre_tipo_app'])) {
            $row['nombre_tipo_app'] = "Sin Categoría";
        }
        $apps[] = $row;
    }
}

echo json_encode($apps, JSON_UNESCAPED_UNICODE);
$conn->close();
?>
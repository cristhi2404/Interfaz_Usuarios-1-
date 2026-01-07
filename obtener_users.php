<?php
include 'conexion.php';

header('Content-Type: application/json; charset=utf-8');
$sql = "SELECT e.*, p.nombre AS proceso, t.nombre AS tipo_documento, u.nombre AS ubicacion FROM empleado e LEFT JOIN proceso p ON e.id_proceso = p.id_proceso LEFT JOIN tipo_documento t ON e.id_tipo_documento = t.id_tipo_documento LEFT JOIN ubicacion u ON e.id_ubicacion = u.id_ubicacion"; 
$result = $conn->query($sql);
$usuarios = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // Si el campo imagen está vacío o nulo, asigna una por defecto
        if (empty($row['imagen'])) {
            $row['imagen'] = 'img/fotoperfil.png';
        }
        $usuarios[] = $row;
    }
}

echo json_encode($usuarios, JSON_UNESCAPED_UNICODE);
$conn->close();
?>
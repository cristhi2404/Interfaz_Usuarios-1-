<?php
include 'conexion.php';

header('Content-Type: application/json; charset=utf-8');
$sql = "SELECT * FROM empleado"; 
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
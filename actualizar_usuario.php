<?php
include 'conexion.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["ok" => false, "msg" => "Método no permitido"]);
    exit;
}

$id_empleado = $_POST['id_empleado'] ?? null;
if (!$id_empleado) {
    echo json_encode(["ok" => false, "msg" => "ID de empleado no proporcionado"]);
    exit;
}

$estado = $_POST['estado'] ?? null;

// Si el estado viene, significa que se está activando/inactivando desde el modal de desactivar
if ($estado !== null) {
    error_log("⚙️ Estado recibido: " . print_r($_POST, true));
    $estado = strtolower(trim($estado));

    $sql = "UPDATE empleado SET estado=? WHERE id_empleado=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("si", $estado, $id_empleado);

    if ($stmt->execute()) {
        $query = $conn->prepare("SELECT * FROM empleado WHERE id_empleado=?");
        $query->bind_param("i", $id_empleado);
        $query->execute();
        $resultado = $query->get_result();
        $usuarioActualizado = $resultado->fetch_assoc();
        $query->close();

        echo json_encode([
            "ok" => true,
            "msg" => "Estado actualizado correctamente",
            "usuario" => $usuarioActualizado
        ]);
    } else {
        echo json_encode(["ok" => false, "msg" => "Error al actualizar estado: " . $conn->error]);
    }

    $stmt->close();
    $conn->close();
    exit;
}

// Si no vino 'estado', entonces es una actualización normal (modal de editar)
$id_proceso  = $_POST['id_proceso'] ?? null;
$nombre = $_POST['nombre'] ?? '';
$cargo = $_POST['cargo'] ?? '';
$id_tipo_documento = $_POST['id_tipo_documento'] ?? null;
$numero_documento = $_POST['numero_documento'] ?? '';
$correo = $_POST['correo'] ?? '';
$celular = $_POST['celular'] ?? '';
$linea_fija = $_POST['linea_fija'] ?? '';
$ubicacion = $_POST['ubicacion'] ?? '';

$sql = "UPDATE empleado 
        SET id_proceso=?, nombre=?, cargo=?, id_tipo_documento=?, numero_documento=?, correo=?, celular=?, linea_fija=?, ubicacion=?
        WHERE id_empleado=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ississsssi", $id_proceso, $nombre, $cargo, $id_tipo_documento, $numero_documento, $correo, $celular, $linea_fija, $ubicacion, $id_empleado);

if ($stmt->execute()) {
    $query = $conn->prepare("SELECT * FROM empleado WHERE id_empleado=?");
    $query->bind_param("i", $id_empleado);
    $query->execute();
    $resultado = $query->get_result();
    $usuarioActualizado = $resultado->fetch_assoc();

    echo json_encode([
        "ok" => true,
        "msg" => "Usuario actualizado correctamente",
        "usuario" => $usuarioActualizado
    ]);

    $query->close();
} else {
    echo json_encode(["ok" => false, "msg" => "Error al actualizar: " . $conn->error]);
}

$stmt->close();
$conn->close();
?>


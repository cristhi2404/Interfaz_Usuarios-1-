<?php
include 'conexion.php';
ob_clean();
header('Content-Type: application/json; charset=utf-8');

error_reporting(0);
ini_set('display_errors', 0);
ini_set('log_errors', 1);
ini_set('error_log', __DIR__ . '/errores.log');

set_error_handler(function($errno, $errstr, $errfile, $errline) {
    echo json_encode([
        "ok" => false,
        "msg" => " Error interno: $errstr en $errfile:$errline"
    ]);
    exit;
});

if (!$conn) {
    echo json_encode(["ok" => false, "msg" => " Error al conectar a la base de datos"]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(["ok" => false, "msg" => "Método no permitido"]);
    exit;
}

$id_empleado = filter_input(INPUT_POST, 'id_empleado', FILTER_VALIDATE_INT);
if (!$id_empleado) {
    echo json_encode(["ok" => false, "msg" => "ID de empleado no proporcionado"]);
    exit;
}

//  Si se pidió eliminar la foto
if (isset($_POST['eliminar_foto']) && $_POST['eliminar_foto'] == "1") {

    // Buscar la imagen actual
    $stmt = $conn->prepare("SELECT imagen FROM empleado WHERE id_empleado=?");
    $stmt->bind_param("i", $id_empleado);
    $stmt->execute();
    $resultado = $stmt->get_result();
    $usuario = $resultado->fetch_assoc();

    // Eliminar archivo físico si existe
    if ($usuario && !empty($usuario['imagen'])) {
        $rutaFoto = $usuario['imagen'];
        if (file_exists($rutaFoto)) {
            unlink($rutaFoto);
        }
    }

    // Poner la columna imagen en NULL
    $stmt = $conn->prepare("UPDATE empleado SET imagen=NULL WHERE id_empleado=?");
    $stmt->bind_param("i", $id_empleado);

    if ($stmt->execute()) {
        echo json_encode(["ok" => true, "msg" => "Foto eliminada"]);
    } else {
        echo json_encode(["ok" => false, "msg" => "Error al eliminar foto"]);
    }

    exit();
}

$estado = $_POST['estado'] ?? null;

// Si el estado viene, significa que se está activando/inactivando desde el modal de desactivar
if ($estado !== null) {
    error_log(" Estado recibido: " . print_r($_POST, true));                   
    $estado = strtoupper(trim($estado));

    $sql = "UPDATE empleado SET estado=? WHERE id_empleado=?";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
    echo json_encode([
        "ok" => false,
        "msg" => "Error en prepare(): " . $conn->error
    ]);
    exit;
}


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
$id_proceso = $id_proceso ?: 0;
$id_tipo_documento = $id_tipo_documento ?: 0;

$rutaImagen = null;

// Verificar si viene una imagen nueva
if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
    $file = $_FILES['imagen'];
    $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
    $nombreLimpio = preg_replace('/[^a-zA-Z0-9_]/', '_', $nombre);
    $nombreArchivo = "img_" . $nombreLimpio . "_" . uniqid() . "." . strtolower($ext);
    $carpetaDestino = __DIR__ . "/imgusers/";
    $rutaDestino = $carpetaDestino . $nombreArchivo; 
    $permitidos = ['image/jpeg', 'image/png', 'image/webp'];
    if (!in_array($file['type'], $permitidos)) {
        echo json_encode(["ok" => false, "msg" => "Tipo de archivo no permitido"]);
        exit;
    }

    if ($file['size'] > 2 * 1024 * 1024) { // 2 MB
        echo json_encode(["ok" => false, "msg" => "Archivo demasiado grande"]);
        exit;
    }
    // Crear carpeta si no existe
    if (!file_exists($carpetaDestino)) {
        mkdir($carpetaDestino, 0777, true);
    }

    // Mover el archivo al directorio final
    if (move_uploaded_file($file['tmp_name'], $rutaDestino)) {
        $rutaImagen = "imgusers/" . $nombreArchivo;
    }

}

// 🔹 Si hay imagen nueva, actualiza también la columna 'imagen'
if ($rutaImagen) {
    $sql = "UPDATE empleado 
            SET id_proceso=?, nombre=?, cargo=?, id_tipo_documento=?, numero_documento=?, correo=?, celular=?, linea_fija=?, ubicacion=?, imagen=?
            WHERE id_empleado=?";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
    echo json_encode([
        "ok" => false,
        "msg" => "Error en prepare(): " . $conn->error
    ]);
    exit;
}
    $stmt->bind_param("ississssssi", $id_proceso, $nombre, $cargo, $id_tipo_documento, $numero_documento, $correo, $celular, $linea_fija, $ubicacion, $rutaImagen, $id_empleado);
} else {
    // Si no hay imagen nueva, mantener la actual
    $sql = "UPDATE empleado 
            SET id_proceso=?, nombre=?, cargo=?, id_tipo_documento=?, numero_documento=?, correo=?, celular=?, linea_fija=?, ubicacion=?
            WHERE id_empleado=?";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
    echo json_encode([
        "ok" => false,
        "msg" => "Error en prepare(): " . $conn->error
    ]);
    exit;
}
    $stmt->bind_param("ississsssi", $id_proceso, $nombre, $cargo, $id_tipo_documento, $numero_documento, $correo, $celular, $linea_fija, $ubicacion, $id_empleado);
}

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


<?php
include 'conexion.php';
ob_start();
header('Content-Type: application/json; charset=utf-8');

error_reporting(E_ALL);
ini_set('display_errors', 0);
ini_set('log_errors', 1);
ini_set('error_log', __DIR__ . '/errores.log');

set_error_handler(function($errno,$errstr, $errfile, $errline) {
    if (ob_get_length()) ob_clean();
    echo json_encode([
        "ok" => false,
        "msg" => "Error interno ($errno): $errstr en línea $errline"
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

$id_aplicacion = filter_input(INPUT_POST, 'id_aplicacion', FILTER_VALIDATE_INT);

$carpetaDestino = __DIR__ . "/public/img/";
//  Si se pidió eliminar la foto
if (isset($_POST['eliminar_foto']) && $_POST['eliminar_foto'] == "1") {
    if (!$id_aplicacion) {
        echo json_encode(["ok" => false, "msg" => "ID de aplicación no proporcionado"]);
        exit;
    }
    // Buscar la imagen actual
    $stmt = $conn->prepare("SELECT ubicacion_imagen FROM aplicacion WHERE id_aplicacion=?");
    $stmt->bind_param("i", $id_aplicacion);
    $stmt->execute();
    $resultado = $stmt->get_result();
    $app = $resultado->fetch_assoc();

    // Eliminar archivo físico si existe
    if ($app && !empty($app['ubicacion_imagen'])) {
        $rutaFoto = $carpetaDestino . $app['ubicacion_imagen'];
        if (file_exists($rutaFoto)) {
            unlink($rutaFoto);
        }
    }

    // Pone la columna imagen en null
    $stmt = $conn->prepare("UPDATE aplicacion SET ubicacion_imagen=NULL WHERE id_aplicacion=?");
    $stmt->bind_param("i", $id_aplicacion);

    if ($stmt->execute()) {
        echo json_encode(["ok" => true, "msg" => "Logo eliminada"]);
    } else {
        echo json_encode(["ok" => false, "msg" => "Error BD: " . $conn->error]);
    }

    exit();
}

$estado = $_POST['estado'] ?? null;

// Si el estado viene, significa que se está activando/inactivando desde el modal de desactivar
if ($estado !== null && $id_aplicacion) {
    error_log(" Estado recibido: " . print_r($_POST, true));                   
    $estado = strtoupper(trim($estado));

    $sql = "UPDATE aplicacion SET estado=? WHERE id_aplicacion=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("si", $estado, $id_aplicacion);

    if ($stmt->execute()) {
        $query = $conn->prepare("SELECT * FROM aplicacion WHERE id_aplicacion=?");
        $query->bind_param("i", $id_aplicacion);
        $query->execute();
        $appActualizada = $query->get_result()->fetch_assoc();

        echo json_encode([
            "ok" => true,
            "msg" => "Estado actualizado correctamente",
            "app" => $appActualizada
        ]);
    } else {
        echo json_encode(["ok" => false, "msg" => "Error al actualizar estado: " . $conn->error]);
    }
    exit;
}

// Si no vino 'estado', entonces es una actualización normal (modal de editar)
$nombre = $_POST['nombre'] ?? '';
$descripcion = $_POST['descripcion'] ?? '';
$id_tipo_aplicacion = $_POST['id_tipo_aplicacion'] ?? 0;
$forma_acceso = $_POST['forma_acceso'] ?? '';
$url = $_POST['url'] ?? '';
$capacitacion = $_POST['link_capacitacion'] ?? '';

if (empty($nombre) || !$id_aplicacion) {
    echo json_encode(["ok" => false, "msg" => "El nombre es obligatorio"]);
    exit;
}
function limpiarNombreArchivo($string) {
    $string = mb_strtolower($string, 'UTF-8'); // Minúsculas
    // Reemplazar tildes
    $string = str_replace(
        ['á', 'é', 'í', 'ó', 'ú', 'ñ', 'ü'],
        ['a', 'e', 'i', 'o', 'u', 'n', 'u'],
        $string
    );
    // Solo dejar letras, números y guiones bajos
    $string = preg_replace('/[^a-z0-9]+/', '_', $string);
    return trim($string, '_');
}
$nombreArchivoFinal = null;

// Verificar si viene una imagen nueva
if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
    $file = $_FILES['imagen'];
    $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
    $ext = strtolower($ext);

    $permitidos = ['image/jpeg', 'image/png', 'image/webp', 'image/svg+xml', 'image/jpg'];
    if (!in_array($file['type'], $permitidos)&& !in_array($ext, ['jpg', 'jpeg', 'png', 'webp', 'svg'])) {
        echo json_encode(["ok" => false, "msg" => "Formato de imagen no permitido"]);
        exit;
    }
    if (!file_exists($carpetaDestino)) {
        mkdir($carpetaDestino, 0777, true);
    }
    $nombreBase = limpiarNombreArchivo($nombre);
    $nombreArchivoFinal = "logo_" . $nombreBase . "." . $ext;
    $rutaDestino = $carpetaDestino . $nombreArchivoFinal;
    if (!file_exists($carpetaDestino)) {
        mkdir($carpetaDestino, 0777, true);
    }
    

    // Mover el archivo al directorio final
    if (!move_uploaded_file($file['tmp_name'], $rutaDestino)) {
        echo json_encode(["ok" => false, "msg" => "Error al guardar la imagen en el servidor"]);
        exit;
    }


}

// 🔹 Si hay imagen nueva, actualiza también la columna 'imagen'
if ($nombreArchivoFinal) {
    $sql = "UPDATE aplicacion 
            SET nombre=?, descripcion=?, id_tipo_aplicacion=?, forma_acceso=?, url=?, link_capacitacion=?, ubicacion_imagen=?
            WHERE id_aplicacion=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssissssi", $nombre, $descripcion, $id_tipo_aplicacion, $forma_acceso, $url, $capacitacion, $nombreArchivoFinal, $id_aplicacion);
} else {
    // Si no hay imagen nueva, mantener la actual
    $sql = "UPDATE aplicacion 
            SET nombre=?, descripcion=?, id_tipo_aplicacion=?, forma_acceso=?, url=?, link_capacitacion=?
            WHERE id_aplicacion=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssisssi", $nombre, $descripcion, $id_tipo_aplicacion, $forma_acceso, $url, $capacitacion, $id_aplicacion);

}

if ($stmt->execute()) {
    $sqlSelect = "SELECT a.*, t.nombre AS nombre_tipo_app 
                  FROM aplicacion a 
                  LEFT JOIN tipo_aplicacion t ON a.id_tipo_aplicacion = t.id_tipo_aplicacion  
                  WHERE a.id_aplicacion=?";
    $query = $conn->prepare($sqlSelect);
    $query->bind_param("i", $id_aplicacion);
    $query->execute();
    $resultado = $query->get_result();
    $appActualizado = $resultado->fetch_assoc();

    echo json_encode([
        "ok" => true,
        "msg" => "Aplicación actualizada correctamente",
        "aplicacion" => $appActualizado
    ]);

} else {
    echo json_encode(["ok" => false, "msg" => "Error al actualizar: " . $conn->error]);
}

$stmt->close();
$conn->close();                                                                                     
?>
  

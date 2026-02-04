<?php

    include 'conexion.php';
    ob_start();
    header('Content-Type: application/json; charset=utf-8');
    error_reporting(E_ALL);
    ini_set('display_errors', 0);

    // manejador de errores
    set_error_handler(function($errno, $errstr, $errfile, $errline) {
        if (ob_get_length()) ob_clean(); // Limpia basura HTML anterior
        echo json_encode([
            "ok" => false,
            "msg" => "Error Interno PHP ($errno): $errstr en línea $errline"
        ]);
        exit;
    });
    register_shutdown_function(function() {
        $error = error_get_last();
        if ($error && ($error['type'] === E_ERROR || $error['type'] === E_PARSE)) {
            if (ob_get_length()) ob_clean();
            echo json_encode([
                "ok" => false,
                "msg" => "Error Fatal del Servidor: " . $error['message'] . " en línea " . $error['line']
            ]);
        }
    });


    //----------------------------------Logica------------------------------------------//
    if(!$conn){
        echo json_encode(["success" => false, "message" => "Error de conexion a la base de datos"]);
        exit();
    }
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        echo json_encode(["ok" => false, "msg" => "Método no permitido"]);
        exit;
    }

// recibir datos //
    $nombre = mb_strtoupper($_POST['nombre'] ?? '', 'UTF-8');
    $forma_acceso = $_POST['forma_acceso'] ?? '';
    $descripcion = $_POST['descripcion'] ?? '';
    $url = $_POST['url'] ?? '';
    $tipoapp = $_POST['id_tipo_aplicacion'] ?? 0;
    if (empty($nombre) || empty($forma_acceso) || empty($descripcion) ||  $tipoapp==0 || empty($url) ) {
        echo json_encode(["ok" => false, "msg" => "nombre, forma de acceso, descripcion, tipo de aplicacion y url son obligatorios"]);
        exit; 
    } 
    $carpetaDestino = __DIR__ . "/public/img/";
    $nombreArchivoFinal = "";
    function limpiarNombreArchivo($string) {
        $string = mb_strtolower($string, 'UTF-8');
        $string = str_replace(
            ['á', 'é', 'í', 'ó', 'ú', 'ñ', 'ü'],
            ['a', 'e', 'i', 'o', 'u', 'n', 'u'],
            $string
        );
        $string = preg_replace('/[^a-z0-9]+/', '_', $string);
        return trim($string, '_');
    }
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
        $file = $_FILES['imagen'];
        $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
        $ext = strtolower($ext);
        $permitidos = ['jpg', 'jpeg', 'png', 'webp', 'svg'];
        if (in_array($ext, $permitidos)) {
            if (!file_exists($carpetaDestino)) {
                mkdir($carpetaDestino, 0777, true);
            }
            $nombreBase = limpiarNombreArchivo($nombre);
            $nombreArchivoFinal = "logo_" . $nombreBase . "." . $ext;
            $rutaCompleta = $carpetaDestino . $nombreArchivoFinal;
            if (!move_uploaded_file($file['tmp_name'], $rutaCompleta)) {
                echo json_encode(["ok" => false, "msg" => "Error al guardar la imagen en el servidor"]);
                exit;
            }
        }else{
            echo json_encode(["ok" => false, "msg" => "Formato de imagen no permitido"]);
            exit;
        }
        
        
    }
    // 5. INSERTAR EN LA BASE DE DATOS
    $sql = "INSERT INTO aplicacion (nombre, descripcion, id_tipo_aplicacion, forma_acceso, url, ubicacion_imagen, estado) 
            VALUES (?, ?, ?, ?, ?, ?, 'ACTIVO')";

    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        echo json_encode(["ok" => false, "msg" => "Error SQL: " . $conn->error]);
        exit;
    }

    $stmt->bind_param("ssisss", $nombre, $descripcion, $tipoapp, $forma_acceso, $url, $nombreArchivoFinal);

    if ($stmt->execute()) {
        $id_nuevo = $stmt->insert_id;
        $sqlSelect = "SELECT a.*, t.nombre AS nombre_tipo_app 
                  FROM aplicacion a 
                  LEFT JOIN tipo_aplicacion t ON a.id_tipo_aplicacion = t.id_tipo_aplicacion 
                  WHERE a.id_aplicacion = ?";
        $query = $conn->prepare($sqlSelect);
        if ($query) {
            $query->bind_param("i", $id_nuevo);
            $query->execute();
            $nuevaApp = $query->get_result()->fetch_assoc();

            echo json_encode([
                "ok" => true, 
                "msg" => "Aplicación creada exitosamente",
                "aplicacion" => $nuevaApp
            ]);
        } else {
            // Si falla el select, al menos confirmamos el guardado
            echo json_encode(["ok" => true, "msg" => "Aplicación guardada (recargar para ver cambios)"]);
        }
    } else {
        echo json_encode(["ok" => false, "msg" => "Error al guardar: " . $stmt->error]);
    }

    $stmt->close();
    $conn->close();
?>
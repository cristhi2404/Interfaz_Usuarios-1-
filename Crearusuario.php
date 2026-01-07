<?php

    include 'conexion.php';
    header('Content-Type: application/json; charset=utf-8');
    if(!$conn){
        echo json_encode(["success" => false, "message" => "Error de conexion a la base de datos"]);
        exit();
    }
    $nombre = mb_strtoupper($_POST['nombre'] ?? '', 'UTF-8');
    $documento = $_POST['numero_documento'] ?? '';
    $cargo = $_POST['cargo'] ?? '';
    $correo = $_POST['correo'] ?? '';
    $celular = $_POST['celular'] ?? '';
    $Ubicacion = $_POST['Id_ubicacion'] ?? 0;
    $tipoDoc = $_POST['id_tipo_documento'] ?? 0;
    $Tipoproceso = $_POST['tipo_proceso'] ?? 0;
    $lineaFija = $_POST['linea_fija'] ?? '';
    if (empty($nombre) || empty($documento) || empty($cargo) || empty($correo) || empty($celular) || $Ubicacion==0    || $tipoDoc==0 || $Tipoproceso==0) {
        echo json_encode(["ok" => false, "msg" => "nombre, cargo, correo, celular, tipo de documentos, numero de documento, proceso, ubicacion son obligatorios"]);
        exit; 
    } 
    $rutaImagen = null;
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
        $file = $_FILES['imagen'];
        $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
        
        $nombreLimpio = preg_replace('/[^a-zA-Z0-9]/', '_', $nombre);
        $nombreCarpetaUsuario = $nombreLimpio . "_" . $documento;
        $carpetaDestino = __DIR__ . "/imgusers/" . $nombreCarpetaUsuario . "/"; 
        
        
        if (!file_exists($carpetaDestino)) {
            mkdir($carpetaDestino, 0777, true);
        }
        $nombreArchivo = "perfil_" . uniqid() . "." . $ext;
        if (move_uploaded_file($file['tmp_name'], $carpetaDestino . $nombreArchivo)) {
            $rutaImagen = "imgusers/" . $nombreCarpetaUsuario . "/" . $nombreArchivo;
        }
        
    }
    // 5. INSERTAR EN LA BASE DE DATOS
    $sql = "INSERT INTO empleado (nombre, numero_documento, cargo, correo, celular, linea_fija, Id_ubicacion, id_tipo_documento, id_proceso, imagen, estado) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Activo')";

    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        echo json_encode(["ok" => false, "msg" => "Error SQL: " . $conn->error]);
        exit;
    }

    $stmt->bind_param("sssssssiis", $nombre, $documento, $cargo, $correo, $celular, $lineaFija, $Ubicacion, $tipoDoc, $Tipoproceso, $rutaImagen);

    if ($stmt->execute()) {
        echo json_encode(["ok" => true, "msg" => "Usuario creado exitosamente"]);
    } else {
        echo json_encode(["ok" => false, "msg" => "Error al guardar: " . $stmt->error]);
    }

    $stmt->close();
    $conn->close();
?>
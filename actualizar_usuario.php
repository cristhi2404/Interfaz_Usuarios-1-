<?php
include 'conexion.php';
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_empleado = $_POST['id_empleado'] ?? null;
    $id_proceso  = $_POST['id_proceso'] ?? null;
    $nombre = $_POST['nombre']?? '';
    $cargo = $_POST['cargo']?? '';
    $id_tipo_documento = $_POST['id_tipo_documento'] ?? null;
    $numero_documento = $_POST['numero_documento'] ?? '';
    $correo = $_POST['correo']?? '';
    $estado = $_POST['estado']?? '';
    $celular = $_POST['celular']?? '';
    $linea_fija = $_POST['linea_fija']?? '';
    $ubicacion = $_POST['ubicacion'];

    if (!$id_empleado) {
        echo json_encode(["ok" => false, "msg" => "ID de empleado no proporcionado"]);
        exit;
    }


    $sql = "UPDATE empleado 
            SET  id_proceso=?, nombre=?, cargo=?, id_tipo_documento=?, numero_documento=?, correo=?, celular=?, linea_fija=?, ubicacion=?, estado=?
            WHERE id_empleado=?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ississssssi", $id_proceso,$nombre, $cargo, $id_tipo_documento, $numero_documento, $correo, $celular, $linea_fija, $ubicacion, $estado, $id_empleado);

    if ($stmt->execute()) {
    // Traer de nuevo el registro actualizado
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
} else {
    echo json_encode(["ok" => false, "msg" => "Método no permitido"]);
}
?>
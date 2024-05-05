<?php
include('../db.php');

if (!isset ($_POST['usuario'], $_POST['password'])) {
    // si no hay datos muestra error y re direcciona
    header('Location: ../login_view.php');
}

// evitar inyección sql
if ($stmt = $conn->prepare('SELECT id,Password FROM usuarios WHERE Usuario = ?')) {
    // parámetros de enlace de la cadena s
    $stmt->bind_param('s', $_POST['usuario']);
    $stmt->execute();
}

// acá se valida si lo ingresado coincide con la base de datos
$stmt->store_result();
if ($stmt->num_rows > 0) {
    $stmt->bind_result($id, $password);
    $stmt->fetch();

    // se confirma que la cuenta existe ahora validamos la contraseña
    if ($_POST['password'] == $password) {
        // la conexion sería exitosa, se crea la sesión
        session_regenerate_id();
        $_SESSION['loggedin'] = TRUE;
        $_SESSION['id'] = $id;
        header('Location: ../inicio.php');
    } else{
        $_SESSION['message'] = 'Contraseña Incorrecta. Por favor revise su información e intente nuevamente.';
        $_SESSION['message_type'] = 'danger';
        header('Location: ../login_view.php');
    }
} else {
    // usuario incorrecto
    $_SESSION['message'] = 'Usuario no existente. Por favor revise su información e intente nuevamente';
    $_SESSION['message_type'] = 'danger';
    header('Location: ../login_view.php');
}
$stmt->close();
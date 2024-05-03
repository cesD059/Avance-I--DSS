<?php
include ('db.php');
include ('includes/head.php');


if (isset ($_POST['registrar'])) {
    $usuario = $_POST['usuario'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    $query_validacion = "SELECT * FROM usuarios WHERE Usuario = '$usuario' OR Password = '$password'";
    $query_registro = "INSERT INTO usuarios(Usuario,Correo,Password) VALUES ('$usuario', '$email', '$password')";

    $result = mysqli_query($conn, $query_validacion);

    if (mysqli_fetch_array($result)) {
        $_SESSION['message'] = 'Porfavor, ingrese otro usuario o contraseña';
        $_SESSION['message_type'] = 'danger';
    } else {
        $result_registro = mysqli_query($conn, $query_registro);
        if (!$result_registro) {
            $_SESSION['message'] = 'Operacion fallida, intente más tarde';
            $_SESSION['message_type'] = 'danger';
        } else {
            $_SESSION['message'] = '¡Usuario registrado con exito!';
            $_SESSION['message_type'] = 'success';
        }
    }
}

?>

<?php if (isset($_SESSION['message'])) { ?>
    <div class="alert alert-<?= $_SESSION['message_type'] ?> alert-dismissible fade show" role="alert">
        <?= $_SESSION['message'] ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <?php
    unset($_SESSION['message']);
    unset($_SESSION['message_type']);
} ?>

<h1 class="display-4 text-center mt-5">Registro de Usuario</h1>

<form  class="form" action="registrar_usuario.php" method="post">
    <div class="left-section">
        <div class="form-item">
            <label for="usuario">Nombre de Usuario:</label>
            <input type="text" id="usuario" name="usuario" required>
        </div>
        <div class="form-item">
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <input type="submit" name="registrar" value="Registrar">
        <input type="reset" value="Limpiar">
    </div>
    <div class="right-section">
        <div class="form-item">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-item">
        </div>
    </div>
    <a href="login_view.php">Regresar a Log-In</a>
</form>

<?php
include ('includes/footer.php');
?>
<?php
include ('includes/head.php');
?>

<div class="login">
    
<?php if (isset($_SESSION['message'])) { ?>
    <div class="alert alert-<?= $_SESSION['message_type'] ?> alert-dismissible fade show" role="alert">
        <?= $_SESSION['message'] ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <?php
    unset($_SESSION['message']);
    unset($_SESSION['message_type']);
} ?>

    <h1 class="display-2 text-center mt-2">MyBooks - Log-In</h1>

    <div class="login-content">
        <form class='form' action="login_validacion.php" method="post">
            <div class="form-item">
                <img src="img\login.png" alt="Imagen de login" class="login-image">
            </div>

            <div class="form-section">
                <div class="form-item">
                    <label for="usuario">
                        <img src="img\iconos\icons8-username-50.png" alt="Icono Usuario" class="icono">
                        Usuario
                    </label>
                    <input type="text" name="usuario" placeholder="Usuario" id="usuario" required>
                </div>

                <div class="form-item">
                    <label for="password">
                        <img src="img\iconos\icons8-password-30.png" alt="Icono Usuario" class="icono">
                        Contraseña
                    </label>
                    <input type="password" name="password" placeholder="Password" id="password" minlength="8" required>
                </div>

                <div class="form-item">
                    <input type="submit" value="Acceder">
                </div>

                <div class="form-item">
                    <a href="registrar_usuario.php">¿Sin usuario? Regístrese aquí</a>
                </div>
            </div>
        </form>
    </div>
</div>

<?php
include ('includes/footer.php');
?>


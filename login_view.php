<?php
include ('includes/head.php');
?>

<div class="login">
    
<?php if (isset ($_SESSION['message'])) { ?>
    <div class="alert alert-<?= $_SESSION['message_type'] ?> alert-dismissible fade show" role="alert">
        <?= $_SESSION['message'] ?>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <?php
    unset($_SESSION['message']);
    unset($_SESSION['message_type']);
} ?>

    <h1 class="display-4 text-center mt-5">MyBooks - Log-In</h1>

    <form class='form' action="login_validacion.php" method="post">
    <div class="left-section">
        <div class="form-item">
        <label for="usuario">
        <img src="img\iconos\icons8-username-50.png" alt="Icono Usuario" class="icono">
        </label>
        <input type="text" name="usuario" placeholder="Usuario" id="usuario" required>
        </div>
        <input type="submit" value="Acceder">
    </div>
    <div class="right-section">
        <div class="form-item">
        <label for="password">
        <img src="img\iconos\icons8-password-30.png" alt="Icono Usuario" class="icono">
        </label>
        <input type="password" name="password" placeholder="password" id="password" minlength="8" required>
        </div>
    </div>
    <a href="registrar_usuario.php">¿Sin usuario? Registrese aquí</a>
    </form>
</div>

<?php
include ('includes/footer.php');
?>
<div class="container mt-5">
        <?php
            // Verificar si hay un mensaje para mostrar
            if (!empty($mensaje)) {
                // Mostrar mensaje dentro de una alerta de Bootstrap
                echo '<div class="alert alert-danger" role="alert">';
                echo $mensaje;
                echo '</div>';
            }
        ?>
</div>
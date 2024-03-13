<?php
include('db.php');
include('includes/head.php');
include('includes/navbar.php');

?>

<br>

<h1 class="display-4 text-center mt-5">Autores</h1>

<div class="row justify-content-center">
    <div class="col text-center">
        <a href="autor_acciones/add_autor.php" class="btn btn-success">Agregar nuevo autor</a>
    </div>
</div>

<br>

<!-- DIV donde se muestran los autores -->
<div class="container-fluid">
    <div class="row contenedor_galeria">
        <?php
        $query = "SELECT * FROM autores";

        $result = mysqli_query($conn, $query);

        while ($row = mysqli_fetch_array($result)) { ?>

            <div class='col-md-3'>
                <div class='card' style='width: 18rem;'>
                    <div class='card-body'>
                        <h5 class='card-title'>
                            <?php echo $row['nombre'] ?>
                        </h5>
                        <p class='card-text'>Nacimiento:
                            <?php echo $row['nacimiento'] ?>
                        </p>
                        <p class='card-text'>Nacionalidad:
                            <?php echo $row['nacionalidad'] ?>
                        </p>
                        <p class='card-text'>
                            <?php echo $row['descripcion'] ?>
                        </p>
                        <a href="autor_acciones/edit_autor.php?id=<?php echo $row['id'] ?>"
                            class='btn btn-primary btn-eliminar'>Editar</a>
                        <a href="autor_acciones/delete_autor.php?id=<?php echo $row['id'] ?>"
                            class='btn btn-danger btn-eliminar'>Eliminar</a>
                    </div>
                </div>
            </div>
            <?php
        } ?>
    </div>
</div>

<?php
include('includes/footer.php');
?>
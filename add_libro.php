<?php
include ('includes/head.php');
include ('db.php');
$usuario = $_SESSION['id'];

if (isset ($_POST['save'])) {
    $title = $_POST['titulo'];
    $autor = $_POST['autor'];
    $url = $_POST['url'];
    $descripcion = $_POST['descripcion'];
    $categoria = $_POST['categoria'];
    $estado = $_POST['estado'];

    if ($url == '') {
        $url = 'img/stock.jpg';
    }
    if ($descripcion == '') {
        $descripcion = 'Sin información';
    }

    $add_libro_query = "INSERT INTO libros (titulo,url_img,descripcion,autor_id,estado_id,categoria_id,id_usuario) 
    VALUES ('$title', '$url', '$descripcion','$autor', '$estado', '$categoria', '$usuario')";
    $result = mysqli_query($conn, $add_libro_query);

    if (!$result) {
        die ("Operación fallida");
    }

    $_SESSION['message'] = 'Libro añadido con exito';
    $_SESSION['message_type'] = 'success';
    header('Location: librosObtenidos_gallery.php');
}

include ('includes/navbar.php');

?>

<h1 class="display-4 text-center mt-5">Nuevo Libro</h1>

<!-- Form para agregar nuevo libro -->
<form class="form" id="NuevoLibro_Form" action="add_libro.php" method="POST">
    <div class="left-section">
        <div class="form-item">
            <label for="nombre">Titulo:</label>
            <input type="text" id="titulo" name="titulo" placeholder="Introduzca el titulo del libro" required
                minlength="1">
        </div>
        <div class="form-item">
            <label for="autor">Autor:</label>
            <select id="autor" name="autor" required>
                <?php

                $getAutors_query = "SELECT * FROM autores WHERE id_usuario = '$usuario'";
                $autores = mysqli_query($conn, $getAutors_query);

                while ($row = mysqli_fetch_array($autores)) { ?>
                    <option value="<?php echo $row['id'] ?>">
                        <?php echo $row['nombre'] ?>
                    </option>
                <?php
                } ?>

            </select>
            <small><a href="Autores.php">Agregue autores aquí</a></small>
        </div>
        <div class="form-item">
            <label for="url">URL Imagen (Opcional):</label>
            <input type="url" id="url" name="url" placeholder="Introduzca su Imagen" Opcional>

        </div>
        <input type="submit" name="save" value="Guardar Información" />
        <input type="reset" value="Limpiar">
    </div>
    <div class="right-section">
        <div class="form-item">
            <label for="categoria">Categoría:</label>
            <select id="categoria" name="categoria">
                <option value="1">Romance</option>
                <option value="2">Novela</option>
                <option value="3">Fantasía</option>
                <option value="5">Ciencia Ficción</option>
                <option value="4">Misterio</option>
                <option value="6">Biografía</option>
                <option value="7">Terror</option>
                <option value="8">Drama</option>
                <option value="9">Aventura</option>
                <option value="10">Historia</option>
            </select>
        </div>
        <div class="form-item">
            <label for="estado">Estado:</label>
            <select id="estado" name="estado">
                <option value="1">¡Obtenido!</option>
                <option value="2">Deseado</option>
            </select>
        </div>
        <div class="form-item">
            <label for="descripcion">Información adicional:</label>
            <textarea name="descripcion" placeholder="Introduzca sus opiniones o datos interesantes!"></textarea>
        </div>
    </div>
</form>

<?php
include ('includes/footer.php');
?>
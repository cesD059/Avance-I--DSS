<?php	
include('db.php');

if (isset($_POST['save'])) {
    $usuario = '1';
    $title = $_POST['titulo'];
    $autor = $_POST['autor'];
    $url = $_POST['url'];
    $categoria = $_POST['categoria'];
    $estado = $_POST['estado'];

    $add_libro_query = "INSERT INTO libros (titulo,url_img,autor_id,estado_id,categoria_id,id_usuario) 
    VALUES ('$title', '$url', '$autor', '$estado', '$categoria', '$usuario')";
    $result = mysqli_query($conn, $add_libro_query);

    if(!$result) {
        die("Operación fallida");
    }

    header('Location: librosObtenidos_gallery.php');
  }

  include('includes/navbar.php');

?>


<h1 class="display-4 text-center mt-5">Nuevo Libro</h1>

    <!-- Form para agregar nuevo libro -->
    <form class="form" id="NuevoLibro_Form" action="add_libro.php" method="POST">
        <div class="left-section">
            <div class="form-item">
                <label for="nombre">Titulo:</label>
                <input type="text" id="titulo" name="titulo" placeholder="">
            </div>
            <div class="form-item">
                <label for="autor">Autor:</label>
                <select id="autor" name="autor">
            <?php 
            $getAutors_query = "SELECT * FROM autores";
            $autores = mysqli_query($conn, $getAutors_query);
            
            while($row = mysqli_fetch_array($autores)){?>
                <option value="<?php echo $row['id'] ?>"><?php echo $row['nombre'] ?></option>
            <?php } ?>
                </select>
            </div>
            <div class="form-item">
                <label for="autor">URL Imagen (Opcional):</label>
                <input type="text" id="url" name="url" placeholder="">
            </div>
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
        </div>

        <input type="submit" name="save" value="Guardar Información"/>
    </form>

<?php
include('includes/footer.php')
?>
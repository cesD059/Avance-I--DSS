<?php
include("db.php");
$title = '';
$url= '';
$descripcion = '';
$autor= '';
$estado= '';
$categoria= '';

//Se llaman a la BD los datos del ID correspondiente
if  (isset($_GET['id'])) {
  $id = $_GET['id'];

  $query = "SELECT * FROM libros WHERE id=$id";

  $result = mysqli_query($conn, $query);

  if (mysqli_num_rows($result) == 1) {
    $row = mysqli_fetch_array($result);

    $title = $row['titulo'];
    $url = $row['url_img'];
    $descripcion = $row['descripcion'];
    $autor = $row['autor_id'];
    $categoria = $row['categoria_id'];
    $estado = $row['estado_id'];
  }
}

//En caso de presionar botón 'update' se guardan los nuevos datos
if (isset($_POST['update'])) {
  $usuario = '1';
  $title = $_POST['titulo'];
  $url = $_POST['url'];
  $descripcion = $_POST['descripcion'];
  $autor = $_POST['autor'];
  $categoria = $_POST['categoria'];
  $estado = $_POST['estado'];

  if($url == '') {
    $url = 'img/stock.jpg';
    }
    if($descripcion == ''){
      $descripcion = 'Sin información';
  }

  $query = "UPDATE libros set titulo = '$title',
  url_img = '$url', descripcion = '$descripcion', autor_id = '$autor', categoria_id = '$categoria', estado_id = '$estado', id_usuario = '$usuario' WHERE id=$id";

  mysqli_query($conn, $query);

  $_SESSION['message'] = 'Libro editado con exito';
  $_SESSION['message_type'] = 'success';
  header('Location: librosObtenidos_gallery.php');
}

include('includes/head.php');
include('includes/navbar.php');
?>

<h1 class="display-4 text-center mt-5">Editar Libro</h1>
      <!-- Form para editar libro -->
      <form class="form" id="NuevoLibro_Form" action="edit_libro.php?id=<?php echo $_GET['id']; ?>" method="POST">
        <div class="left-section">
            <div class="form-item">
                <label for="nombre">Titulo:</label>
                <input type="text" id="titulo" name="titulo" required minlength="1" value="<?php echo $title; ?>" placeholder="Introduzca el titulo del libro">
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
                <label for="url">URL Imagen (Opcional):</label>
                <input type="url" id="url" name="url" placeholder="Introduza una imagen" Opcional pattern=".+\" value="<?php echo $url; ?>" >
            </div>
            <input type="submit" name="update" value="Guardar Información"/>
            <input type ="reset" value="Limpiar">
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
                    <textarea name="descripcion" placeholder="Introduzca sus opiniones o datos interesantes!"><?php echo $descripcion; ?></textarea>
            </div>
        </div>
    </form>
              
<?php include('includes/footer.php'); ?>
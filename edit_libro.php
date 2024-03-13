<?php
include("db.php");
$title = '';
$url= '';
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
    $autor = $row['autor_id'];
    $categoria = $row['categoria_id'];
    $estado = $row['estado_id'];
  }
}

//En caso de presionar botón 'update' se guardan los nuevos datos
if (isset($_POST['update'])) {
  $usuario = '1';
  $title = $_POST['titulo'];
  $autor = $_POST['autor'];
  $url = $_POST['url'];
  $categoria = $_POST['categoria'];
  $estado = $_POST['estado'];

  $query = "UPDATE libros set titulo = '$title',
  url_img = '$url', autor_id = '$autor', categoria_id = '$categoria', estado_id = '$estado', id_usuario = '$usuario' WHERE id=$id";

  mysqli_query($conn, $query);

  header('Location: librosObtenidos_gallery.php');
}

include('includes/head.php');
include('includes/navbar.php');
?>

<div class="container p-4">
  <div class="row">
    <div class="col-md-4 mx-auto">
      <div class="card card-body">

      <!-- Form para editar libro -->
      <form class="form" id="NuevoLibro_Form" action="edit_libro.php?id=<?php echo $_GET['id']; ?>" method="POST">
        <div class="left-section">
            <div class="form-item">
                <label for="nombre">Titulo:</label>
                <input type="text" id="titulo" name="titulo" value="<?php echo $title; ?>" placeholder="">
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
                <input type="text" id="url" name="url" placeholder="" value="<?php echo $url; ?>">
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

        <input type="submit" name="update" value="Guardar Información"/>
    </form>


      </div>
    </div>
  </div>
</div>
<?php include('includes/footer.php'); ?>
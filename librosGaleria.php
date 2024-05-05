<?php

//Codigo Incluido (Head, NavBar y Conexión a Base de datos)
include ('includes/head.php');
include ('includes/navbar.php');
include ('db.php');
include ('validaciones/validaciones_estado.php');

$mensaje = ""; //Inicialización de variable
$query = "CALL obtener_libros()"; //Query Default, llama Todos los libros


if (isset($_POST['buscar_categoria'])) {
  $categoria = $_POST['categoria_seleccionada'];
  if ($categoria != 0) {
    $query = "CALL obtener_libros_por_categoria($categoria)"; //Query llama libros por categoria
  }
}

$result_libros = mysqli_query($conn, $query); //Se ejecuta Query

//Se asigna mensaje si no hay libros que coincidan 
if (mysqli_num_rows($result_libros) < 1) {
  $mensaje = "No hemos encontrado libros :(";
}
?>

<br>

<!-- Alerta desechable -->
<?php if (isset($_SESSION['message'])) { ?>
  <div class="alert alert-<?= $_SESSION['message_type'] ?> alert-dismissible fade show" role="alert">
    <?= $_SESSION['message'] ?>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
  <?php
  unset($_SESSION['message']);
  unset($_SESSION['message_type']);
}

echo "<h1 class='display-4 text-center mt-5'>Libros " . $_SESSION['estado'] . "s</h1>"; // Titulo de pagina
?>

<!-- Botones para Agregar libro y Buscar Categoria  -->
<div class="row justify-content-center">
  <div class="col-md-6">
    <a href="add_libro.php" class="btn btn-success" id="agregar_libro">Agregar nuevo libro</a>
  </div>
  <div class="col-md-6">

    <!-- Form de busqueda por categoria -->
    <form action="librosGaleria.php" method="POST">
      <div class="row">
        <div class="col-md-6">
          <select id="categoria_seleccionada" name="categoria_seleccionada" class="form-select">
            <option value="0">Mostrar Todos</option>
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
        <div class="col-md-6">
          <input type="submit" name="buscar_categoria" value="Buscar Categoría" id="seleccionar_categoria"
            class="btn btn-book" />
        </div>
      </div>
    </form>
  </div>
</div>

<br>

<div class="container-fluid">

  <!-- DIV donde se muestran los libros -->
  <div class="row contenedor_galeria">
    <?php

    echo "<p class='mensaje'>$mensaje</p>"; //Mensaje si NO hay libros coincidentes con categoria.
    
    while ($row = mysqli_fetch_array($result_libros)) {

      if ($row['estado'] == $_SESSION['estado'] && $row['usuario'] == $_SESSION['id']) { ?>

        <div class='col-md-3'>
          <div class='card' style='width: 18rem;'>
            <img src='<?php echo $row['url_img'] ?>' class='card-img-top' alt='Ha habido problemas al cargar la imagen :('>
            <div class='card-body'>
              <h5 class='card-title'>
                <?php echo $row['titulo'] ?>
              </h5>
              <p class='card-text'>
                <?php echo $row['autor'] ?>
              </p>
              <p class='card-text'>
                <?php echo $row['categoria'] ?>
              </p>
              <p class='card-text'>
                <?php echo $row['descripcion'] ?>
              </p>
              <a href="InformacionLibro.php?id=<?php echo $row['id'] ?>" class='btn btn-primary btn-eliminar'>Ver</a>
              <a href="edit_libro.php?id=<?php echo $row['id'] ?>" class='btn btn-warning btn-eliminar'>Editar</a>
              <a href="delete_libro.php?id=<?php echo $row['id'] ?>" class='btn btn-danger btn-eliminar'>Eliminar</a>
            </div>
          </div>
        </div>

        <?php
      }
    } ?>
  </div>
</div>

<?php
include ('includes/footer.php')
  ?>
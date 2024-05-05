<?php
include ('includes/head.php');
include ('includes/navbar.php');
include ('includes/sub-navbar.php');
include ('db.php');
$NombreCategoria = '';

$_SESSION['Categoria'] = isset($_GET['Categoria']) ? $_GET['Categoria'] : $_SESSION['Categoria'];
$CategoriaSolicitada = $_SESSION['Categoria'];

  //Se especifican queries a usar
  $queryObtenerCatalogo = "SELECT * FROM catalogo WHERE categoria_id=$CategoriaSolicitada";
  $queryNombreCategoria = "SELECT nombre FROM categorias WHERE id = $CategoriaSolicitada";

  //Se ejecutan los queries
  $Catalogo = mysqli_query($conn, $queryObtenerCatalogo);
  $CategoriaInfo = mysqli_query($conn, $queryNombreCategoria);

  if (mysqli_num_rows($CategoriaInfo) == 1){
  $row = mysqli_fetch_array($CategoriaInfo);
  $NombreCategoria = $row['nombre'];
  } else{
    $mensaje = "Categoria no encontrada en el cátalogo.";
  }


?>


  <br>
  <br>
  <div class="text-center">
  <label for="agregar_libro">¿Tu libro no se encuentra aquí?</label>
  <a href="add_libro.php" class="btn btn-book" id="agregar">Agrega uno por tu cuenta!</a>
  </div>

  <h1 class="display-4 text-center mt-5"><?= $NombreCategoria?></h1>
    <div class="galeria">

    <?php
    include ('includes/mensajeError.php'); //Se incluye codigo para mostrar mensajes al usuario
    while ($row = mysqli_fetch_array($Catalogo)) { ?>
    <div class="imagen">
      <img src=<?= $row['url_img']?> alt="Imagen 1">
      <div class="tarjeta">
        <h3><?= $row['titulo']?> </h3>
        <p> <?= $row['autor_nombre']?> </p>
        <p> <?= $row['descripcion']?> </p>
        <a href="Add_FromCatalogo.php?idCatalogo=<?= $row['id']?>&estado=1" class="btn_obtenido btn-light btn">Obtenido</a>
        <a href="Add_FromCatalogo.php?idCatalogo=<?= $row['id']?>&estado=2" class="btn_obtenido btn-light btn">Deseado</a>
      </div>
    </div>
    <?php
    }
    ?>

    </div>

  <?php
include ('includes/footer.php')
  ?>

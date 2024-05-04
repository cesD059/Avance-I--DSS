<?php
include ('includes/head.php');
include ('includes/navbar.php');
include ('includes/sub-navbar.php');
include ('db.php');

$_SESSION['Categoria'] = isset($_GET['Categoria']) ? $_GET['Categoria'] : $_SESSION['Categoria'];
$CategoriaSolicitada = $_SESSION['Categoria'];
  $query = "SELECT * FROM catalogo WHERE categoria_id=$CategoriaSolicitada";

  $result = mysqli_query($conn, $query);
?>


  <br>
  <br>
  <div class="text-center">
  <label for="agregar_libro">¿Tu libro no se encuentra aquí?</label>
  <a href="add_libro.php" class="btn btn-book" id="agregar">Agrega uno por tu cuenta!</a>
  </div>

  <h1 class="display-4 text-center mt-5">Ciencia Ficción</h1>
    <div class="galeria">

    <?php
    while ($row = mysqli_fetch_array($result)) { ?>
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

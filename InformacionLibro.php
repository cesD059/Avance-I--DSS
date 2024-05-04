<?php
include ('includes/head.php');
include ('includes/navbar.php');
include ('db.php');

if(isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT libros.id AS id, libros.titulo AS titulo, libros.url_img AS url_img, libros.descripcion AS descripcion, libros.reseña AS reseña, autores.nombre AS autor, categorias.nombre AS categoria, estados.nombre AS estado, libros.fechaAñadido AS fechaAñadido, libros.fechaCompra AS fechaCompra
    FROM libros
    INNER JOIN autores ON libros.autor_id = autores.id
    INNER JOIN categorias ON libros.categoria_id = categorias.id
    INNER JOIN estados ON libros.estado_id = estados.id 
     WHERE libros.id = $id";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_array($result);
    
        $title = $row['titulo'];
        $url = $row['url_img'];
        $descripcion = $row['descripcion'];
        $reseña = $row['reseña'];
        $autor = $row['autor'];
        $categoria = $row['categoria'];
        $estado = $row['estado'];
        $fechaCompra = $row['fechaCompra'];
        $fechaAñadido = $row['fechaAñadido'];
      } else{
        die("Libro no existe o no encontrado.");
      }
  }
?>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <div class="details-container">
                <h1><?php echo $title; ?></h1>
                <p><strong>Descripción:</strong> <?php echo $descripcion; ?></p>
                <p><strong>Reseña:</strong> <?php echo $reseña; ?></p>
                <p><strong>Autor:</strong> <?php echo $autor; ?></p>
                <p><strong>Categoría:</strong> <?php echo $categoria; ?></p>
                <p><strong>Estado:</strong> <?php echo $estado; ?></p>
                <p><strong>Fecha de compra:</strong> <?php echo $fechaCompra; ?></p>
                <small><strong>Libro registrado en:</strong> <?php echo $fechaAñadido; ?></small>
            </div>
        </div>
        <div class="col-md-6">
            <img src="<?php echo $url; ?>" class="img-fluid mb-3" alt="Portada del libro">
        </div>
    </div>
</div>

<?php
include ('includes/footer.php')
?>
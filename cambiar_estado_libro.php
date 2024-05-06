<?php
include('db.php');
    $id_libro = $_GET['id']; // ID del libro

    // Se actualiza el estado del libro
    $query = "UPDATE libros SET estado_id = 1 WHERE id = $id_libro";
    $result = mysqli_query($conn, $query);

    // Redireccionar si la consulta se ejecutó correctamente
    if ($result) {
        header('Location: librosGaleria.php?estado=Obtenido');
        exit(); 
    } else {
        echo "Error al cambiar el estado del libro.";
    }
?>

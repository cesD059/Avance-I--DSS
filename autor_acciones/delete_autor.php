<?php

include('../db.php');

if(isset($_GET['id'])) {
  $id = $_GET['id'];

  $query = "DELETE FROM autores WHERE id = $id";
  $result = mysqli_query($conn, $query);
  
  if(!$result) {
    die("El autor tiene libros registrados. No puede ser borrado");
  }
  $_SESSION['message'] = 'Autor borrado con exito';
  $_SESSION['message_type'] = 'danger';
  header('Location: ../Autores.php');
}

?>
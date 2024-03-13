<?php

include('../db.php');

if(isset($_GET['id'])) {
  $id = $_GET['id'];
  $query = "DELETE FROM autores WHERE id = $id";
  $result = mysqli_query($conn, $query);
  
  if(!$result) {
    die("Operación fallida.");
  }

  header('Location: ../Autores.php');
}

?>
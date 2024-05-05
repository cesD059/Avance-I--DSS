<?php
include ('includes/head.php');
include ('db.php');
$usuario = $_SESSION['id'];
$idCatalogo = $_GET['idCatalogo'];
$estado = $_GET['estado'];

$query = "SELECT * FROM catalogo WHERE id=$idCatalogo";

$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) == 1) {
    $row = mysqli_fetch_array($result);

    $titulo = $row['titulo'];
    $url = $row['url_img'];
    $descripcion = $row['descripcion'];
    $autor_nombre = $row['autor_nombre'];
    $autor_nacimiento = $row['autor_nacimiento'];
    $autor_nacionalidad = $row['autor_nacionalidad'];
    $categoria_id = $row['categoria_id'];
    echo "$titulo"." $autor_nombre";

    $SelectAutorQuery = "SELECT id FROM autores WHERE nombre = '$autor_nombre'";
    $resultAutor = mysqli_query($conn, $SelectAutorQuery);
        //Se comprueba que el Autor no exista en la base de datos
        if(mysqli_num_rows($resultAutor) == 0){
            //Si no hay coincidencias se inserta el nuevo autor
            $addAutor = "INSERT INTO autores (nombre,nacimiento,nacionalidad,id_usuario)
            VALUES ('$autor_nombre', '$autor_nacimiento', '$autor_nacionalidad','$usuario')";  
            mysqli_query($conn, $addAutor);  
            echo "Se añadio el autor";
        }

    //Se obtiene el ID del Autor recién ingresado
    $SelectIdAutor = "SELECT id FROM autores WHERE nombre = '$autor_nombre'";
    $result_SelectIdAutor = mysqli_query($conn, $SelectIdAutor);
    $rowAutor = mysqli_fetch_array($result_SelectIdAutor);
    $IdAutor = $rowAutor['id'];


    $InsertLibro = "INSERT INTO libros (titulo,url_img,descripcion,autor_id,categoria_id,estado_id,id_usuario) 
    VALUES('$titulo','$url','$descripcion','$IdAutor','$categoria_id','$estado','$usuario')";
    $resultlibro = mysqli_query($conn, $InsertLibro);

    if (!$resultlibro) {
        die ("Operación fallida");
    }

    $_SESSION['message'] = 'Libro añadido con exito';
    $_SESSION['message_type'] = 'success';
    header("Location: librosGaleria.php?estado=$estado");

  }


?>
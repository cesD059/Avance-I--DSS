<?php
include ('includes/head.php');
include ('db.php');

$usuario = $_SESSION['id'];
$idCatalogo = $_GET['idCatalogo'];
$estado = $_GET['estado'];

//Busqueda del libro del catalogo
$query = "SELECT * FROM catalogo WHERE id=$idCatalogo"; 
$result = mysqli_query($conn, $query);

//Si el libro del catalogo existe, se procede a insertarlo a los registros del usuario
if (mysqli_num_rows($result) == 1) {
    $row = mysqli_fetch_array($result);

    //Datos del libro
    $titulo = $row['titulo'];
    $url = $row['url_img'];
    $descripcion = $row['descripcion'];
    $autor_nombre = $row['autor_nombre'];
    $autor_nacimiento = $row['autor_nacimiento'];
    $autor_nacionalidad = $row['autor_nacionalidad'];
    $categoria_id = $row['categoria_id'];

    //Se busca si el nombre de autor esta registrado
    $SelectAutorQuery = "SELECT id FROM autores WHERE nombre = '$autor_nombre' AND id_usuario = '$usuario'";
    $resultAutor = mysqli_query($conn, $SelectAutorQuery);

        //Se verifica si el autor no existe en los registros del usuario actual.
        if($resultAutor != false && mysqli_num_rows($resultAutor) == 0){
            
            //Si no hay coincidencias se registra el nuevo autor
            $addAutor = "INSERT INTO autores (nombre,nacimiento,nacionalidad,id_usuario)
            VALUES ('$autor_nombre', '$autor_nacimiento', '$autor_nacionalidad','$usuario')";  
            mysqli_query($conn, $addAutor);  
        }

    //Se obtiene el ID del Autor, buscando por nombre e ID de Usuario
    $SelectIdAutor = "SELECT id FROM autores WHERE nombre = '$autor_nombre' AND id_usuario = '$usuario'";
    $result_SelectIdAutor = mysqli_query($conn, $SelectIdAutor);
    $rowAutor = mysqli_fetch_array($result_SelectIdAutor);
    $IdAutor = $rowAutor['id'];

    //Se inserta el registro del libro
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
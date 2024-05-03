<?php
include('includes/head.php');
include('includes/navbar.php');

session_start();
if (!isset($_SESSION['loggedin'])) {
    header('Location: login_view.php');
    exit;
}
?>

<h1 class="display-4 text-center mt-5">¡Bienvenido a MyBooks!</h1>
<h2 class="display-6 text-center mt-3">El lugar ideal para organizar su colleción de libros</h2>


<div class="container container-card">
    <div class="row">
        <div class="col">
            <div class="card card-inicio" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Registre sus libros</h5>
                    <p class="card-text">Añada información sobre sus libros favoritos</p>
                    <a href="add_libro.php" class="card-link">Añadir libro</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card card-inicio" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Clasifique sus Libros</h5>
                    <p class="card-text">Puede clasificar sus libros en "Obtenidos" o "Deseados".</p>
                    <a href="librosGaleria.php?estado=Obtenido" class="card-link">Ver Obtenidos</a>
                    <a href="librosGaleria.php?estado=Deseado" class="card-link">Ver Deseados</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card card-inicio" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Organice Autores</h5>
                    <p class="card-text">Mantenga un registro de sus autores favoritos</p>
                    <a href="autor_acciones\add_autor.php" class="card-link">Añadir Autor</a>
                    <a href="Autores.php" class="card-link">Ver mis Autores</a>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
include('includes/footer.php');
?>
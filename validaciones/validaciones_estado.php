<?php

// Verifica si se ha pasado un valor de ESTADO por GET
$_SESSION['estado'] = isset($_GET["estado"]) ? $_GET["estado"] : (isset($_SESSION['estado']) ? $_SESSION['estado'] : "Obtenido");

// Si se pasa valor por ID, asignarle su estado respectivo
if (isset($_GET["estado"])) {
  if ($_GET["estado"] == 1) {
    $_SESSION['estado'] = "Obtenido";
  } elseif ($_GET["estado"] == 2) {
    $_SESSION['estado'] = "Deseado";
  }
}

// Verifica si el valor de ESTADO es valido (Obtenido o Deseado)
if ($_SESSION['estado'] != "Obtenido" && $_SESSION['estado'] != "Deseado") {
  $_SESSION['estado'] = "Obtenido";
}
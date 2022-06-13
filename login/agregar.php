<?php
include ("conexion.php");
    $usuario = $_REQUEST['usuario'];
    $contrasena = $_REQUEST['contrasena'];

    $sql = "INSERT INTO usuarios (id,usuario,contrasena,estatus) VALUES(NULL,'$usuario','$contrasena',1)";
    
    $query = $connect->query($sql);
?>
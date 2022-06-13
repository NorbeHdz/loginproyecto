<?php

    require "conexion.php";

    $id = $_REQUEST['id'];
    $usuario= $_REQUEST['usuario'];
    $contrasena = $_REQUEST['contrasena'];

    $sql = "UPDATE usuarios SET usuario='$usuario',contrasena='$contrasena' WHERE id='$id'";
    
    $query = $connect->query($sql);

?>
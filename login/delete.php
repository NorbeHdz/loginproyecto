<?php

    require "conexion.php";
    
    $id = $_REQUEST['id'];
   
    $sql = "DELETE FROM usuarios WHERE id='$id'";
    $query = $connect->query($sql);

?>
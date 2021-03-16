<?php
    $id = $_GET['id'];
    $sql = "DELETE FROM makes WHERE makeId = '$id'";
    $query = mysqli_query($connect, $sql);
    header('location: ./index.php?page_layout=list');
?>
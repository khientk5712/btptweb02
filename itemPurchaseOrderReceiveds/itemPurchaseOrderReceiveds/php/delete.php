<?php
    require_once('config.php');
    $lotId = $_GET['lotId'];
    echo $lotId;
    $sql = "DELETE FROM `itempurchaseorderreceiveds` WHERE `lotId`='$lotId'";
    if ($result = mysqli_query($conn,$sql)) {
        echo "<h1>Xóa  thành công Click vào <a href='../index.php'>đây</a> để về trang danh sách</h1>";
        // header("Location:../index.php");
    }else{
        echo "<h1>Có lỗi xảy ra Click vào <a href='index.php'>đây</a> để về trang danh sách</h1>";
    }
    
   
?>
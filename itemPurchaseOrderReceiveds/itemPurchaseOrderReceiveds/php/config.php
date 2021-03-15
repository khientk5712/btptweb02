<?php
    $ketnoi['host']='localhost';
    $ketnoi['dbname']='u116687685_ptweb02';
    $ketnoi['username']='root';
    $ketnoi['password']='';
	$conn= mysqli_connect($ketnoi['host'],$ketnoi['username'], $ketnoi['password'], $ketnoi['dbname']);
    mysqli_set_charset($conn,'utf8');
	if(!$conn){
		echo "kết nối cơ sở dữ liệu không thành công!";
	}else{
        echo "";
    }
 ?>

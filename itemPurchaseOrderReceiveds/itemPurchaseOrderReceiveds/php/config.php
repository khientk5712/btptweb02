<?php
    $ketnoi['host']='localhost';
    $ketnoi['dbname']='u116687685_ptweb02';
    $ketnoi['username']='root';
    $ketnoi['password']='';
	$conn = mysqli_connect($ketnoi['host'],$ketnoi['username'], $ketnoi['password'], $ketnoi['dbname']);
    mysqli_set_charset($conn,'utf8');
	if(!$conn){
		die("kết nối cơ sở dữ liệu không thành công!");
	}
    function insertToDB($aryData){
        global $conn;
        $sql = "INSERT INTO itempurchaseorderreceiveds (" . implode(", ", array_keys($aryData)) . ") VALUES ('" . implode("', '", array_values($aryData)) . "')";
        return $conn->query($sql);
    }
    function updateDB($aryData){
        global $conn;
        $sql = "UPDATE itempurchaseorderreceiveds SET (" . implode(", ", array_keys($aryData)) . ") VALUES ('" . implode("', '", array_values($aryData)) . "')";
        return $conn->query($sql);}
 ?>
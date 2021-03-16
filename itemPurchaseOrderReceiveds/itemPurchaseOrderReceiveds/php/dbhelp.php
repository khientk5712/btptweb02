<?php
require_once('config.php');
/** 
 * insert,update,delete -> su dung function
*/
// function execute($sql) {
//     $conn =mysqli_connect(localhost,root,,u116687685_ptweb02);
//     mysqli_query($conn,$sql);
//     mysqli_close($conn);
// }

// function excuteResult($sql){
//     $conn =mysqli_connect(localhost,root,,u116687685_ptweb02);
//    $resulset = mysqli_query($conn,$sql);
//    $list     =[];
//    while ($row = mysqli_fetch_array($resultset,1))
//     {$list[]= $row;}
//    mysqli_close($conn);
//    return $list;
// }

//insert
// function insert($insData, $table){
//     $columns = implode(", ",array_keys($insData));
//     $escaped_values = array_map('mysql_real_escape_string', array_values($insData));
//     $values  = implode(", ", $escaped_values);
//     $sql = "INSERT INTO `{$table}`($columns) VALUES ($values)";
//     runQuery($sql);
// }
//Run query
function runQuery($query){
    global $conn;
    $result = mysqli_query($conn,$query);
    return $result;
}

//Fetch data
function fetchData($result){
    $data = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }
    return $data;

}
?>
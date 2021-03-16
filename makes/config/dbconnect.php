<?php
    // Database connection
    $connect = @mysqli_connect("localhost","root","");
    if($connect) {}
    else echo 'Kết nối thất bại';
    $DBSelect = @mysqli_select_db($connect,"u116687685_ptweb02"); 
?>

<?php
function autoNumber($string) {

$newstring = substr($string,4);
$convert = intval($newstring);
$convert += 1;

$num = 6;
if ($convert < 10) {
    $finalstring = "MAKE".str_repeat('0',($num-1)).$convert;
}
    else if ($convert < 100) {
        $finalstring = "MAKE".str_repeat('0',($num-2)).$convert;
}   else if ($convert < 1000) {
    $finalstring = "MAKE".str_repeat('0',($num-3)).$convert;
}   else if ($convert < 1000) {
    $finalstring = "MAKE".str_repeat('0',($num-4)).$convert;
}   else if ($convert < 10000) {
    $finalstring = "MAKE".str_repeat('0',($num-5)).$convert;
}   else if ($convert < 100000) {
    $finalstring = "MAKE".str_repeat('0',($num-6)).$convert;
}
return $finalstring;
}
?>
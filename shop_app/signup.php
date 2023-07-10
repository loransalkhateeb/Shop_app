<?php
if($_SERVER['REQUEST_METHOD']=='POST'){
    $Email=$_POST['email'];
    $pass=$_POST['pass'];
    require_once("dbconnect.php");
    $sql="INSERT INTO `user`(`email`,`pass`)
    VALUES('$Email','$pass');";
}
if(mysqli_query($con,$sql)){
     echo json_encode(array('result'=>true));
}
else{
        echo json_encode(array('result'=>false,"msg"=>"email or password is not exist"));
}
mysqli_close($con);
?>

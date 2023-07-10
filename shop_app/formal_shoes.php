<?php
require_once('dbconnect.php');
$sql="SELECT * FROM `formal_shoes` where `id_kind_shoes`='4'";
$r=mysqli_query($con,$sql);
$result=array();
while($row = mysqli_fetch_array($r)){   
    array_push($result,array(
        "id"=>$row['id'],   
        "classes_formal"=>$row['classes_formal'],
        "id_kind_shoes"=>$row['id_kind_shoes']
    ));
}
echo json_encode(array('formal_shoes'=>$result));
mysqli_close($con);


?>
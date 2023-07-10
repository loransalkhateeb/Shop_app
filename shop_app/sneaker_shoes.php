<?php
require_once('dbconnect.php');
$sql="SELECT * FROM `sneaker_shoes` where `id_kind_shoes`='2'";
$r=mysqli_query($con,$sql);
$result=array();
while($row = mysqli_fetch_array($r)){   
    array_push($result,array(
        "id"=>$row['id'],   
        "classes_sneaker"=>$row['classes_sneaker'],
        "id_kind_shoes"=>$row['id_kind_shoes']
    ));
}
echo json_encode(array('sneaker_shoes'=>$result));
mysqli_close($con);


?>
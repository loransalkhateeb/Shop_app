<?php
require_once('dbconnect.php');
$sql="SELECT * FROM `running_shoes` where `id_kind_shoes`='1'";
$r=mysqli_query($con,$sql);
$result=array();
while($row = mysqli_fetch_array($r)){   
    array_push($result,array(
        "id"=>$row['id'],   
        "classes_running"=>$row['classes_running'],
        "id_kind_shoes"=>$row['id_kind_shoes']
    ));
}
echo json_encode(array('running_shoes'=>$result));
mysqli_close($con);


?>
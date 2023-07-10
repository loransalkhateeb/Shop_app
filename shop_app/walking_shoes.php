<?php
require_once('dbconnect.php');
$sql="SELECT * FROM `wlking_shoes` where `id_kind_shoes`='3'";
$r=mysqli_query($con,$sql);
$result=array();
if($result){
    while($row = mysqli_fetch_array($r)){   
        array_push($result,array(
            "id"=>$row['id'],   
            "classes_wlking"=>$row['classes_wlking'],
            "id_kinds_shoes"=>$row['id_kinds_shoes']
        ));
    }
}   
echo json_encode(array('wlking_shoes'=>$result));
mysqli_close($con);


?>
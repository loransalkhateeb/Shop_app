<?php
require_once('dbconnect.php');
$sql="SELECT * FROM `kinds_shoes`";
$r=mysqli_query($con,$sql);
$result=array();
while($row=mysqli_fetch_array($r)){
    array_push($result,array(
        "id"=>$row['id'],
        "kind_shoes"=>$row['kind_shoes'],
    ));
}
echo json_encode(array('kinds'=>$result));
mysqli_close($con);
?>
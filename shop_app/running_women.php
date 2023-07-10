<?php
if($_SERVER['REQUEST_METHOD']=='POST'){
    $id_running_shoes=$_POST['id_running_shoes'];
    require_once('dbconnect.php');
    $sql="SELECT * FROM `running_women` where `id_running_shoes`='$id_running_shoes'";
    $r=mysqli_query($con,$sql);
    $result=array();
    while($row=mysqli_fetch_array($r)){
        array_push($result,array(
            "id"=>$row['id'],
            "images_urls"=>$row['images_urls'],
            "id_running_shoes"=>$row['id_running_shoes'],
            "imgae_url"=>$row['imgae_url'],
            "kind_shoes"=>$row['kind_shoes'],
            "des_shoes"=>$row['des_shoes'],
            "quality"=>$row['quality'],
            "price"=>(double)$row['price']
        ));
    }
    echo json_encode(array('running_women'=>$result));
    mysqli_close($con);
}

?>
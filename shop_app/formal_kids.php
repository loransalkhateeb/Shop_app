<?php
if($_SERVER['REQUEST_METHOD']=='POST'){
    $id_formal_shoes=$_POST['id_formal_shoes'];
    require_once('dbconnect.php');
    $sql="SELECT * FROM `fromal_kids` where `id_formal_shoes`='$id_formal_shoes'";
    $r=mysqli_query($con,$sql);
    $result=array();
    while($row=mysqli_fetch_array($r)){
        array_push($result,array(
            "id"=>$row['id'],
            "images_urls"=>$row['images_urls'],
            "id_formal_shoes"=>$row['id_formal_shoes'],
            "imgae_url"=>$row['imgae_url'],
            "kind_shoes"=>$row['kind_shoes'],
            "des_shoes"=>$row['des_shoes'],
            "quality"=>$row['quality'],
            "price"=>(double)$row['price']
        ));
    }
    echo json_encode(array('fromal_kids'=>$result));
    mysqli_close($con);
}

?>
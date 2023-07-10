<?php
if($_SERVER['REQUEST_METHOD']=='POST'){
    $id_kind_shoes=$_POST['id_kind_shoes'];
    $classs=$_POST['classs'];   
    require_once('dbconnect.php');
    $sql="SELECT * FROM `classes_shoes` where `id_kind_shoes`='$id_kind_shoes'
    and `classs`='$classs'";
    $r=mysqli_query($con,$sql);
    $result=array();
    if($r){
    while($row=mysqli_fetch_array($r)){
        array_push($result,array(
            "id [int]"=>$row['id [int]'],
            "classs"=>$row['classs'],
            "image_url"=>$row['image_url'],
            "kind"=>$row['kind'],
            "description"=>$row['description'],
            "quality"=>$row['quality'],
            "price"=>(double)$row['price'],
            "id_kind_shoes "=>$row['id_kind_shoes']
        ));
    }
}
    echo json_encode(array('classes_shoes'=>$result));
    mysqli_close($con);
}
   
?>
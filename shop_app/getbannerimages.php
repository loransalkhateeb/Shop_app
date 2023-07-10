<?php
if($_SERVER['REQUEST_METHOD']=='POST'){
    $id_kinds_shoes=$_POST['id_kinds_shoes'];
    $classs=$_POST['classs'];   
    require_once("dbconnect.php");
    $sql="SELECT * FROM `banner_images` where `id_kinds_shoes`='$id_kinds_shoes'
    and `classs`='$classs'";
    $r=mysqli_query($con,$sql);
    $result=array();
    if($r){
        while($row=mysqli_fetch_array($r)){
            array_push($result,array(
                "id"=>$row['id'],
                "classs"=>$row['classs'],
                "image_url"=>$row['image_url'],
                "id_kinds_shoes"=>$row['id_kinds_shoes']
            ));
        }
    }
    echo json_encode(array('banner_image'=>$result));
    mysqli_close($con);
}










?>
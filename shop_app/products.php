<?php
if($_SERVER['REQUEST_METHOD']=='POST'){
    $id_classs_shoes=$_POST['id_classs_shoes'];
    require_once("dbconnect.php");
    $sql="SELECT * from sub_category where `id_classs_shoes`='$id_classs_shoes'";
    $result1=mysqli_query($con,$sql);
    $result2=array();
    if($result1){
        while($row=mysqli_fetch_array($result1)){
            array_push(
                $result2,array(
                    "id"=>$row['id'],
                    "kind"=>$row['kind'],
                    "description"=>$row['description'],
                    "image_url"=>$row['image_url'],
                    "price"=>$row['price'],
                    "quality"=>$row['quality'],
                    "size"=>$row['size'],
                    "id_classs_shoes"=>$row['id_classs_shoes']
                )
            );
        }
    }
    echo json_encode(array('sub_category'=>$result2));
    mysqli_close($con);
}







?>
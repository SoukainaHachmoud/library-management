<?php
$connection = mysqli_connect("localhost","root","Ab111@@##","library");
if (!$connection)  
    die("could not connect".mysqli_connect_error());

  else 
  echo 'connection established';
  
 ?>

<?php
  require_once("../init.php");
  print_r($routes);
  echo "<br/>";
  $target =  matchRoute($config["relative_path"],$routes);

  if ($target != false)
    call_user_func_array($target[0]."::".$target[1],Array());
  else
    echo "Route not found!";

  //$smarty->testInstall();
 

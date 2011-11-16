<?php
function loadControllers($path){
    $files = glob($path);
    $list = array();
    foreach ($files as $file) {
        require($file);
        $list[] = ucwords(basename($file,".php"));
    }
    return $list;
}

function removeFromStart($str,$prefix){
  if (substr($str, 0, strlen($prefix) ) == $prefix) {
    $str = substr($str, strlen($prefix), strlen($str) );
  }
  return $str;
}

 

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

 

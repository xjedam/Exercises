<?php

class Welcome extends Application {

  protected static function index(){
    $resp = self::$db->array_select(array("CONTENT","SOLUTION", "CREATE_DATE", "DIFFICULTY"),"exercise", "deleted != 1 and hidden != 1");


    return array("exercises" => $resp);
  }
}

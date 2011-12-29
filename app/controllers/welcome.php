<?php

class Welcome extends Application {

  protected static function index(){
    $resp = self::$db->array_select(array("content","solution", "create_date", "difficulty"),"exercise", "deleted != ? and hidden != ?", array(1,1));

    return array("exercises" => $resp);
  }
}

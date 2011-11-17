<?php

class Exercises extends Application {
  protected static function index(){
    $costam = self::$db->u8e("costam");

    return array("costam" => $costam);
  }

  protected static function newform(){
  
  }

  protected static function create(){
    // normalnie jest dostep do $_POST[];
    $z_form = $_POST["content"];

    $fields = $_POST;
    $fields['create_date'] = date("Y-m-d H:i:s");

    self::$db->array_insert("exercise", $fields);
    return array("z_form" => $z_form);
  }
}

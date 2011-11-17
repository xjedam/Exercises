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

    return array("z_form" => $z_form);
  }
}

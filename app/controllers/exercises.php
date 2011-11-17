<?php

class Exercises extends Application {
  protected static function index(){
    $costam = self::$db->u8e("costam");

    return array("costam" => $costam);
  }
}

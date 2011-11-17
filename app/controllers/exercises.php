<?php

class Exercises extends Application {
  protected static function index(){
    $costam = self::$db;

    return array("costam" => $costam);
  }
}

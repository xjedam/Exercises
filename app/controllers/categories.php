<?php

class Categories extends Application {
  protected static function index(){

  }

  protected static function newform(){
      // formularz
    $resp = self::$db->array_select(array("id","name"),"category", "deleted != 1 and hidden != 1");

    return array("categories" => $resp);
  }

  protected static function create(){

    $fields = $_POST;
    self::$db->array_insert("category", $fields);

  }
}

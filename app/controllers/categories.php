<?php

class Categories extends Application {
  protected static function index(){
    $categories = self::recurse_children(0);

    return array("categories" => $categories);
  }

  protected static function newform(){
      // formularz
    $resp = self::$db->array_select(array("id","name"),"category", "deleted != 1 and hidden != 1");

    return array("categories" => $resp);
  }

  protected static function create(){

  }
  public static function recurse_children($parent_id=0){
    $categories = self::$db->array_select(array("id","name","parent_id"),"category", "deleted != 1 and hidden != 1 AND parent_id = ".$parent_id);
    foreach ($categories as $index => $category){
      $categories[$index]["children"] = self::recurse_children($category["id"]);
    }
    return $categories;
  }
}

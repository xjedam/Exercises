<?php

class Categories extends Application {
  protected static function index(){
    //getting root categories
    $categories = self::$db->array_select(array("id","name","parent_id"),"category", "deleted != ? and hidden != ? AND parent_id = ?", array(1, 1, 0));
    //recurring through children
    foreach ($categories as $index => $category){
      $categories[$index]["children"] = self::recurse_children($category["id"]);
    }

    return array("categories" => $categories);
  }

  protected static function newform(){
      // formularz
    $resp = self::$db->array_select(array("id","name"),"category", "deleted != ? and hidden != ?", array(1, 1));

    return array("categories" => $resp);
  }

  protected static function create(){

    $fields = $_POST;
    self::$db->array_insert("category", $fields);

  }
  public static function recurse_children($parent_id=0){
    $categories = self::$db->array_select(array("id","name","parent_id"),"category", "deleted != ? and hidden != ? AND parent_id = ?", array(1, 1, $parent_id));
    foreach ($categories as $index => $category){
      $categories[$index]["children"] = self::recurse_children($category["id"]);
    }
    return $categories;
  }
}

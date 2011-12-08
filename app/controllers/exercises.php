<?php

class Exercises extends Application {
  protected static function index(){
    $resp = self::$db->array_select(array("CONTENT","SOLUTION", "CREATE_DATE", "DIFFICULTY", "HIDDEN"),"exercise", "deleted != ?", array(1));

    return array("exercises" => $resp);
  }

  protected static function newform(){
    $resp = self::$db->array_select(array("name_short","id"),"category", "deleted != ? and hidden != ?", array(1, 1));

    return array("categories" => $resp);
  }

  protected static function create(){

    $fields = $_POST;
    $fields['create_date'] = date("Y-m-d H:i:s");
    $categories = $fields['category'];
    unset($fields['category']);

    $response = self::$db->array_insert("exercise", $fields);

    $lastId =  self::$db->getLastInsertedId();
    foreach($categories as $category){
      self::$db->array_insert("exercise_category", array('id_exercise' => $lastId, 'id_category' => $category['id']));
    }

  }
}

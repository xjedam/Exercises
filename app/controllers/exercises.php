<?php

class Exercises extends Application {
  protected static function index(){
    $resp = self::$db->array_select(array("content","solution", "create_date", "difficulty", "hidden"),"exercise", "deleted != ?", array(1));

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

    $fields['account_id'] = $_SESSION["userId"];
    //var_dump($fields);
    $response = self::$db->array_insert("exercise", $fields);
    //var_dump($response);
    $lastId =  self::$db->getLastInsertedId();
    foreach($categories as $category){
      self::$db->array_insert("exercise_category", array('id_exercise' => $lastId, 'id_category' => $category['id']));
    }
  }
  protected static function userslist(){
    $resp = self::$db->array_select(array("content","solution", "create_date", "difficulty", "hidden"),"exercise", "deleted != ? and account_id = ?", array(1, $_SESSION["userId"]));

    return array("exercises" => $resp);
  }


}

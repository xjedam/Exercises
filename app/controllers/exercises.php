<?php

class Exercises extends Application {
  protected static function index(){
    $resp = self::$db->array_select(array("content","solution", "create_date", "difficulty", "hidden"),"exercise", "deleted != ?", array(1));

    return array("exercises" => $resp);
  }

  protected static function newform(){
    global $config;
    if (!isset($_SESSION["userId"])){
      $_SESSION["error"] = "Musisz być zalogowany, aby dodać zadanie!";
      return $config["www"]["root_path"]."/uzytkownik";
    }
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
    $resp = self::$db->array_select(array("id","content","solution", "create_date", "difficulty", "hidden"),"exercise", "deleted != ? and account_id = ?", array(1, $_SESSION["userId"]));

    return array("exercises" => $resp);
  }

  protected static function edit(){
    $resp = self::$db->array_select(array("*"),"exercise", "id = ?", array($_POST["id"]));
    $resp2 = self::$db->array_select(array("category.id", "category.name_short"),"category", "id_exercise = ?", array($_POST["id"]), " inner join exercise_category on exercise_category.id_category = category.id ");
    $resp3 = self::$db->array_select(array("name_short","id"),"category", "deleted != ? and hidden != ?", array(1, 1));
    $selected = array();
    foreach($resp2 as $category){
      $selected[$category['id']] = 1;
    }
    return array("exercise" => $resp[0], "selected_categories" => $selected, "all_categories" => $resp3);
  }

  protected static function save(){
    //print_r($_POST);
    //print_r($_GET);
    $id = $_POST["id"];
    unset($_POST["id"]);
    $categories = $_POST['category'];
    unset($_POST['category']);
    $resp = self::$db->array_update("exercise", $_POST, "id = ?", array($id));
    //adding new categories
    foreach($categories as $category){
      if(!isset($_GET[$category["id"]])) {
        self::$db->array_insert("exercise_category", array('id_exercise' => $id, 'id_category' => $category['id']));
      }
    }
    //deleting unselected categories
    foreach($_GET as $beforeCat => $v){
      $unselected = 1;
      foreach($categories as $category){
        if($category["id"] == $beforeCat){
          $unselected = 0;
        }
      }
      if($unselected == 1) {
        self::$db->array_delete("exercise_category", "id_category = ? AND id_exercise = ?", array($beforeCat, $id));
      }
    }
    //echo(" aaa");
    //print_r($resp);
    return array("resp" => $resp);
  }

  protected static function show(){
    $_GET["id"];
    $resp = self::$db->array_select(array("*"),"exercise", "id = ?", array($_GET["id"]));
    return array("exercise" => $resp[0]);
  }


}

<?php

class Users extends Application {
  protected static function index(){

  }

  protected static function newform(){

  }

  protected static function create(){

  }

  protected static function login(){
    $fields = $_POST;

    $resp = self::$db->array_select(array("id","name", "ban_date", "ban_days"),"account", "nickname = ? and password = ?", array($fields["nickname"], md5($fields["password"])));
    //var_dump($resp);

    if(!empty($resp)){
      if(is_banned($resp[0]["ban_date"], $resp[0]["ban_days"])){
        echo "banned!";
      }
      $_SESSION["userName"] = $resp[0]["name"];
      $_SESSION["userId"] = $resp[0]["id"];
    }

    return array("user" => $resp);
  }

  protected static function is_banned($banDate, $banDays){
    $date = new DateTime($banDate);
    $date->add(new DateInterval('P'.$banDays.'D'));
    if($date > new DateTime())
      return true;
    return false;
  }
}

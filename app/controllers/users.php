<?php

class Users extends Application {
  protected static function index(){

  }

  protected static function newform(){

  }

  protected static function create(){

  }

  protected static function logout(){
      global $config;
      unset($_SESSION["userName"]);
      unset($_SESSION["userId"]);
      $_SESSION["notice"] = "Wylogowano pomyślnie.";
      return $config["www"]["root_path"];
  }
  protected static function login(){
      global $config;
    $fields = $_POST;

    $resp = self::$db->array_select(array("id","name", "ban_date", "ban_days"),"account", "nickname = ? and password = ?", array($fields["nickname"], md5($fields["password"])));
    //var_dump($resp);

    if(!empty($resp)){
      $_SESSION["userName"] = $resp[0]["name"];
      $_SESSION["userId"] = $resp[0]["id"];
      $_SESSION["notice"] = "Zalogowano pomyślnie.";
      return $config["www"]["root_path"];
    } else {
        $_SESSION["error"] = "Niepoprawny login bądź hasło!";
        return $config["www"]["root_path"]."/uzytkownik";
    }


  }

  protected static function is_banned($banDate, $banDays){
    $date = new DateTime($banDate);
    $date->add(new DateInterval('P'.$banDays.'D'));
    if($date > new DateTime())
      return true;
    return false;
  }
}

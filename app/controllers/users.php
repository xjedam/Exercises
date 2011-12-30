<?php

class Users extends Application {
  protected static function index(){

  }

  protected static function newform(){

  }

  protected static function create(){
    global $config;
    $fields = $_POST;
    if (empty($fields["nickname"]) || empty($fields["email"]) || empty($fields["password"])){
      $_SESSION["error"] = "Pseudonim, email oraz hasło są wymagane!";
      unset($fields["password"]);
      return $config["www"]["root_path"]."/uzytkownik/nowy?".http_build_query($fields);
    }
    $resp = self::$db->array_select(array("id","name"),"account", "nickname = ?", array($fields["nickname"]));
    if(!empty($resp)){
      $_SESSION["error"] = "Użytkownik o takim pseudonimie już istnieje!";
      unset($fields["password"]);
      return $config["www"]["root_path"]."/uzytkownik/nowy?".http_build_query($fields);
    }

    // zapisz do bazy
    $fields["password"] = md5($fields["password"]);
    $fields["group_id"] = 1;
    self::$db->array_insert("account", $fields);

    $_SESSION["notice"] = "Rejestracja przebiegła pomyślnie, możesz się teraz zalogować.";
    return $config["www"]["root_path"];
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

<?php

class Welcome extends Application {

  protected static function index(){
    $resp = self::$db->array_select(array("CONTENT","SOLUTION", "CREATE_DATE", "DIFFICULTY"),"exercise", "deleted != 1 and hidden != 1");
    $exercise_table = self::$db->array_to_html($resp);

    return array("exercise_table" => $exercise_table);
  }
}

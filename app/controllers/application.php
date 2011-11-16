<?php

class Application {

  public static function render_layout($view){
    global $smarty;
    $smarty->display(DIR_ROOT.'app/views/layout/application.tpl');
  }

  public static function __callStatic($name, $arguments) {
    $klass = get_called_class();
    call_user_func_array($klass."::".$name,$arguments);
    Application::render_layout("exercises/index");
  }
}

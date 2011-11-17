<?php

class Application {

  public static function render_layout($view,$variables){
    global $smarty;
    global $config;
    global $routes;
    foreach ($variables as $key => $value)
      $smarty->assign($key,$value);

    $smarty->assign("root",$config["www"]["root_path"]);
    $smarty->assign("routes",$routes);
    $smarty->assign("relative_path",$config["relative_path"]);
    $smarty->assign("yield",$smarty->fetch(DIR_ROOT.'app/views/'.$view.".tpl"));
    $smarty->display(DIR_ROOT.'app/views/layout/application.tpl');
  }

  public static function __callStatic($name, $arguments) {
    $klass = get_called_class();
    $public = call_user_func_array($klass."::".$name,$arguments);
    Application::render_layout(strtolower($klass)."/".strtolower($name),$public);
  }
}

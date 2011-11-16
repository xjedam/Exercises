<?php

	define('DIR_ROOT', dirname(__FILE__) . "/");
	define('DIR_CLASS', DIR_ROOT . 'class/');
    require_once "functions.php";
	require_once(DIR_CLASS . "dbmanager.php");
    require_once "lib/spyc.php"; // YAML
    require('lib/smarty/Smarty.class.php'); // Templates

	function __autoload($className)
	{
		if (is_readable(DIR_CLASS . strtolower($className) . '.php'))
			require_once DIR_CLASS . strtolower($className) . '.php';
	}

    /* load controllers */
    $controllers = loadControllers("app/controllers/*.php");

    /* parse and load config.yml */

    $config = Spyc::YAMLLoad('config.yml');

    /* Smarty templates */
  $smarty = new Smarty;
  $smarty->debugging = true;
  $smarty->caching = false;
  $smarty->cache_lifetime = 120;
  $smarty->setTemplateDir(DIR_ROOT.'tmp/smarty/templates');
  $smarty->setCompileDir(DIR_ROOT.'tmp/smarty/templates_c');
  $smarty->setCacheDir(DIR_ROOT.'tmp/smarty/cache');
  $smarty->setConfigDir(DIR_ROOT.'tmp/smarty/configs');

  session_start();

	$db = new DBManager($config["db"]["adapter"],$config["db"]["host"],$config["db"]["user"],$config["db"]["password"],$config["db"]["database"]);
?>
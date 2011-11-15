<?php

	define('DIR_ROOT', $_SERVER['DOCUMENT_ROOT'] . '/Exercises/'); 		
	define('DIR_CLASS', DIR_ROOT . 'class/');
	
	function __autoload($className)
	{
		if (is_readable(DIR_CLASS . strtolower($className) . '.php'))
			require_once DIR_CLASS . strtolower($className) . '.php';
	}
	
	require_once(DIR_CLASS . "dbmanager.php");
	
	session_start();
	
	$db = new DBManager();
?>
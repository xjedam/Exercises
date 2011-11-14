<?php

	define('DIR_ROOT', $_SERVER['DOCUMENT_ROOT'] . '/Exercises/'); 		
	define('DIR_CLASS', DIR_ROOT . 'class/');
	
	require_once(DIR_CLASS . "dbmanager.php");
	
	session_start();
	
	$db = new DBManager();
?>
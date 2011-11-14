<?php
class DBManager {
	protected $database;
	
	public function __construct() {
		try {
			$this->database = new PDO("mysql:host=localhost;dbname=exercises", "root", "");
		}
		catch(PDOException $e) {
			echo $e->getMessage()."<br />" ;
		}
		
    }
}
?>
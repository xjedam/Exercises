<?php
class DBManager {
	protected $database;
	
	public function __construct($adapter,$host,$user,$password,$database) {
		try {
			$this->database = new PDO("$adapter:host=$host;dbname=$database", "$user", "$password");
		}
		catch(PDOException $e) {
			echo $e->getMessage()."<br />" ;
		}
		
    }
	
	public function u8e($item){
		return utf8_encode($item);
	}
	
	public function u8d($item){
		return utf8_decode($item);
	}
	
	public function query_to_array($query_result){
		$data=array();
        if (!$query_result)
            return $data;
		foreach ($query_result as $row) {
			foreach ($row as $key => $value)
				if (is_integer($key))
					unset($row[$key]);
				else
					$row[$key] = $this->u8e($value);
            array_push($data,$row);
        }		
		return $data;
	}
	
	public function array_select($fields, $table, $condition = null){
		$q = "SELECT ".implode(",", $fields)." FROM ".($table);
		if($condition != null)
			$q .= " WHERE ".$this->u8d($condition);		
        $res = $this->database->query($q);
		return $this->query_to_array($res);
	}
	
	public function array_to_html($data, $headers = null){
		$result = "<table>";
		if ($headers !=null){
			$result .= "<tr>";
			foreach ($headers as $header){
				$result .= "<th>".$header."</th>";
			}
			$result .= "</tr>";
		}
		foreach ($data as $row){
			$result .= "<tr>";
			foreach ($row as $field){
				$result .= "<td>".$field."</td>";
			}
			$result .= "</tr>";
		}
		$result .= "</table>";
		return $result;
	}
	
	public function string_insert($table, $fields, $values){
		$q = "INSERT INTO ".($table)."(".$fields.") VALUES(".$this->u8d($values).")";		
        $res = $this->database->query($q);
		return $res;
	}
	
	public function string_update($table, $setting, $condition = null){
		$q = "UPDATE ".$table." SET ".$this->u8d($setting);
		if($condition != null)
			$q .= " WHERE ".$this->u8d($condition);				
        $res = $this->database->query($q);
		return $res;
	}
	
	public function run_query($q){
		$res = $this->database->query($q);
		return $res;
	}

}
?>
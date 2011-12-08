<?php
class DBManager {
	protected $database;
	
	public function __construct($adapter,$host,$user,$password,$database) {
      try {
        $this->database = new PDO("$adapter:host=$host;dbname=$database;", "$user", "$password", array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8") );
      }
      catch(PDOException $e) {
        echo $e->getMessage()."<br />" ;
      }
    }

  public function getLastInsertedId(){
    return $this->database->lastInsertId();
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
					$row[$key] = $value;
            array_push($data,$row);
        }		
		return $data;
	}
	
	public function array_select($fields, $table, $condition = null){
		$q = "SELECT ".implode(",", $fields)." FROM ".($table);
		if($condition != null)
			$q .= " WHERE ".$condition;
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

  //unsafe
	/*public function string_insert($table, $fields, $values){
		$q = "INSERT INTO ".($table)."(".$fields.") VALUES(".$values.")";
    $res = $this->database->query($q);
		return $res;
	}*/

  public function array_insert($table, $field_array){
    $field_string = "";
    $values = "";
    foreach ($field_array as $k => $v){
      $field_string.="`$k`,";
      $values.=":$k,";
    }
    $values = substr($values, 0, strlen($values)-1);
    $field_string = substr($field_string, 0, strlen($field_string)-1);
    $q = "INSERT INTO ".($table)."(".$field_string.") VALUES(".$values.")";
    //echo $q;
    $stmt = $this->database->prepare($q);

    foreach ($field_array as $k => &$v){
      $stmt->bindParam($k, $v);
    }

    $stmt->execute();
		//return $res;
  }

  //unsafe
	/*public function string_update($table, $setting, $condition = null){
		$q = "UPDATE ".$table." SET ".$setting;
		if($condition != null)
			$q .= " WHERE ".$condition;
        $res = $this->database->query($q);
		return $res;
	}*/

  /*
   * sample usues:
   * array_update("exercise", array("SOLUTION" => "iiiiaaaauuuu:D:D:D'`"), array("CONTENT = " => "uuu"));
   * array_update("exercise", array("SOLUTION" => "iiiiaaaauuuu:D:D:D'`"), array("CONTENT LIKE " => "%ffff%"));
   */
  public function array_update($table, $settingArray, $conditionArray = null){
    $q = "UPDATE ".$table." SET ";
    foreach($settingArray as $k => $v){
      $q .= "$k = ? ,";
    }
    $q = substr($q, 0, strlen($q)-1);
    if($conditionArray != null){
      $q .= "WHERE ";
      foreach($conditionArray as $k => $v){
        $q .= "$k ? ,";
      }
      $q = substr($q, 0, strlen($q)-1);
    }
    echo $q;
    $stmt = $this->database->prepare($q);
    $i = 1;
    foreach($settingArray as $k => &$v){
      $stmt->bindParam($i, $v);
      $i++;
    }
    if($conditionArray != null){
      foreach($conditionArray as $k => &$v){
        $stmt->bindParam($i, $v);
        $i++;
      }
    }

    $stmt->execute();
    
  }

  //unsafe
	public function run_query($q){
		$res = $this->database->query($q);
		return $res;
	}

}
?>
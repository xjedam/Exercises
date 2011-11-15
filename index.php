<?
	require_once("init.php");
	print_r(PDO::getAvailableDrivers());
	
	$res = $GLOBALS['db']->run_query("INSERT INTO `exercises`.`exercise` (
`id` ,
`content` ,
`solution` ,
`create_date` ,
`last_modification` ,
`difficulty` ,
`deleted` ,
`hidden`
)
VALUES (
NULL , 'Content sample', 'solution sample', '2011-11-15 21:53:17', '0000-00-00 00:00:00', '4', '0', '0'
)");
	
	print "<br />".json_encode($res)."<br />";

	
	$q = $GLOBALS['db']->array_select(array("ID","CONTENT","SOLUTION"),"exercise");
	foreach($q as $row){	
		echo $row['ID'].": ".$row['CONTENT'],$row['SOLUTION'], "<br />";
	}
	
	echo $GLOBALS['db']->array_to_html($q);
	
?>
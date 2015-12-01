<?php
/** Production Env **/
//$database = "bocaexec_users";
//$con=mysql_connect("mysql.bocaexecutiverealty.com", "bocaexec_2000026", "hindy2000");
//mysql_select_db($database,$con);

/** Test Env  **/
$database = "boca";
$con=mysql_connect("localhost", "root", "yotzapon9");
mysql_select_db($database,$con);

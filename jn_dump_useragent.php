<?php
/**
 * Created by IntelliJ IDEA.
 * User: yotchi
 * Date: 12/14/15
 * Time: 10:08 AM
 */

require_once 'jn_db.php';

$sql = "SELECT * FROM user_agent ORDER  BY datetime";
$rs_query = mysql_query($sql,$con)or die (mysql_error());

while ($row = mysql_fetch_array($rs_query))
{
    $sql_call_set = "set @ua = '".$row['useragent']."';";
    $sql_call = "CALL jN_ParseUserAgent(@ua, @dt, @db, @os, @bn);";
    $sql_call_rs = "Select @ua as useragent, @dt as devicetype, @db as devicebrand, @os as operatingsystem, @bn as browsername;";
    mysql_query($sql_call_set,$con)or die (mysql_error());
    mysql_query($sql_call,$con)or die (mysql_error());
    $rs_call = mysql_query($sql_call_rs,$con)or die (mysql_error());

    while($call = mysql_fetch_array($rs_call))
    {
        print $row['id'].'-'.$call['devicetype'].'-'.$call['devicebrand'].'-'.$call['operatingsystem'].'-'.$call['browsername'].'-'.$row['datetime'].'-'.$row['useragent']."\n";
        $sql_insert = "INSERT INTO user_agent_parsed (ua_id,devicetype,devicebrand,operatingsystem,browsername,datetime) VALUES (".$row['id'].",".$call['devicetype'].",".$call['devicebrand'].",".$call['operatingsystem'].",".$call['browsername'].",'".$row['datetime']."')";
        mysql_query($sql_insert,$con)or die (mysql_error());
    }
}

//    set @ua = 'Mozilla/5.0 (Linux; U; Android 3.2; en-us; Dell Streak 7 Build/HTJ85B) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13';
//CALL jN_ParseUserAgent(@ua, @dt, @db, @os, @bn);
//Select @ua as useragent, @dt as devicetype, @db as devicebrand, @os as operatingsystem, @bn as browsername;
mysql_close($con);
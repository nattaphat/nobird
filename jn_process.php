<?php
ini_set('max_execution_time', 600); //5 minutes
ini_set('memory_limit','512M');

include('../../include/session.php');
require_once 'jn_Mobile_Detect_optimize.php';
//require_once 'jn_cache.class.php';
require_once 'jn_db.php';
require_once 'config/jn_mobile.php';
require_once 'config/jn_tablet.php';
require_once "config/datetime_chart.php";


$detect = new Mobile_Detect;
//$cache = new Cache(array(
//    'name'      => 'useragent',
//    'path'      => './cache/',
//    'extension' => '.cache'
//));


//$cache->cache_path = './cache/';
//$cache->cache_time = 3600; //set cache 1 hour

$start_date = $_POST['sdate'];
$datetime1 = new DateTime($start_date);
list($s_year, $s_month, $s_day) = explode("-",$start_date);

$end_date = $_POST['edate'];
$datetime2 = new DateTime($end_date);
list($e_year, $e_month, $e_day) = explode("-",$end_date);

$interval = $datetime1->diff($datetime2);
$diff_day = $interval->format('%a') + 1 ;

$flag = $_POST['flag'];

$rightCtl = $_POST['rightCtl']; //status of compare year


if( $rightCtl == 'comp_year' )//compare year is true
{
    //mktime(h,m,s,m,d,y)
    $start_date_rside = date("Y-m-d", mktime(0, 0, 0, $s_month, $s_day, $s_year + 1));; //start date for right side
    $end_date_rside = date("Y-m-d", mktime(0, 0, 0, $e_month, $e_day, $e_year + 1));; //end date for right side
}else //equal day is true
{
    //mktime(h,m,s,m,d,y)
    $start_date_rside = date("Y-m-d", mktime(0, 0, 0, $e_month, $e_day + 1, $e_year));; //start date for right side
    $end_date_rside = date("Y-m-d", mktime(0, 0, 0, $e_month, $e_day + $diff_day, $e_year ));; //end date for right side
}
//
//echo $start_date.'<br/>';
//echo $end_date.'<br/>';
//echo $start_date_rside.'<br/>';
//echo $end_date_rside;
//exit;

$debug = true;
$cache_name = 'useraget_report_'.$start_date.'_'.$end_date;


if (strtotime($start_date) === strtotime($end_date))
{
    //same day
    if($debug)//test env
    {

    }
    else{
        $sql_left = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
        ORDER BY agent_datetime ASC
        ";

        $sql_right = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
        ORDER BY agent_datetime ASC
        ";

        $sql_linechart_right = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
        ORDER BY agent_datetime ASC
        ";

    }
}
else
{
    if($debug)//test env
    {
        $sql_left = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != '' AND datetime BETWEEN '$start_date' AND '$end_date' ";

        $sql_right = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != '' AND datetime BETWEEN '$start_date_rside' AND '$end_date_rside' ";

        $sql_linechart_right = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != '' AND datetime BETWEEN '$start_date' AND '$end_date_rside' ";

        $optimize_sql = "
          select u.id ,
                l.datetime as l_datetime,
                r.datetime as r_datetime,
                b.datetime as b_datetime
          from user_agent as u,
            (select * from user_agent where datetime between '$start_date' and '$end_date') as l,
            (select * from user_agent where datetime between '$start_date_rside' and '$end_date_rside') as r,
            (select * from user_agent where datetime between '$start_date' and '$end_date_rside') as b
          where
            u.useragent !='' AND
            l.useragent !='' AND
            b.useragent !='' AND
            useragent REGEXP '$mobileDevices'

        ";
        echo $optimize_sql;exit;
    }else{ //dev env
        $sql_left = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date' AND '$end_date'
        ORDER BY agent_datetime ASC
        ";

        $sql_right = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date_rside' AND '$end_date_rside'
        ORDER BY agent_datetime ASC
        ";

        $sql_linechart_right = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date' AND '$end_date_rside'
        ORDER BY agent_datetime ASC
        ";
    }

}

//if($cache->isCached($cache_name)){
//    $rs_query = $cache->retrieve($cache_name);
//} else {
    $rs_query_left = mysql_query($sql_left,$con)or die (mysql_error());
    $rs_query_right = mysql_query($sql_right,$con)or die (mysql_error());
    $rs_query_buttom_right = mysql_query($sql_linechart_right,$con)or die (mysql_error());
//    $cache->setCache($cache_name);
//    $cache->store($cache_name, $rs_query, 3600);
//}


function iOS($agent)
{
    if(
        stristr($agent,'iPhone') ||
        stristr($agent,'iPod') ||
        stristr($agent,'iPad'))
    {
        return true;
    }else{
        return false;
    }
}

function andoidOS($agent)
{
    if(stristr($agent,'Android'))
    {
        return true;
    }else{
        return false;
    }
}

function windowOS($agent)
{
    if(
        stristr($agent,'Windows Phone 8.1') ||
        stristr($agent,'Windows Phone 8.0') ||
        stristr($agent,'Windows Phone OS') ||
        stristr($agent,'XBLWP7') ||
        stristr($agent,'ARM') ||
        stristr($agent,'Windows NT 6') ||
        stristr($agent,'ZuneWP7')
    ){
        return true;
    }else{
        return false;
    }
}

require_once "includes/jn_process_left.php";
require_once "includes/jn_process_right.php";
require_once "includes/jn_process_bottom.php";

if($flag == 'list'){

    /**Table on Left side**/
    require_once "includes/jn_table_leftside.php";

    /**Table on Right side**/
    require_once "includes/jn_table_rightside.php";

    echo json_encode( $results );

}
else//for chart
{
    /**Chart on Left side**/
    require_once "includes/jn_chart_leftside.php";


    /**Chart on Right side**/
    require_once "includes/jn_chart_rightside.php";

    /**Chart on Bottom side - Desktop **/
    require_once "includes/jn_chart_bottom_desktop.php";

    /**Chart on Bottom side - Desktop **/
    require_once "includes/jn_chart_bottom_mobile.php";

    /**Chart on Bottom side - Desktop **/
    require_once "includes/jn_chart_bottom_tablet.php";

	echo json_encode($charts);
}

?>
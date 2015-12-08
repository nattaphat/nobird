<?php
ini_set('max_execution_time', 600); //5 minutes
ini_set('memory_limit','512M');

include('../../include/session.php');
require_once 'jn_Mobile_Detect_optimize.php';
require_once 'jn_db.php';
require_once 'config/jn_devices_agent.php';
require_once "config/datetime_chart.php";


$detect = new Mobile_Detect;

$start_date = $_POST['sdate'];
$datetime1 = new DateTime($start_date);
list($s_year, $s_month, $s_day) = explode("-",$start_date);

$end_date = $_POST['edate'];
$datetime2 = new DateTime($end_date);
list($e_year, $e_month, $e_day) = explode("-",$end_date);

$interval = $datetime1->diff($datetime2);
$diff_day = $interval->format('%a') +1;

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

$debug = false;
$cache_name = 'useraget_report_'.$start_date.'_'.$end_date;


if (strtotime($start_date) === strtotime($end_date))
{
    //same day
    if($debug)//test env
    {

    }
    else{
        require_once "queries/jn_report_query_sameday_prod.php";
    }
}
else
{
    if($debug)//test env
    {
        require_once "queries/jn_report_query_dev.php";
    }else{ //production env
        require_once "queries/jn_report_query_prod.php";
    }

}


/**Left Query**/
$rs_query_left_mobile = mysql_query($sql_left_mobile,$con)or die (mysql_error());
$rs_query_left_tablet = mysql_query($sql_left_tablet,$con)or die (mysql_error());
$rs_query_left_desktop = mysql_query($sql_left_desktop,$con)or die (mysql_error());

/**Right Query**/
$rs_query_right_mobile = mysql_query($sql_right_mobile,$con)or die (mysql_error());
$rs_query_right_tablet = mysql_query($sql_right_tablet,$con)or die (mysql_error());
$rs_query_right_desktop = mysql_query($sql_right_desktop,$con)or die (mysql_error());

/**Bottom Query**/
$rs_query_bottom_mobile = mysql_query($sql_bottom_mobile,$con)or die (mysql_error());
$rs_query_bottom_tablet = mysql_query($sql_bottom_tablet,$con)or die (mysql_error());
$rs_query_bottom_desktop = mysql_query($sql_bottom_desktop,$con)or die (mysql_error());


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

mysql_close($con);
?>
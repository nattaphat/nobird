<?php
ini_set('max_execution_time', 600); //5 minutes
ini_set('memory_limit','512M');

//require_once('/home/bocaexec/include/session.php');
include('/home/bocaexec/include/session.php');
require_once 'jn_Mobile_Detect.php';
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
    }
}
else
{
    if($debug)//test env
    {
        $sql_left = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != ''
            AND datetime >= '$start_date'
            AND datetime <= '$start_date_rside'
        ";

        $sql_right = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != ''
            AND datetime >= '$start_date_rside'
            AND datetime <= '$end_date_rside'
        ";
    }else{ //dev env
        $sql_left = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') >= '$start_date'
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') <= '$start_date_rside'
        ORDER BY agent_datetime ASC
        ";

        $sql_right = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') >= '$start_date_rside'
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') <= '$end_date_rside'
        ORDER BY agent_datetime ASC
        ";
    }

}

//if($cache->isCached($cache_name)){
//    $rs_query = $cache->retrieve($cache_name);
//} else {
    $rs_query_left = mysql_query($sql_left,$con)or die (mysql_error());
    $rs_query_right = mysql_query($sql_right,$con)or die (mysql_error());
//    $cache->setCache($cache_name);
//    $cache->store($cache_name, $rs_query, 3600);
//}


while ($agentr = mysql_fetch_array($rs_query_left)) {
	$rs_left[] = $agentr;
}

while ($agentr = mysql_fetch_array($rs_query_right)) {
    $rs_right[] = $agentr;
}


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

/*****************************************************Left side*************************/
$left_num_tablet = 0;
$left_num_tablet_iOS = 0;
$left_num_tablet_android = 0;
$left_num_tablet_windows = 0;

$left_num_mobile = 0;
$left_num_mobile_iOS = 0;
$left_num_mobile_android = 0;
$left_num_mobile_windows = 0;

$left_num_desktop = 0;

foreach($rs_left as $userAgent_left){

    $rs_useragent_left = $userAgent_left[0];//user agent
	$detect->setUserAgent($rs_useragent_left);

	if($detect->isMobile())
	{
		$left_num_mobile = $left_num_mobile + 1;
        $mobile_left_date = getDeviceDate($userAgent_left[1]); //get device date
//        $mobile_left_date = $userAgent_left[1]; //get device date

        //datetime:result left side for process mobile bottom line chart.
        $rs_left_mobile[$mobile_left_date] = $rs_left_mobile[$mobile_left_date] + 1;

		if( iOS($rs_useragent_left) )
		{
			$left_num_mobile_iOS = $left_num_mobile_iOS + 1;
		}

		if(andoidOS($rs_useragent_left))
		{
			$left_num_mobile_android = $left_num_mobile_android +1;
		}

        if( windowOS($rs_useragent_left) )
        {
            $left_num_mobile_windows = $left_num_mobile_windows + 1;
        }
	}
  	
	//tablet agent
	if($detect->isTablet())
	{

		$left_num_tablet = $left_num_tablet + 1;
        $tablet_left_date = getDeviceDate($userAgent_left[1]); //get device date
//        $tablet_left_date = $userAgent_left[1]; //get device date

        //datetime:result left side for process tablet bottom line chart.
        $rs_left_tablet[$tablet_left_date] = $rs_left_tablet[$tablet_left_date] + 1;
		if( iOS($rs_useragent_left))
		{
			$left_num_tablet_iOS = $left_num_tablet_iOS + 1;
		}

		if(andoidOS($rs_useragent_left))
		{
			$left_num_tablet_android = $left_num_tablet_android +1;
		}

        if( windowOS($rs_useragent_left) )
        {
            $left_num_mobile_windows = $left_num_mobile_windows + 1;
        }
	}

	//desktop agent
	if ( !$detect->isTablet() && !$detect->isMobile())
	{
        $left_num_desktop = $left_num_desktop + 1;
        $desktop_left_date = getDeviceDate($userAgent_left[1]); //get device date
//        $desktop_left_date = $userAgent_left[1]; //get device date

        //datetime:result left side for process desktop bottom line chart.
        $rs_left_desktop[$desktop_left_date] = $rs_left_desktop[$desktop_left_date] + 1;
	}


}//end foreach

$left_agent_total = array(
				'mobile'=>array('total'=>$left_num_mobile,'iOS'=>$left_num_mobile_iOS,'Android'=>$left_num_mobile_android,'win'=>$left_num_mobile_windows),
				'tablet'=>array('total'=>$left_num_tablet,'iOS'=>$left_num_tablet_iOS,'Android'=>$left_num_tablet_android,'win'=>$left_num_tablet_windows),
				'desktop'=>array('total'=>$left_num_desktop)
		);


/*****************************************************Right side*************************/
$right_num_tablet = 0;
$right_num_tablet_iOS = 0;
$right_num_tablet_android = 0;
$right_num_tablet_windows = 0;

$right_num_mobile = 0;
$right_num_mobile_iOS = 0;
$right_num_mobile_android = 0;
$right_num_mobile_windows = 0;

$right_num_desktop = 0;

foreach($rs_right as $userAgent_right){

    $rs_useragent_right = $userAgent_right[0];//user agent
    $detect->setUserAgent($rs_useragent_right);


    if($detect->isMobile())
    {
        $mobile_right_date = getDeviceDate($userAgent_right[1]); //get device date
        $right_num_mobile = $right_num_mobile + 1;
        //datetime:result right side for process mobile bottom line chart.
        $rs_right_mobile[$mobile_right_date] = $rs_right_mobile[$mobile_right_date] + 1;

        if( iOS($rs_useragent_right) )
        {
            $right_num_mobile_iOS = $right_num_mobile_iOS + 1;
        }

        if(andoidOS($rs_useragent_right))
        {
            $right_num_mobile_android = $right_num_mobile_android +1;
        }

        if( windowOS($rs_useragent_right) )
        {
            $right_num_mobile_windows = $right_num_mobile_windows + 1;
        }
    }

    //tablet agent
    if($detect->isTablet())
    {
        $right_num_tablet = $right_num_tablet + 1;
        $tablet_right_date = getDeviceDate($userAgent_right[1]); //get device date
        //datetime:result right side for process tablet bottom line chart.
        $rs_right_tablet[$tablet_right_date] = $rs_right_tablet[$tablet_right_date] + 1;

        if( iOS($rs_useragent_right))
        {
            $right_num_tablet_iOS = $right_num_tablet_iOS + 1;
        }

        if(andoidOS($rs_useragent_right))
        {
            $right_num_tablet_android = $right_num_tablet_android +1;
        }

        if( windowOS($rs_useragent_right) )
        {
            $right_num_tablet_windows = $right_num_tablet_windows + 1;
        }
    }

    //desktop agent
    if ( !$detect->isTablet() && !$detect->isMobile())
    {
        $right_num_desktop = $right_num_desktop + 1;
        $desktop_right_date = getDeviceDate($userAgent_right[1]); //get device date
        //datetime:result right side for process desktop bottom line chart.
        $rs_right_desktop[$desktop_right_date] = $rs_right_desktop[$desktop_right_date] + 1;
    }


}//end foreach

//print '<pre>';
//print_r($rs_right_desktop);
//exit;

$right_agent_total = array(
    'mobile'=>array('total'=>$right_num_mobile,'iOS'=>$right_num_mobile_iOS,'Android'=>$right_num_mobile_android,'win'=>$right_num_mobile_windows),
    'tablet'=>array('total'=>$right_num_tablet,'iOS'=>$right_num_tablet_iOS,'Android'=>$right_num_tablet_android,'win'=>$right_num_tablet_windows),
    'desktop'=>array('total'=>$right_num_desktop)
);


// print_r($left_agent_total);

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
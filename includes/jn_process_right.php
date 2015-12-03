<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 12/2/15
 * Time: 10:02 AM
 */
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

while ($agentr = mysql_fetch_array($rs_query_right_mobile)) {

    $rs_useragent_right = $agentr[0];//user agent
    $rs_useragent_right_datetime = $agentr[1];//get device date

    $detect->setUserAgent($rs_useragent_right);


    if ($detect->isMobile()) {

        $right_num_mobile = $right_num_mobile + 1;

//        $mobile_right_date = getDeviceDate($rs_useragent_right_datetime);
//        //datetime:result right side for process mobile bottom line chart.
//        $rs_right_mobile[$mobile_right_date] = $rs_right_mobile[$mobile_right_date] + 1;

        if (iOS($rs_useragent_right)) {
            $right_num_mobile_iOS = $right_num_mobile_iOS + 1;
        }

        if (andoidOS($rs_useragent_right)) {
            $right_num_mobile_android = $right_num_mobile_android + 1;
        }

        if (windowOS($rs_useragent_right)) {
            $right_num_mobile_windows = $right_num_mobile_windows + 1;
        }
    }
}//end  while

while ($agentr = mysql_fetch_array($rs_query_right_tablet)) {

    $rs_useragent_right = $agentr[0];//user agent
    $rs_useragent_right_datetime = $agentr[1];//get device date

    $detect->setUserAgent($rs_useragent_right);
    //tablet agent
    if ($detect->isTablet()) {
        $right_num_tablet = $right_num_tablet + 1;
//        $tablet_right_date = getDeviceDate($rs_useragent_right_datetime); //get device date
//        //datetime:result right side for process tablet bottom line chart.
//        $rs_right_tablet[$tablet_right_date] = $rs_right_tablet[$tablet_right_date] + 1;

        if (iOS($rs_useragent_right)) {
            $right_num_tablet_iOS = $right_num_tablet_iOS + 1;
        }

        if (andoidOS($rs_useragent_right)) {
            $right_num_tablet_android = $right_num_tablet_android + 1;
        }

        if (windowOS($rs_useragent_right)) {
            $right_num_tablet_windows = $right_num_tablet_windows + 1;
        }
    }
}

while ($agentr = mysql_fetch_array($rs_query_right_desktop)) {

    $rs_useragent_right = $agentr[0];//user agent
    $rs_useragent_right_datetime = $agentr[1];//get device date

    $detect->setUserAgent($rs_useragent_right);
    //desktop agent
    if ( !$detect->isTablet() && !$detect->isMobile())
    {
        $right_num_desktop = $right_num_desktop + 1;
//        $desktop_right_date = getDeviceDate($rs_useragent_right_datetime); //get device date
//        //datetime:result right side for process desktop bottom line chart.
//        $rs_right_desktop[$desktop_right_date] = $rs_right_desktop[$desktop_right_date] + 1;
    }
}//end while


$right_agent_total = array(
    'mobile'=>array('total'=>$right_num_mobile,'iOS'=>$right_num_mobile_iOS,'Android'=>$right_num_mobile_android,'win'=>$right_num_mobile_windows),
    'tablet'=>array('total'=>$right_num_tablet,'iOS'=>$right_num_tablet_iOS,'Android'=>$right_num_tablet_android,'win'=>$right_num_tablet_windows),
    'desktop'=>array('total'=>$right_num_desktop)
);
/*****************************************************End Right side*************************/
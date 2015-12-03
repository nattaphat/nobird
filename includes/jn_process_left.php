<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 12/2/15
 * Time: 10:02 AM
 */

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

while ($agentr = mysql_fetch_array($rs_query_left_mobile)) {
    $rs_useragent_left = $agentr[0]; //user agent
    $rs_useragent_left_datetime = $agentr[1];

    $detect->setUserAgent($rs_useragent_left);

    if ($detect->isMobile()) {
        $left_num_mobile = $left_num_mobile + 1;

        $mobile_left_date = getDeviceDate($rs_useragent_left_datetime); //get device date
        //datetime:result left side for process mobile bottom line chart.
        $rs_left_mobile[$mobile_left_date] = $rs_left_mobile[$mobile_left_date] + 1;

        if (iOS($rs_useragent_left)) {
            $left_num_mobile_iOS = $left_num_mobile_iOS + 1;
        }

        if (andoidOS($rs_useragent_left)) {
            $left_num_mobile_android = $left_num_mobile_android + 1;
        }

        if (windowOS($rs_useragent_left)) {
            $left_num_mobile_windows = $left_num_mobile_windows + 1;
        }
    }

}//end while

while ($agentr = mysql_fetch_array($rs_query_left_tablet)) {
    $rs_useragent_left = $agentr[0]; //user agent
    $rs_useragent_left_datetime = $agentr[1];

    $detect->setUserAgent($rs_useragent_left);
    //tablet agent
    if ($detect->isTablet()) {

        $left_num_tablet = $left_num_tablet + 1;

        $tablet_left_date = getDeviceDate($rs_useragent_left_datetime); //get device date
        //datetime:result left side for process tablet bottom line chart.
        $rs_left_tablet[$tablet_left_date] = $rs_left_tablet[$tablet_left_date] + 1;

        if (iOS($rs_useragent_left)) {
            $left_num_tablet_iOS = $left_num_tablet_iOS + 1;
        }

        if (andoidOS($rs_useragent_left)) {
            $left_num_tablet_android = $left_num_tablet_android + 1;
        }

        if (windowOS($rs_useragent_left)) {
            $left_num_mobile_windows = $left_num_mobile_windows + 1;
        }
    }
}//end while

while ($agentr = mysql_fetch_array($rs_query_left_desktop)) {
    $rs_useragent_left = $agentr[0]; //user agent
    $rs_useragent_left_datetime = $agentr[1];

    $detect->setUserAgent($rs_useragent_left);
    //desktop agent
    if ( !$detect->isTablet() && !$detect->isMobile())
    {
        $left_num_desktop = $left_num_desktop + 1;

        $desktop_left_date = getDeviceDate($rs_useragent_left_datetime); //get device date
        //datetime:result left side for process desktop bottom line chart.
        $rs_left_desktop[$desktop_left_date] = $rs_left_desktop[$desktop_left_date] + 1;
    }
}//end while

$left_agent_total = array(
    'mobile'=>array('total'=>$left_num_mobile,'iOS'=>$left_num_mobile_iOS,'Android'=>$left_num_mobile_android,'win'=>$left_num_mobile_windows),
    'tablet'=>array('total'=>$left_num_tablet,'iOS'=>$left_num_tablet_iOS,'Android'=>$left_num_tablet_android,'win'=>$left_num_tablet_windows),
    'desktop'=>array('total'=>$left_num_desktop)
);
/*****************************************************End Left side*************************/
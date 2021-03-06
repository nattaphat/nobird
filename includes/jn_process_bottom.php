<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 12/2/15
 * Time: 10:03 AM
 */

/*****************************************************Bottom side*************************/

/**Right Side**/

while ($agentr = mysql_fetch_array($rs_query_bottom_mobile)) {

    $rs_useragent_right = $agentr[0];//user agent
    $rs_useragent_right_datetime = $agentr[1];//get device date

    $detect->setUserAgent($rs_useragent_right);

    if ($detect->isMobile()) {
        $mobile_right_date = getDeviceDate($rs_useragent_right_datetime);

        //datetime:result right side for process mobile bottom line chart.
        $rs_right_mobile[$mobile_right_date] = $rs_right_mobile[$mobile_right_date] + 1;
    }
}

while ($agentr = mysql_fetch_array($rs_query_bottom_tablet)) {

    $rs_useragent_right = $agentr[0];//user agent
    $rs_useragent_right_datetime = $agentr[1];//get device date

    $detect->setUserAgent($rs_useragent_right);
    //tablet agent
    if ($detect->isTablet()) {
        $tablet_right_date = getDeviceDate($rs_useragent_right_datetime); //get device date
        //datetime:result right side for process tablet bottom line chart.
        $rs_right_tablet[$tablet_right_date] = $rs_right_tablet[$tablet_right_date] + 1;
    }
}

while ($agentr = mysql_fetch_array($rs_query_bottom_desktop)) {

    $rs_useragent_right = $agentr[0];//user agent
    $rs_useragent_right_datetime = $agentr[1];//get device date

    $detect->setUserAgent($rs_useragent_right);
    //desktop agent
    if ( !$detect->isTablet() && !$detect->isMobile())
    {
        $desktop_right_date = getDeviceDate($rs_useragent_right_datetime); //get device date
        //datetime:result right side for process desktop bottom line chart.
        $rs_right_desktop[$desktop_right_date] = $rs_right_desktop[$desktop_right_date] + 1;
    }
}//end while
/**End Right Side**/


//print '<pre>';
//print_r($rs_right_desktop);

/*****************************************************End Bottom side*************************/
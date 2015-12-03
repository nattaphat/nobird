<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 12/3/15
 * Time: 1:14 PM
 */

/**SQL for Left side **/
$sql_left_mobile = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != ''
          AND datetime >= '$start_date' AND datetime <= '$end_date'
          AND useragent REGEXP '$mobileDevices' ";

$sql_left_tablet = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != ''
          AND datetime >= '$start_date' AND datetime <= '$end_date'
          AND useragent REGEXP '$tabletDevices' ";

$sql_left_desktop = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != ''
          AND datetime >= '$start_date' AND datetime <= '$end_date'
          AND useragent NOT REGEXP '$tabletDevices' AND useragent NOT REGEXP '$mobileDevices' ";

/**  SQL for Right side **/
$sql_right_mobile = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != ''
          AND datetime >= '$start_date_rside' AND datetime <= '$end_date_rside'
          AND useragent REGEXP '$mobileDevices' ";

$sql_right_tablet = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != ''
          AND datetime >= '$start_date_rside' AND datetime <= '$end_date_rside'
          AND useragent REGEXP '$tabletDevices' ";

$sql_right_desktop = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != ''
          AND datetime >= '$start_date_rside' AND datetime <= '$end_date_rside'
          AND useragent NOT REGEXP '$tabletDevices' AND useragent NOT REGEXP  '$mobileDevices' ";

/**  SQL for Bottom side **/
$sql_bottom_mobile = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != ''
          AND datetime >= '$start_date' AND datetime <= '$end_date_rside'
          AND useragent REGEXP '$mobileDevices' ";

$sql_bottom_tablet = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != ''
          AND datetime >= '$start_date' AND datetime <= '$end_date_rside'
          AND useragent REGEXP '$tabletDevices' ";

$sql_bottom_desktop = "
        SELECT useragent,datetime
        FROM user_agent
        WHERE useragent != ''
          AND datetime >= '$start_date' AND datetime <= '$end_date_rside'
          AND useragent NOT REGEXP '$tabletDevices' AND useragent NOT REGEXP  '$mobileDevices' ";

//echo $diff_day;
//echo $start_date;
//echo $end_date_rside;
//echo $sql_bottom_desktop;exit;
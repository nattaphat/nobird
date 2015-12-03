<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 12/3/15
 * Time: 1:15 PM
 */
/**SQL for Left side **/
$sql_left_mobile = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date' AND '$end_date'
            AND useragent REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
        ";

$sql_left_tablet = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date' AND '$end_date'
            AND useragent REGEXP '$tabletDevices'
        ORDER BY agent_datetime ASC
        ";

$sql_left_desktop = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date' AND '$end_date'
            AND useragent NOT REGEXP '$tabletDevices' AND useragent NOT REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
        ";

/**  SQL for Right side **/
$sql_right_mobile = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date_rside' AND '$end_date_rside'
            AND useragent REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
        ";

$sql_right_tablet = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date_rside' AND '$end_date_rside'
            AND useragent REGEXP '$tabletDevices'
        ORDER BY agent_datetime ASC
        ";

$sql_right_desktop = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date_rside' AND '$end_date_rside'
            AND useragent NOT REGEXP '$tabletDevices' AND useragent NOT REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
        ";

/**  SQL for Bottom side **/
$sql_bottom_mobile = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date' AND '$end_date_rside'
            AND useragent REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
          ";

$sql_bottom_tablet = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date' AND '$end_date_rside'
            AND useragent REGEXP '$tabletDevices'
        ORDER BY agent_datetime ASC
          ";

$sql_bottom_desktop = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') BETWEEN '$start_date' AND '$end_date_rside'
            AND useragent NOT REGEXP '$tabletDevices' AND useragent NOT REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
          ";

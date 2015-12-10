<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 12/7/2015 AD
 * Time: 7:09 AM
 */

/**SQL for Left side **/
$sql_left_mobile = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
            AND users2.user_agent REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
        ";

$sql_left_tablet = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
            AND users2.user_agent REGEXP '$tabletDevices'
        ORDER BY agent_datetime ASC
        ";

$sql_left_desktop = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
            AND users2.user_agent NOT REGEXP '$tabletDevices' AND users2.user_agent NOT REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
        ";

/**  SQL for Right side **/
$sql_right_mobile = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
            AND users2.user_agent REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
        ";

$sql_right_tablet = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
            AND users2.user_agent REGEXP '$tabletDevices'
        ORDER BY agent_datetime ASC
        ";

$sql_right_desktop = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
            AND users2.user_agent NOT REGEXP '$tabletDevices' AND users2.user_agent NOT REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
        ";

/**  SQL for Bottom side **/
$sql_bottom_mobile = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
            AND users2.user_agent REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
          ";

$sql_bottom_tablet = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
            AND users2.user_agent REGEXP '$tabletDevices'
        ORDER BY agent_datetime ASC
          ";

$sql_bottom_desktop = "
        SELECT users2.user_agent,FROM_UNIXTIME(users.user1,'%Y-%m-%d %h:%i:%s') as agent_datetime
        FROM users2, users
        WHERE users2.user_agent != ''
            AND users.user1 != ''
            AND users2.userid = users.username
            AND FROM_UNIXTIME(users.user1,'%Y-%m-%d') = '$start_date'
            AND users2.user_agent NOT REGEXP '$tabletDevices' AND users2.user_agent NOT REGEXP '$mobileDevices'
        ORDER BY agent_datetime ASC
          ";
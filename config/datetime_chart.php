<?php
/**
 * Created by IntelliJ IDEA.
 * User: yotchi
 * Date: 11/30/15
 * Time: 10:17 AM
 */

function formatChartData($datas,$timestamp = true)
{
    //+0000 mean timzone on server and local and application it is the same timezone it has not to plus like a +0700
    if(count($datas) > 0)
    {
        foreach ($datas AS $key => $data) {
            if ($timestamp) {
                $ts =  strtotime($key.' +0000' ) * 1000;
                $val = (float)$data;
                $series_val[] = array($ts,$val);

            }
        }//end foreach

        return $series_val;
    }else
    {
        return array();
    }

}

function getDeviceDate($datetime)
{
    list($date,$time) = explode(' ',$datetime);
    list($h,$m,$s) = explode(':',$time);

    return $date.' '.$h.':00';
}
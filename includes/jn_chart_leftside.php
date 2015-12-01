<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 11/28/2015 AD
 * Time: 8:50 PM
 */

$chart_left = array(
    'chart'=>array('type'=>'pie'),
    'title'=>array(
        'text'=>'User Agent Report'
    ),
    'subtitle'=>array(
        'text'=>'Report from: '.$start_date.' to '.$end_date
    ),
    "credits"=>array(
        "enabled"=>false
    ),
    'plotOptions'=>array(
        'series'=>array(
            'dataLabels'=>array(
                'enabled'=>true,
                // 'format'=>'name'
            )
        )
    )			,
    'tooltip'=>array(
        'headerFormat'=>'<span style="font-size:11px">{series.name}</span><br>',
        'pointFormat'=>'<span style=\"color:{point.color}\">{point.name}</span>: <b>{point.y:.2f}</b> of total<br/>'
    ),
    'series'=>array(
        array(
            "name"=>"Device",
            "colorByPoint"=> true,
            "data"=>array(
                array(
                    "name"=>"Desktop",
                    "y"=>$left_agent_total['desktop']['total'],
                    "drilldown"=>null
                ),
                array(
                    "name"=>"Tablet",
                    "y"=>$left_agent_total['tablet']['total'],
                    "drilldown"=>"tablet"
                ),
                array(
                    "name"=>"Moblie",
                    "y"=>$left_agent_total['mobile']['total'],
                    "drilldown"=>"mobile"
                )
            )
        )
    ),
    'drilldown'=>array(
        'series'=>array(
            array(
                'name'=>'Tablet',
                'id'=>'tablet',
                'data'=>array(
                    array('iOS',$left_agent_total['tablet']['iOS']),
                    array('Android',$left_agent_total['tablet']['Android']),
                    array('Window',$left_agent_total['tablet']['win'])
                )
            ),
            array(
                'name'=>'Mobile',
                'id'=>'mobile',
                'data'=>array(
                    array('iOS',$left_agent_total['mobile']['iOS']),
                    array('Android',$left_agent_total['mobile']['Android']),
                    array('Window',$left_agent_total['mobile']['win'])
                )
            )

        )
    )
);
$charts['left'] = $chart_left;
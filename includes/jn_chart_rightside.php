<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 11/28/2015 AD
 * Time: 8:52 PM
 */

$chart_right = array(
    'chart'=>array('type'=>'pie'),
    'title'=>array(
        'text'=>'User Agent Report'
    ),
    'subtitle'=>array(
        'text'=>'Report from: '.$start_date_rside.' to '.$end_date_rside
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
                    "y"=>$right_agent_total['desktop']['total'],
                    "drilldown"=>null
                ),
                array(
                    "name"=>"Tablet",
                    "y"=>$right_agent_total['tablet']['total'],
                    "drilldown"=>"tablet"
                ),
                array(
                    "name"=>"Moblie",
                    "y"=>$right_agent_total['mobile']['total'],
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
                    array('iOS',$right_agent_total['tablet']['iOS']),
                    array('Android',$right_agent_total['tablet']['Android']),
                    array('Window',$right_agent_total['tablet']['win'])
                )
            ),
            array(
                'name'=>'Mobile',
                'id'=>'mobile',
                'data'=>array(
                    array('iOS',$right_agent_total['mobile']['iOS']),
                    array('Android',$right_agent_total['mobile']['Android']),
                    array('Window',$right_agent_total['mobile']['win'])
                )
            )

        )
    )
);
$charts['right'] = $chart_right;
<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 11/28/2015 AD
 * Time: 8:54 PM
 */


$series_left_tablet = formatChartData($rs_left_tablet);
$series_right_tablet = formatChartData($rs_right_tablet);

$seriesOption_tablet_left[] = array(
    'type'=> "line",
    'name'=> 'Tablet Left',
    'color'=> '#B8860B',
    'lineWidth'=> 1,
    'dashStyle'=> "solid",
    'tooltip' => array('valueDecimals'=>2),
    'data'=> $series_left_tablet
);

$seriesOption_tablet_right[] = array(
    'type'=> "line",
    'name'=> 'Tablet Right',
    'color'=> '#8B7B8B',
    'lineWidth'=> 1,
    'dashStyle'=> "solid",
    'tooltip' => array('valueDecimals'=>2),
    'data'=> $series_right_tablet
);

$chart_bottom_tablet = array(
    'title'=>array(
        'text'=>'Tablet devices.',
        'x' => -20
    ),
    'subtitle'=>array(
        'text'=>'Report from: '.$start_date.' to '.$end_date_rside,
        'x' => -20
    ),
    'credits'=>array(
        'enabled'=>false
    ),
    'xAxis'=>array(
        'type'=>'datetime',
        'dateTimeLabelFormats'=>array(
            'day'=>'%d-%m-%Y',
            'week'=>'%d-%m-%Y',
            'month'=>'%m-%Y',
            'year'=>'%Y'
        )
    ),
    'yAxis'=>array(
        'title'=>array(
            'text'=>'Number of Views'
        ),
        'plotLines'=>array(
            array(
                'value'=>0,
                'width'=>1,
                'color'=>'#808080'
            )
        )
    ),
    'legend'=>array(
        'aligh'=>'center',
        'verticalAlign' => 'top',
        'layout' => 'vertical',
        'x' => 0,
        'y' => 100
    ),
    'tooltip'=>array(
        'valueSuffix'=>' view.'
    ),
    'legend'=>array(
        'layout'=>'horizontal',
        'align'=>'center',
        'verticalAlign'=>'bottom',
        'borderWidth'=>0
    ),
    'series'=>array($seriesOption_tablet_left[0],$seriesOption_tablet_right[0])
);

$charts['bottom_tablet'] = $chart_bottom_tablet;
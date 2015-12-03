<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 11/28/2015 AD
 * Time: 8:54 PM
 */


$series_left_desktop = formatChartData($rs_left_desktop);
$series_right_desktop = formatChartData($rs_right_desktop);

$seriesOption_left_desktop[] = array(
    'type'=> "line",
    'name'=> 'Desktop Left',
    'color'=> '#f781f3',
    'lineWidth'=> 1,
    'dashStyle'=> "solid",
    'tooltip' => array('valueDecimals'=>2),
    'data'=> $series_left_desktop
);

$seriesOption_right_desktop[] = array(
    'type'=> "line",
    'name'=> 'Desktop Right',
    'color'=> '#585858',
    'lineWidth'=> 1,
    'dashStyle'=> "solid",
    'tooltip' => array('valueDecimals'=>2),
    'data'=> $series_right_desktop
);


if($rightCtl == 'comp_year')
{
    $xaxix_format = array(
            'day'=>'%d-%m-%Y',
            'week'=>'%d-%m-%Y',
            'month'=>'%m-%Y',
            'year'=>'%Y'
    );
}
else
{
    $xaxix_format = array(
        'millisecond'=> '%b-%e'
    );
}

$chart_bottom_desktop = array(
    'title'=>array(
        'text'=>'Desktop devices.',
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
        'dateTimeLabelFormats'=>$xaxix_format//,
//        'tickInterval'=> 24 * 3600 * 1000,
//        'ordinal'=> false
    ),
    'plotOptions' => array(
        'series' => array(
            'marker'=> array(
                'enabled'=> false
            )
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
    'series'=>array($seriesOption_left_desktop[0],$seriesOption_right_desktop[0])
);

$charts['bottom_desktop'] = $chart_bottom_desktop;
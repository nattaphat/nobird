<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 11/28/2015 AD
 * Time: 8:54 PM
 */


$series_left_mobile = formatChartData($rs_left_mobile);
$series_right_mobile = formatChartData($rs_right_mobile);

$seriesOption_mobile_left[] = array(
    'type'=> "line",
    'name'=> 'Mobile Left',
    'color'=> '#0066CC',
    'lineWidth'=> 1,
    'dashStyle'=> "solid",
    'tooltip' => array('valueDecimals'=>2),
    'data'=> $series_left_mobile
);

$seriesOption_mobile_right[] = array(
    'type'=> "line",
    'name'=> 'Mobile Right',
    'color'=> '#6E8B3D',
    'lineWidth'=> 1,
    'dashStyle'=> "solid",
    'tooltip' => array('valueDecimals'=>2),
    'data'=> $series_right_mobile
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

$chart_bottom_mobile = array(
    'title'=>array(
        'text'=>'Mobile devices.',
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
    'series'=>array($seriesOption_mobile_left[0],$seriesOption_mobile_right[0])
);

$charts['bottom_mobile'] = $chart_bottom_mobile;
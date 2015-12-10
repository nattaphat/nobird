<?php

    if($_GET["key"] != "33431")
    {
        header('Location: http://www.bocaexecutiverealty.com');
    }

	$start_date = date('Y-m-d', strtotime('-3 day', strtotime(date('Y-m-d'))));
	$end_date = date('Y-m-d');

//    define('PreventDirectAccess', TRUE);
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="noindex">
	    <title>User Agent Report</title>
	    <link href="assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link href="assets/lib/bootstrap-datepicker/css/datepicker.css" rel="stylesheet">
	    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/lib/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
	    <style type="text/css">
	        
	    </style>
	</head>
	<body>

		<header>
			<h1 class="text-center">User Agent Report</h1>
		</header>
		<br/>
		<br/>
		<div id="container">

		</div>


        <!-- Container -->
        <div class="row">
            <!-- Main Left Side-->
            <!-- Range of date-->
            <div class="col-md-6">
                <!-- Condition -->
                <div class="row col-md-12">
                    <div class="form-group">
                        <div class="col-md-4">
                            <label class="col-sm-5 control-label text-right">From : </label>
                            <div class='input-group date' id='s_date'>
                                <input type='text' readonly size="13" data-date-format="yyyy-mm-dd" class="form-control s_date" value="<?php echo $start_date; ?>"/>
                    <span class="input-group-addon"><i class="fa fa-calendar"></i>
                    </span>
                            </div>
                        </div>


                        <div class="col-md-4">
                            <label class="col-sm-5 control-label text-right">To : </label>
                            <div class='input-group date' id='e_date'>
                                <input type='text' readonly size="13" data-date-format="yyyy-mm-dd" class="form-control e_date" value="<?php echo $end_date; ?>"/>
	                    <span class="input-group-addon"><i class="fa fa-calendar"></i>
	                    </span>
                            </div>
                        </div>
                        <div class="ol-md-6">
                            <div class="col-sm-4">
                                <button type="button" class="btn btn-success search">  Search</button>
                            </div>
                        </div>
                    </div>
                </div><!-- End Condition -->

                <br />
                <br />
                <br />
                <br />

                <!-- Left side Chart-->
                <div class="col-md-6 text-center">
                    <div id="chart_loading"><i class="fa fa-spinner fa-spin"></i></i></div>
                    <div id="chart"></div>
                </div>
                <!-- Left side Table-->
                <div class="col-md-6">
                    <div id="tbl_loading"><i class="fa fa-spinner fa-spin"></i></i></div>
                    <div id="tbl_list"></div>
                </div>
            </div>


            <!-- Main Right Side-->
            <!-- Compare to next year-->
            <div class="col-md-6">
                <!-- Condition -->
                <div class="col-md-6">
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="ctlRightYear" value="comp_year" name="ctlRight" checked="">
                        <label for="ctlRightYear"> Compare to Next Year </label>
                    </div>
                    <div class="radio radio-info radio-inline">
                        <input type="radio" id="ctlRightEqualDay" value="equal_days" name="ctlRight" checked="">
                        <label for="ctlRightEqualDay"> Equal Days </label>
                    </div>
                </div>

                <br />
                <br />
                <br />
                <br />

                <!-- Right side Chart-->
                <div class="col-md-6 text-center">
                    <div id="chart_loading_right"><i class="fa fa-spinner fa-spin"></i></i></div>
                    <div id="chart_right"></div>
                </div>
                <!-- Right side Table-->
                <div class="col-md-6">
                    <div id="tbl_loading_right"><i class="fa fa-spinner fa-spin"></i></i></div>
                    <div id="tbl_list_right"></div>
                </div>
            </div>

            <!-- Compare 2 sets build report-->
            <div class="col-md-12">
<!--                <div class="col-md-6 text-right">-->
<!--                    <div class="checkbox checkbox-info">-->
<!--                        <input id="build_report" class="styled" type="checkbox">-->
<!--                        <label for="checkbox4">-->
<!--                            Compare the 2 sets-->
<!--                        </label>-->
<!--                    </div>-->
<!--                </div>-->
                <div class="col-md-12 text-center">
                    <button type="button" class="btn btn-success buildreport">Build Reports</button>
                </div>
            </div>

            <br />
            <br />
            <br />
            <br />

            <!-- Line Chart-->
            <div class="col-md-12 col-sm-12">
                <!-- Desktop Line Chart-->
                <div class="col-md-4 col-sm-12">
                    <div id="desktop_linechart"></div>
                </div>

                <!-- Moblie Line Chart-->
                <div class="col-md-4 col-sm-12">
                    <div id="mobile_linechart"></div>
                </div>

                <!-- Tablet Line Chart-->
                <div class="col-md-4 col-sm-12">
                    <div id="tablet_linechart"></div>
                </div>
            </div>
        </div><!-- End Container -->


		<script src="assets/lib/jquery/dist/jquery.min.js"></script>
		<script src="assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="assets/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/lib/highcharts-release/highcharts.js"></script>
		<script src="assets/lib/highcharts-release/modules/data.js"></script>
		<script src="assets/lib/highcharts-release/modules/drilldown.js"></script>

		<script type="text/javascript">

			function setDatePicker()
	        {
	            /*DatePicker*/
	            $('#s_date').datepicker({
	                autoclose: true,
	                todayHighlight: true ,
	                format: 'yyyy-mm-dd',
	                endDate: '+0d'
	            });

	            $('#e_date').datepicker({
	                autoclose: true,
	                todayHighlight: true ,
	                format: 'yyyy-mm-dd',
	                endDate: '+0d'
	            });

	        }

            function hideChartAndTable()
            {
                $('#tbl_list').hide();
                $('#tbl_list_right').hide();
                $('#chart_right').hide();
                $('#chart').hide();

                $('#desktop_linechart').hide();// hide by default
                $('#mobile_linechart').hide();// hide by default
                $('#tablet_linechart').hide();// hide by default
            }

            function pieChartTable()
            {
                $('.search').on('click',function(){
                    var _url = "./jn_report_process.php";
                    var rightCtl = $('input[name=ctlRight]:checked').val()
                    var s_date = $('.s_date').val();
                    var e_date = $('.e_date').val();

                    hideChartAndTable();

                    //Left side
                    $('#chart_loading').show();
                    $('#tbl_loading').show();

                    //Right side
                    $('#chart_loading_right').show();
                    $('#tbl_loading_right').show();

                    //Main function for render table, chart left, right and bottom
                    $.ajax({
                        type: "POST",
                        url:_url,
                        dataType: 'json',
                        data:{
                            'sdate': s_date,
                            'edate': e_date,
                            'rightCtl' : rightCtl
                        },

                    }).done(function(result) {
                        $('#chart_loading').hide();
                        $('#chart_loading_right').hide();
                        //convert json to string
//                        console.log(JSON.stringify(result));

                        //Table
                        $('#tbl_loading').hide();
                        $('#tbl_loading_right').hide();
                        $('#tbl_list').html(result.table.list_left);
                        $('#tbl_list_right').html(result.table.list_right);

                        $('#tbl_list').show();
                        $('#tbl_list_right').show();

                        //Chart
                        $('#chart_right').show();
                        $('#chart').show();
                        $('#chart').highcharts(result.chart.left); //left chart
                        $('#chart_right').highcharts(result.chart.right); //right chart

                        var desktop = $('#desktop_linechart').highcharts(result.chart.bottom_desktop); //bottom desktop chart
//                        desktop.redraw();
                        $('#desktop_linechart').hide();// hide by default

                        var mobile = $('#mobile_linechart').highcharts(result.chart.bottom_mobile); //bottom mobile chart
//                        mobile.redraw();
                        $('#mobile_linechart').hide();// hide by default

                        var tablet = $('#tablet_linechart').highcharts(result.chart.bottom_tablet); //bottom tablet chart
//                        tablet.redraw();
                        $('#tablet_linechart').hide();// hide by default

                    });//end done
                });
            }

            function rightSideToggle()
            {
                $('#equal_day').on('click',function(){
                    if( $('#equal_day').is(":checked") ) //if equal day is checked,uncheck compare year
                        $('#comp_year').attr('checked', false);
                });

                $('#comp_year').on('click', function () {
                    if( $('#comp_year').is(":checked") ) //if compa year is check,uncheck equal day
                        $('#equal_day').attr('checked', false);
                });

            }

            function compareSets()
            {
                $('.buildreport').prop('disabled', true);

                $('#build_report').on('click',function()
                {
                    if( $('#build_report').is(":checked") ) //if compare two sets checked, enable button
                        $('.buildreport').prop('disabled', false);
                    else
                    {
                        $('.buildreport').prop('disabled', true);
                        $('#desktop_linechart').hide();
                        $('#mobile_linechart').hide();
                        $('#tablet_linechart').hide();
                    }

                });

            }

            function reportLinechart()
            {
                $('.buildreport').on('click',function(){
                    $('#desktop_linechart').show();
                    $('#mobile_linechart').show();
                    $('#tablet_linechart').show();
                });
            }

	        $(document).ready(function(){

	        	$('#chart_loading').hide();
	        	$('#tbl_loading').hide();

	        	setDatePicker(); //fired event with datetime picker
                pieChartTable(); //fired event on left side
                rightSideToggle(); //fired event toggle with right side checkbok
                //compareSets(); //fire event compare two sets
                reportLinechart(); //fired event show bottom chart
                $(".search").trigger('click'); //fired event when onload
	        });
	    </script>
	</body>
</html>
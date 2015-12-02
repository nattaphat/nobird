<?php
/**
 * Created by IntelliJ IDEA.
 * User: yochi
 * Date: 11/28/2015 AD
 * Time: 8:48 PM
 */

$content = array();
$content[]='<div class="col-md-6">';
$content[]='<table id="datatable" class="table table-hover table-bordered table-striped display" cellspacing="0" width="100%">';
$content[]='<thead>';
$content[]='<tr>';
$content[]='<th class="col-md-4 text-center">Agent</th>';
$content[]='<th class="col-md-4 text-center">OS</th>';
$content[]='<th class="col-md-4 text-center">Views</th>';
$content[]='</tr>';
$content[]='</thead>';
$content[]='<tbody>';
$content[]='<tr>';
$content[]='<td class="col-md-4 text-left"><b>Desktop</b></td>';
$content[]='<td class="col-md-4 text-center">-</td>';
$content[]='<td class="col-md-4 text-right">'.$right_agent_total['desktop']['total'].'</td>';
$content[]='</tr>';
$content[]='<tr>';
$content[]='<td class="col-md-4 text-left"><b>Tablet</b></td>';
$content[]='<td class="col-md-4 text-center">-</td>';
$content[]='<td class="col-md-4 text-right">'.$right_agent_total['tablet']['total'].'</td>';
$content[]='</tr>';
$content[]='<tr>';
$content[]='<td class="col-md-4 text-center"></td>';
$content[]='<td class="col-md-4 text-left">iOS</td>';
$content[]='<td class="col-md-4 text-right">'.$right_agent_total['tablet']['iOS'].'</td>';
$content[]='</tr>';
$content[]='<tr>';
$content[]='<td class="col-md-4 text-center"></td>';
$content[]='<td class="col-md-4 text-left">Android</td>';
$content[]='<td class="col-md-4 text-right">'.$right_agent_total['tablet']['Android'].'</td>';
$content[]='</tr>';
$content[]='<tr>';
$content[]='<td class="col-md-4 text-center"></td>';
$content[]='<td class="col-md-4 text-left">Windows</td>';
$content[]='<td class="col-md-4 text-right">'.$right_agent_total['tablet']['win'].'</td>';
$content[]='</tr>';
$content[]='<tr>';
$content[]='<td class="col-md-4 text-left"><b>Mobile</b></td>';
$content[]='<td class="col-md-4 text-center">-</td>';
$content[]='<td class="col-md-4 text-right">'.$right_agent_total['mobile']['total'].'</td>';
$content[]='</tr>';
$content[]='<tr>';
$content[]='<td class="col-md-4 text-center"></td>';
$content[]='<td class="col-md-4 text-left">iOS</td>';
$content[]='<td class="col-md-4 text-right">'.$right_agent_total['mobile']['iOS'].'</td>';
$content[]='</tr>';
$content[]='<tr>';
$content[]='<td class="col-md-4 text-center"></td>';
$content[]='<td class="col-md-4 text-left">Android</td>';
$content[]='<td class="col-md-4 text-right">'.$right_agent_total['mobile']['Android'].'</td>';
$content[]='</tr>';
$content[]='<tr>';
$content[]='<td class="col-md-4 text-center"></td>';
$content[]='<td class="col-md-4 text-left">Windows</td>';
$content[]='<td class="col-md-4 text-right">'.$right_agent_total['mobile']['win'].'</td>';
$content[]='</tr>';
$content[]='</tbody>';
$content[]='</table>';
$content[]='</div>';

$contents_right = implode('', $content);
$results['list_right'] = $contents_right;
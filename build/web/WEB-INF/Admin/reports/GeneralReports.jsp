<%-- 
    Document   : GeneralReports
    Created on : Mar 21, 2018, 9:49:31 PM
    Author     : xmore mmohz
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

  <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                    <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="#">Home</a>
                    </li>
                    <li class="active">Reports</li>
                    <li class="active">Report Summary</li>

            </ul><!-- /.breadcrumb -->
    </div>
<div class="page-content">
            <div class="page-header"> </div><!-- /.page-header -->
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                            <!-- PAGE CONTENT BEGINS -->
                    <div class="vspace-12-sm"></div>
                        <div class="col-sm-5">
                            <div class="widget-box">
                                    <div class="widget-header widget-header-flat widget-header-small">
                                            <h5 class="widget-title">
                                                    <i class="ace-icon fa fa-signal"></i>
                                                   Customer City/Region Reports 
                                            </h5>
                                        <!-- <div class="widget-toolbar no-border">
                                                 <div class="inline dropdown-hover">
                                                    <button class="btn btn-minier btn-primary">
                                                            This Week
                                                            <i class="ace-icon fa fa-angle-down icon-on-right bigger-110"></i>
                                                    </button>
                                              </div>
                                         </div>-->
                                    </div>
                                   <div class="widget-body">
                                            <div class="widget-main">
                                                    <div id="chart" style="min-width: 400px; height: 400px; margin: 0 auto"></div>

                                                    <div class="hr hr8 hr-double"></div>
                                             </div><!-- /.widget-main -->
                                    </div><!-- /.widget-body -->
                            </div><!-- /.widget-box -->
                    </div><!-- /.col -->
                    <div class="col-sm-7">
                        <div class="widget-box">
                            <div class="widget-header widget-header-flat widget-header-small">
                                    <h4 class="widget-title lighter">
                                            <i class="ace-icon fa fa-signal"></i>
                                            Customer/Category Reports
                                    </h4>
                                    <div class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                    <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                    </div>
                            </div>

                            <div class="widget-body">
                                    <div class="widget-main padding-4">
                                            <div class="widget-main">
                                                    <div id="chart1" style="min-width: 400px; height: 400px; margin: 0 auto"></div>

                                                    <div class="hr hr8 hr-double"></div>
                                            </div><!-- /.widget-main -->
                                    </div><!-- /.widget-main -->
                            </div><!-- /.widget-body -->
                            </div><!-- /.widget-box -->
                      </div><!-- /.col -->
                    
                    </div>
                </div>
            </div>
   



<!-- inline scripts related to this page -->
		
  <script type="text/javascript">
            var chart;
            $(document).ready(
                    function () {
                        chart = new Highcharts.Chart({
                            chart: {
                                renderTo: 'chart',
                            },
                            title: {
                                text: 'City/Region Report'
                            },
                            tooltip: {
                                formatter: function () {
                                    var s;
                                    if (this.point.name) { // the pie chart
                                        s = '' + this.point.name + ': ' + this.y
                                                + 'customers';
                                    } else {
                                        s = '' + this.x + ': ' + this.y;
                                    }
                                    return s;
                                }
                            },
                            labels: {
                                items: [{
                                        html: '',
                                        style: {
                                            center: '40px',
                                            top: '8px',
                                            color: 'black'
                                        }
                                    }]
                            },
                            series: [{
                                    type: 'pie',
                                    name: 'Total',
                                    data: [{}],
                                    sliced: true,
                                    //center: [70, 50],
                                   
                                    size: 250,
                                    showInLegend: false,
                                    dataLabels: {
                                        enabled: true
                                    },
                                }, ]

                        }, function getdata(chart) {
                            $.ajax({
                                url: 'AjaxCityChartReport',
                                dataType: 'json',
                                error: function () {
                                    alert("error occured!!!");
                                },
                                success: function (data) {
                                    var chartData = [];
                                    $.each(data, function (i, node) {
                                        chartData.push([node.key, parseFloat(node.label)]);
                                    });
                                    chart.series[0].setData(chartData);
                                    setInterval(chartData, 60000);
                                }
                            });
                        });
                    });</script>
  
  <!-- inline scripts related to this page -->
		
  <script type="text/javascript">
            var chart;
            $(document).ready(
                    function () {
                        chart = new Highcharts.Chart({
                            chart: {
                                renderTo: 'chart1',
                            },
                            title: {
                                text: 'Category Report'
                            },
                            tooltip: {
                                formatter: function () {
                                    var s;
                                    if (this.point.name) { // the pie chart
                                        s = '' + this.point.name + ': ' + this.y
                                                + 'customers';
                                    } else {
                                        s = '' + this.x + ': ' + this.y;
                                    }
                                    return s;
                                }
                            },
                            labels: {
                                items: [{
                                        html: '',
                                        style: {
                                            center: '40px',
                                            top: '8px',
                                            color: 'black'
                                        }
                                    }]
                            },
                            series: [{
                                    type: 'pie',
                                    name: 'Total',
                                    data: [{}],
                                    sliced: true,
                                    //center: [70, 50],
                                   
                                    size: 250,
                                    showInLegend: false,
                                    dataLabels: {
                                        enabled: true
                                    },
                                }, ]

                        }, function getdata(chart) {
                            $.ajax({
                                url: 'AjaxCategoryChartReports',
                                dataType: 'json',
                                error: function () {
                                    alert("error occured!!!");
                                },
                                success: function (data) {
                                    var chartData = [];
                                    $.each(data, function (i, node) {
                                        chartData.push([node.key, parseFloat(node.label)]);
                                    });
                                    chart.series[0].setData(chartData);
                                    setInterval(chartData, 60000);
                                }
                            });
                        });
                    });</script>


<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/12/2
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
  <div>com.wipe.healthy</div>
  <!--Step:1 Prepare a dom for ECharts which (must) has size (width & hight)-->
  <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
  <div id="main" style="height:500px;border:1px solid #ccc;padding:10px;"></div>
  <div id="mainMap" style="height:500px;border:1px solid #ccc;padding:10px;"></div>

  <!--Step:2 Import echarts.js-->
  <!--Step:2 引入echarts.js-->
  <script src="js/echarts.js"></script>

  <script type="text/javascript">
      // Step:3 conifg ECharts's path, link to echarts.js from current page.
      // Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
      require.config({
          paths: {
              echarts: './js'
          }
      });

      // Step:4 require echarts and use it in the callback.
      // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
      require(
              [
                  'echarts',
                  'echarts/chart/bar',
                  'echarts/chart/line',
                  'echarts/chart/map'
              ],
              function (ec) {
                  //--- 折柱 ---
                  var myChart = ec.init(document.getElementById('main'));
                  myChart.setOption({
                      tooltip : {
                          trigger: 'axis'
                      },
                      legend: {
                          data:['肺活量','心率']
                      },
                      toolbox: {
                          show : true,
                          feature : {
                              mark : {show: true},
                              dataView : {show: true, readOnly: false},
                              magicType : {show: true, type: ['line', 'bar']},
                              restore : {show: true},
                              saveAsImage : {show: true}
                          }
                      },
                      calculable : true,
                      xAxis : [
                          {
                              type : 'category',
                              data : ['50kg','60kg','70kg','80kg']
                          }
                      ],
                      yAxis : [
                          {
                              type : 'value',
                              splitArea : {show : true}
                          }
                      ],
                      series : [
                          {
                              name:'肺活量',
                              type:'bar',
                              data:[2.0, 4.9, 7.0, 23.]
                          },
                          {
                              name:'心率',
                              type:'bar',
                              data:[2.6, 5.9, 9.0, 26.4]
                          }
                      ]
                  });

                  // --- 地图 ---
                  var myChart2 = ec.init(document.getElementById('mainMap'));
                  myChart2.setOption({
                      tooltip : {
                          trigger: 'item',
                          formatter: '{b}'
                      },
                      series : [
                          {
                              name: '中国',
                              type: 'map',
                              mapType: 'china',
                              selectedMode : 'multiple',
                              itemStyle:{
                                  normal:{label:{show:true}},
                                  emphasis:{label:{show:true}}
                              },
                              data:[
                                  {name:'广东',selected:true}
                              ]
                          }
                      ]
                  });
              }
      );
  </script>
  </body>
</html>

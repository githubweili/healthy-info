
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


  <script src="js/echarts.js"></script>
  <script type="text/javascript">


      require.config({
          paths: {
              echarts: './js'
          }
      });
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
              }
      );

  </script>
  </body>
</html>

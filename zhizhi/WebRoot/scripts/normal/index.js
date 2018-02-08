/*layui左侧导航栏效果*/
			$(function(){
				//注意：导航 依赖 element 模块，否则无法进行功能性操作
				layui.use('element', function(){
				  var element = layui.element;
				  
				  //…
				});
			});
			
			/*顶部个人中心弹出框*/
			$(function(){
				$(".u-owncenter").mouseover(function(){
					$('.m-owncenterDiv').css("display",'block');
				});
				$(".m-owncenterDiv").mouseover(function(){
					$('.m-owncenterDiv').css("display",'block');
				});
				$(".u-owncenter").mouseleave(function(){
					$('.m-owncenterDiv').css("display",'none');
				});
				$(".m-owncenterDiv").mouseleave(function(){
					$('.m-owncenterDiv').css("display",'none');
				});
				
			});
			
			/*折线图--最近十五天的数据*/
			$(function(){
				var chart = document.getElementById('u-saledata-echart');    
                var echart = echarts.init(chart);
                
                option = {
				    tooltip: {
				        trigger: 'axis'
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    toolbox: {
				        feature: {
				            saveAsImage: {}
				        }
				    },
				    xAxis: {
				        type: 'category',
				        boundaryGap: false,
				        data: ['01/07','01/08','01/09','01/10','01/11','01/12','01/13','01/14','01/15','01/16']
				    },
				    yAxis: {
				        type: 'value'
				    },
				    series: [
				        {
				            name:'销售数据',
				            type:'line',
				            stack: '值',
				            data:[0.5, 2.0, 1.0, 3.0, 0.5, 2.0, 1.0,2.5,3.0,1.2,],
				            itemStyle:{
				                normal:{
				                     color:'#4aa1ec',
				                    lineStyle:{
				                        color:'#4aa1ec'
				                    }
				                }
				            }
				        }
				    ]
				};
				echart.setOption(option);
			});
			
			/*网盘使用情况*/
			$(function(){
				$('#u-wp-canvas').circleProgress({
					value: 0.5,
					size: 65,
					fill: {
						gradient: ["#4aa1ec", "#4aa1ec"]
					}
				});
			});
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row d-flex align-items-center">
    <div class="col-3 text-right">
        <i class="far fa-user text-success display-4"></i>
    </div>
    <div class="col-4 text-center text-black">
        
        <h2 class="text-success d-block display-4 counter userStatusPieChartCard_totalCount"><b>963</b></h2>
        <!--<span class="d-block display-4 counter userStatusPieChartCard_totalCount">0</span>-->
    </div>
    <div class="col-4 text-left">
        <div class="userStatusPieChart" style="min-height: 100px"></div>
    </div>
</div>

<script type="text/javascript">
    // get cardletId from request parameter:
    jQuery(function ($) {
        var currentCardletId = '<c:out value="${param.cardletId}"/>';
        var cardletElement = $("#" + currentCardletId);
        cardletElement.on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
            
            var userStatusPieChart = echarts.init($('.userStatusPieChart', cardletElement)[0]);
            var userStatusPieChartOption = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)",
                    textStyle: {
                        fontFamily: $("body").css("font-family"),
                        fontSize: $("body").css("font-size"),
                        align: javatmp.settings.floatDefault
                    }
                },
                hover: true,
                color: ['#d15b47', '#000'],
                series: [
                    {
                        clockwise: !javatmp.settings.isRTL,
                        name: '${labels['page.home.KunjunganRanap']}',
                        type: 'pie',
                        radius: '85%',
                        avoidLabelOverlap: false,
                        hoverOffset: 4,
                        label: {
                            normal: {
                                show: false,
                                position: 'center'
                            },
                            textStyle: {
                                fontFamily: $("body").css("font-family"),
                                fontSize: $("body").css("font-size"),
                                align: javatmp.settings.floatDefault
                            }
                        },
                        data: [
                            {value: 0, name: '${labels['page.home.Bpjs']}'},
                            {value: 0, name: '${labels['page.home.Umum']}'}
                        ]
                    }
                ]
            };
            userStatusPieChart.setOption(userStatusPieChartOption);
            var cardBody = cardletElement;
            javatmp.plugins.blockWrapper(cardBody);
            javatmp.plugins.ajaxJsonAction({
                url: javatmp.settings.contextPath + "/stats/GetRegisteredUsersStatusesController",
                success: function (remoteContent) {
                    var activeUsersCount = remoteContent[1][1];
                    var inactiveUsersCount = remoteContent[0][1];
                    var allUsersCount = activeUsersCount + inactiveUsersCount;

                    userStatusPieChartOption.series[0].data[0].value = activeUsersCount;
                    userStatusPieChartOption.series[0].data[1].value = inactiveUsersCount;
                    $('.userStatusPieChartCard_totalCount', cardletElement).html(allUsersCount).counterUp({
                        delay: 10,
                        time: 1000
                    });
                    userStatusPieChart.setOption(userStatusPieChartOption);
                },
                complete: function (jqXHR, textStatus) {
                    $(cardletElement).unblock();
                }
            });
            var ContainerResizeEventHandler = function (event) {
                userStatusPieChart.resize();
            };

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, ContainerResizeEventHandler);

            cardletElement.on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.javaTmpContainerResizeEventName, ContainerResizeEventHandler);
                return true;
            });
        });
    });
</script>
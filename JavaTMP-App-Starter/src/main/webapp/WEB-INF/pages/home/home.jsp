<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding pt-3">
    
    <div class="form-row">
        <div class="col-lg-6">
            <div class="align-self-stretch d-flex card shadow bg-dark mb-3">
            <div class="card my-3" id="LineChart">
                <div class="card-header">
                    BARBER JOHNSON
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/BarberJohnson"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
<!--                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>-->
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="line-1-canvas" style="width: 100%;min-height: 400px"></div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        
        <div class="col-lg-6">
            
<!--        <div class="form-row">
            <div class="align-self-stretch">
                <div class="flex-fill text-black">
                    <h1><b>INDIKATOR PELAYANAN RUMAH SAKIT</b></h1>
                </div>
            </div>
        </div>-->
        <div class="form-row">
            <div class="align-self-stretch d-flex card shadow mb-5">
                <div id="reportrange" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
                    <i class="fa fa-calendar"></i>&nbsp;
                    <span></span> <i class="fa fa-caret-down"></i>
                </div>
            </div>
        </div>
        
        <div class="form-row">
            <div class="align-self-stretch d-flex col-xl-4 col-lg-4 col-md-4">
                <div class="flex-fill card text-white shadow mb-3">
                    <div class="card-header bg-black">
                        ${labels['page.home.BOR']}
                        <div class="options float-right">
                            <a load-on-starup="true"
                                href="${pageContext.request.contextPath}/pages/home/UserCountCardletBody"
                                class="reload text-white"
                                actionableWrapperType="ajax-area-in-card">
                                <i class="fa fa-sync"></i>
                            </a>
                        </div>
                    </div>
                    <div class="align-items-center card-body p-1"><i class="far fa-compass text-warning float-right display-4"></i></div>
                </div>
            </div>
            <div class="align-self-stretch d-flex col-xl-4 col-lg-4 col-md-4">
                <div class="flex-fill card text-white shadow mb-3">
                    <div class="card-header bg-black">
                        ${labels['page.home.AVLOS']}
                        <div class="options float-right">
                            <a load-on-starup="true"
                                href="${pageContext.request.contextPath}/pages/home/UserPagesView"
                                class="reload text-white"
                                actionableWrapperType="ajax-area-in-card">
                                <i class="fa fa-sync"></i>
                            </a>
                        </div>
                    </div>
                    <div class="align-items-center card-body p-1"></div>
                </div>
            </div>
            <div class="align-self-stretch d-flex col-xl-4 col-lg-4 col-md-4">
                <div class="flex-fill card text-white shadow mb-3">
                    <div class="card-header bg-black">
                        ${labels['page.home.TOI']}
                        <div class="options float-right">
                            <a load-on-starup="true"
                                href="${pageContext.request.contextPath}/pages/home/UserCountCardletBody"
                                class="reload text-white"
                                actionableWrapperType="ajax-area-in-card">
                                <i class="fa fa-sync"></i>
                            </a>
                        </div>
                    </div>
                    <div class="align-items-center card-body p-1"></div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="align-self-stretch d-flex col-xl-4 col-lg-4 col-md-4">
                <div class="flex-fill card text-white shadow mb-3">
                    <div class="card-header bg-black">
                        ${labels['page.home.BTO']}
                        <div class="options float-right">
                            <a load-on-starup="true"
                                href="${pageContext.request.contextPath}/pages/home/TodayVisitUserCardlet"
                                class="reload text-white"
                                actionableWrapperType="ajax-area-in-card">
                                <i class="fa fa-sync"></i>
                            </a>
                        </div>
                    </div>
                    <div class="align-items-center card-body p-1"></div>
                </div>
            </div>
            <div class="align-self-stretch d-flex col-xl-4 col-lg-4 col-md-4">
                <div class="flex-fill card text-white shadow mb-3">
                    <div class="card-header bg-black">
                        ${labels['page.home.NDR']}
                        <div class="options float-right">
                            <a load-on-starup="true"
                                href="${pageContext.request.contextPath}/pages/home/UserNeverAccessYetCardlet"
                                class="reload text-white"
                                actionableWrapperType="ajax-area-in-card">
                                <i class="fa fa-sync"></i>
                            </a>
                        </div>
                    </div>
                    <div class="align-items-center card-body p-1"></div>
                </div>
            </div>
            <div class="align-self-stretch d-flex col-xl-4 col-lg-4 col-md-4">
                <div class="flex-fill card text-white shadow mb-3">
                    <div class="card-header bg-black">
                        ${labels['page.home.GDR']}
                        <div class="options float-right">
                            <a load-on-starup="true"
                                href="${pageContext.request.contextPath}/pages/home/UserPagesView"
                                class="reload text-white"
                                actionableWrapperType="ajax-area-in-card">
                                <i class="fa fa-sync"></i>
                            </a>
                        </div>
                    </div>
                    <div class="align-items-center card-body p-1"></div>
                </div>
            </div>
        </div>
        </div>
    </div>
              
<!--    <div class="form-row">
        <div class="col-xl-3 col-lg-6 col-12">
            <div class="shadow card my-2">
                <div class="card-body">
                    <div class="media d-flex">
                        <div class="media-body text-left">
                            <h2 class="text-success"><b>963</b></h2>
                            <span>Total Kunjungan</span>
                        </div>
                        <div class="align-self-center">
                            <i class="far fa-user text-success float-right display-4"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-12">
            <div class="shadow card my-2">
                <div class="card-body">
                    <div class="media d-flex">
                        <div class="media-body text-left">
                            <h2 class="text-warning"><b>963</b></h2>
                            <span>Kunjungan Rawat Jalan</span>
                        </div>
                        <div class="align-self-center">
                            <i class="far fa-user text-warning float-right display-4"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-12">
            <div class="shadow card my-2">
                <div class="card-body">
                    <div class="media d-flex">
                        <div class="media-body text-left">
                            <h2 class="text-primary"><b>963</b></h2>
                            <span>Kunjungan IGD</span>
                        </div>
                        <div class="align-self-center">
                            <i class="far fa-user text-primary float-right display-4"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-12">
            <div class="shadow card my-2">
                <div class="card-body">
                    <div class="media d-flex">
                        <div class="media-body text-left">
                            <h2 class="text-danger"><b>963</b></h2>
                            <span>Kunjungan Rawat Inap</span>
                        </div>
                        <div class="align-self-center">
                            <i class="far fa-user text-danger float-right display-4"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>-->
                                
    <div class="form-row">
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3 bg-white text-dark">
                <div class="card-header bg-white">
                    ${labels['page.home.TotalKunjungan']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/TotalKunjungan"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <!--<i class="fa fa-sync"></i>-->
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer bg-white">
                    <a href="javascript:;" class="d-flex">
                        ${labels['global.viewDetails']}
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
                        
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3 bg-white text-dark">
                <div class="card-header bg-white">
                    ${labels['page.home.KunjunganRalan']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/KunjunganRalan"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <!--<i class="fa fa-sync"></i>-->
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer bg-white">
                    <a href="javascript:;" class="d-flex">
                        ${labels['global.viewDetails']}
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
                        
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3 bg-white text-dark">
                <div class="card-header bg-white">
                    ${labels['page.home.KunjunganIGD']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/KunjunganIGD"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <!--<i class="fa fa-sync"></i>-->
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer bg-white">
                    <a href="javascript:;" class="d-flex">
                        ${labels['global.viewDetails']}
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
                        
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3 bg-white text-dark">
                <div class="card-header bg-white">
                    ${labels['page.home.KunjunganRanap']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/KunjunganRanap"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <!--<i class="fa fa-sync"></i>-->
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer bg-white">
                    <a href="javascript:;" class="d-flex">
                        ${labels['global.viewDetails']}
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
                        
                        
<!--        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3 bg-info">
                <div class="card-header">
                    ${labels['page.home.VisitorsToday']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/TodayVisitUserPieChartCardletBody"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer">
                    <a href="javascript:;" class="d-flex">
                        ${labels['global.viewDetails']}
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3 bg-secondary text-white">
                <div class="card-header">
                    ${labels['page.home.PageViewsPerHour']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/PageViewActivitesPerHourCardletBody"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer">
                    <a href="javascript:;" class="d-flex">
                        ${labels['global.viewDetails']}
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-6 col-md-6">
            <div class="card shadow mb-3 bg-dark text-white">
                <div class="card-header">
                    ${labels['page.home.LoadTimePerHour']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/LoadtimePerHourChartCardletBody"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body p-1"></div>
                <div class="card-footer">
                    <a href="javascript:;" class="d-flex">
                        ${labels['global.viewDetails']}
                        <span class="ml-auto">
                            <i class="fa fa-arrow-circle-next"></i>
                        </span>
                    </a>
                </div>
                </a>
            </div>
        </div>-->
    </div>
    <div class="form-row">
        <div class="col-lg-6">
            <div class="card shadow mb-3">
                <div class="card-header">
                    ${labels['page.home.UsersLocations']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/UsersLocationsInTheWorldCardletBody"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body p-0"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card shadow mb-3">
                <div class="card-header">
                    ${labels['page.home.UsersBirthdayPerMonths']}
                    <div class="options float-right">
                        <a load-on-starup="true"
                           href="${pageContext.request.contextPath}/pages/home/UsersBirthdayPerMonthsCardletBody"
                           class="reload"
                           actionableWrapperType="ajax-area-in-card">
                            <i class="fa fa-sync"></i>
                        </a>
                        <a href="javascript:;" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body p-0"></div>
            </div>
        </div>
    </div>
    <style type="text/css">
    </style>
    <script type="text/javascript">
        jQuery(function ($) {
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                $(javatmp.settings.defaultOutputSelector).find("[load-on-starup=true]").each(function () {
                    $(this).trigger("click");
                });
                $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                    $(javatmp.settings.defaultOutputSelector).off("click");
                    return true;
                });
            });
            
        });
        
        $(function() {
            var start = moment().subtract(29, 'days');
            var end = moment();

            function cb(start, end) {
                $('#reportrange span').html(start.format('D MMMM YYYY') + ' - ' + end.format('D MMMM YYYY'));
            }

            $('#reportrange').daterangepicker({
                startDate: start,
                endDate: end,
                ranges: {
                    'Hari Ini': [moment(), moment()],
                    'Kemarin': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    '7 Hari Terakhir': [moment().subtract(6, 'days'), moment()],
                    '30 Hari Terakhir': [moment().subtract(29, 'days'), moment()],
                    'Bulan Ini': [moment().startOf('month'), moment().endOf('month')],
                    'Bulan Lalu': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
                    'Tahun Ini': [moment().startOf('year'), moment().endOf('year')],
                    'Tahun Lalu': [moment().subtract(1, 'year').startOf('year'), moment().subtract(1, 'year').endOf('year')]
                }
            }, cb);

            cb(start, end);

        });
           
    </script>
</div>

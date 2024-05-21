<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ar" dir="rtl" class="">
    <head>
        <title>JavaTMP Landing Empty Starter Page</title>
        <meta name="description" content="Bootstrap Template by javatmp.com">
        <meta name="keywords" content="Bootstrap admin and dashboard template built using HTML 5 , CSS 3 , jQuery , Bootstrap 4 and Java">

        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
        <link href='${pageContext.request.contextPath}/assets/dist/css/javatmp-plugins-print-all.min.css' rel='stylesheet' media='print' />
        <link id="themeStyleSheet" href="${pageContext.request.contextPath}/assets/dist/css/javatmp-schooly-rtl.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/dist/css/font-family-ar.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="">
        <div id="oneTimeOverlay" style="position: fixed;width: 100%;height: 100%;top: 0px;left: 0;right: 0;bottom: 0;background-color: rgba(255,255,255,1);z-index: 1000000;cursor: wait;">جاري التحميل ...</div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="jumbotron mt-5 bg-white">
                        <h1 class="display-3">مرحباً,</h1>
                        <h1 class="display-4">أهلا بك في صفحة نموذج جافا تمب البوتسترابي</h1>
                        <p class="lead my-5">
                            صفحة قوالب بدء تشغيل جافا تمب مع مجموعة كبيرة من المكونات الإضافية ومكونات واجهة المستخدم وتعمل بسلاسة على جميع متصفحات الويب والأجهزة اللوحية والهواتف الرئيسية. إنها أداة رائعة لبدء مشروع بوتستراب جديد مع مجموعة منسقة من موارد الواجهة الأمامية المختبرة والتي تم دمجها لتبسيط عملية التطوير.
                        </p>
                        <a class="btn btn-primary btn-lg" href="http://www.javatmp.com" role="button">الصفحة الرئيسية</a>
                        <a class="btn btn-primary btn-lg" href="http://help.javatmp.com/" role="button">الشرح والتعليم</a>
                    </div>
                    <div class="text-center">
                        <a href="http://www.javatmp.com" target="_blank"><span>جميع الحقوق محفوظة &copy; 2019 javatmp.com</span></a>
                    </div>
                </div>
            </div>
        </div>
        <style type="text/css">
            /*            body {
                            background-color: #DEE1E3;
                            background-image: linear-gradient(rgba(0,0,0,.05) 1px,transparent 1px),linear-gradient(90deg,rgba(0,0,0,.05) 1px,transparent 1px),linear-gradient(rgba(0,0,0,.035) 1px,transparent 1px),linear-gradient(90deg,rgba(0,0,0,.035) 1px,transparent 1px);
                            background-size: 96px 96px,96px 96px,24px 24px,24px 24px;
                            background-position: -1px -1px;
                            min-width: 0;
                            background-attachment: fixed;
                            background-position: center;
                        }*/
        </style>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp-plugins-all-locale-en.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/dist/js/javatmp.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/app/js/javatmp.plugins.wrapper.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(function ($) {
                var defaults = {};
//                index.init(defaults);
                javatmp.plugins.init(defaults);
            });
        </script>
        <!-- You could put here Your google analytics script tag -->        <script type="text/javascript">
            jQuery(function ($) {
                $("#oneTimeOverlay").remove();
            });
        </script>
    </body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <div class="row">
        <div class="col-lg-12">
            <div class="card my-3">
                <div class="card-header">
                    Web Application Table Folder Browser
                    <div class="options float-right">
                        <a class="settings"><i class="fa fa-cog"></i></a>
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="reload"><i class="fa fa-sync"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <table id="treetable" class="table table-sm table-condensed table-hover table-bordered">
                        <thead>
                            <tr>
                                <th width="150" class="">key</th>
                                <th>Web App Content</th>
                                <th  width="100">Size</th>
                                <th  width="100">Folder</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            (function ($) {
                glyph_opts = {
                    preset: "awesome5",
                    map: {
                        doc: "far fa-file-alt",
                        docOpen: "far fa-file",
                        checkbox: "far fa-square",
                        checkboxSelected: "far fa-check-square",
                        checkboxUnknown: "far fa-minus-square",
                        dragHelper: "fa fa-arrows",
                        dropMarker: "fa fa-arrow-right",
                        error: "fa fa-exclamation-triangle",
                        expanderClosed: "fa fa-chevron-right",
                        expanderLazy: "fa fa-chevron-right",
                        expanderOpen: "fa fa-chevron-down",
                        folder: "fa fa-folder",
                        folderOpen: "fa fa-folder-open",
                        loading: "fa fa-sync fa-spin"
                    }
                };
                if (javatmp.settings.isRTL === true) {
                    $.extend(true, glyph_opts, {
                        map: {
                            dropMarker: "fa fa-arrow-left",
                            expanderClosed: "fa fa-chevron-left",
                            expanderLazy: "fa fa-chevron-left"
                        }
                    });
                }
                $("#treetable").fancytree({
                    extensions: ["glyph", "table"],
                    checkbox: false,
                    glyph: glyph_opts,
                    autoScroll: true,
                    source: {
                        url: javatmp.settings.contextPath + "/dms/fileBrowser",
                        type: "POST",
                        data: {parent: "/"},
                        // debugDelay: 50,
                        cache: true
                    },
                    scrollParent: window,
                    postProcess: function (event, data) {
                        data.result = data.response;
                    },
                    table: {
                        indentation: 30,
                        nodeColumnIdx: 1
                    },
                    activate: function (event, data) {
                    },
                    lazyLoad: function (event, data) {
                        data.result = {
                            url: javatmp.settings.contextPath + "/dms/fileBrowser",
                            type: "POST",
                            data: {parent: data.node.data.logicalPath},
                            // debugDelay: 50,
                            cache: true
                        };
                    },
                    renderColumns: function (event, data) {
                        var node = data.node,
                                $tdList = $(node.tr).find(">td");
                        $tdList.eq(0).text(node.key);
                        $tdList.eq(0).css({
                            "word-break": "break-all"
                        });
                        $tdList.eq(2).text(numeral(node.data.size).format('0.00 a'));
                        $tdList.eq(3).text(!!node.folder);
                    },
                    rtl: javatmp.settings.isRTL,
                    keydown: function (event, data) {
                        if (javatmp.settings.isRTL === true) {
                            var KC = $.ui.keyCode;
                            var oe = event.originalEvent;
                            // Swap LEFT/RIGHT keys
                            switch (event.which) {
                                case KC.LEFT:
                                    oe.keyCode = KC.RIGHT;
                                    oe.which = KC.RIGHT;
                                    break;
                                case KC.RIGHT:
                                    oe.keyCode = KC.LEFT;
                                    oe.which = KC.LEFT;
                                    break;
                            }
                        }
                    }
                });
            }(jQuery));
        });
    </script>
</div>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h5 class="my-3">Account Ledger</h5>
    <hr/>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <div class="options float-right">
                        <a href="#" class="collapse"><i class="fa fa-chevron-up"></i></a>
                        <a href="#" class="fullscreen"><i class=" fa fa-expand"></i></a>
                    </div>
                </div>
                <div class="card-body p-1">
                    <div class="ml-0 my-0 p-1 border">
                        <table id="account-ledger" cellspacing="0" class="table table-sm table-condensed table-bordered"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--
    Reference Your external Stylesheet file here
    if your feature or plugins could not support to run globally.
    <link href="components/" rel="stylesheet">
    -->
    <style type="text/css">
        /*
                Embed CSS styling for current page.
        */
    </style>

    <!--
    Reference Your external Javascript file here
    if your feature or plugins could not support to run globally.
    <script src="components/"></script>
    -->
    <script type="text/javascript">
        // You could write safely Javascript code here too as our template
        // should load mandatory libraries and plugins before.
        // <--- HERE --->
        //

        jQuery(function ($) {
            // any code put here will be run after content attach to ajax output container and before
            // controll return to main javascript file.
            // <--- HERE --->
            //

            var currencyRenderFunc = function (data, type, row, meta) {
                if (type === "display") {
                    return numeral(data).format('(0,0.00)');
                } else {
                    return data;
                }
            };

            var detailsTable = $("#account-ledger");
            var table = null;

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
                var passData = $(javatmp.settings.defaultOutputSelector).data("passData");
                table = javatmp.plugins.DataTableAjaxWrapper(detailsTable, {
                    "order": [[0, "asc"], [3, "asc"]],
                    initComplete: function (settings, json) {
                        var api = this.api();
                        // prepare id filter search field:
                    },
                    "ajax": {
                        "url": javatmp.settings.contextPath + "/accounting/ListEntries",
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        "data": function (currentDate) {
                            currentDate._ajaxGlobalBlockUI = false; // window blocked until data return
                            if (passData && passData.id && passData.id > 0) {
                                currentDate.columns[5].search.value = passData.id;
                            }
                            return JSON.stringify(currentDate);
                        }
                    },
                    columns: [
                        {title: "entry Date", data: 'entryDate', name: "entryDate", "type": "date", width: "7rem", "render": javatmp.plugins.DataTableColRenderWrapper("7rem")},
                        {title: "source Document", data: 'sourceDocument', name: "sourceDocument"},
                        {title: "code", data: 'code', name: "code"},
                        {title: "id", data: 'id', name: "id"},
                        {title: "transaction Id", data: 'transactionId', "visible": true, name: "transactionId"},
                        {title: "account Id", data: 'accountId', name: "accountId", "visible": true},
                        {title: "debit", data: 'debit', name: "debit", "render": currencyRenderFunc},
                        {title: "credit", data: 'credit', name: "credit", "render": currencyRenderFunc},
                        {title: "account Balance", data: 'accountBalance', name: "accountBalance", "render": currencyRenderFunc},
                        {title: "status", data: 'status', "visible": false, name: "status"},
                        {title: "description", data: 'description', "visible": true, name: "description"}
                    ]
                });

            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
                table.columns.adjust();
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                table.columns.adjust();
            });

            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
                table.columns.adjust();
            });

            /**
             * When another sidebar menu item pressed and before container issues new ajax request.
             * You can cancel, destroy, or remove any thing here before replace main output ajax container.
             * return false or event.preventDefault() will cancel ajax and stay you in the current page and do nothing.
             **/
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerRemoveEventName, function (event) {
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenCompress);
                $(javatmp.settings.defaultOutputSelector).off(javatmp.settings.cardFullscreenExpand);
                table.clear();
                table.destroy(true);
                return true;
            });
        });
    </script>
</div>
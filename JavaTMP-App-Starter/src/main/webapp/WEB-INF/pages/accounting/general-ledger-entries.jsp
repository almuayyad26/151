<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dynamic-ajax-content grid-gutter-padding">
    <h5 class="my-3">General Ledger Entries</h5>
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
                    <table cellspacing="0" class="table table-condensed table-bordered" id="TransactionList"></table>
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
        #TransactionList tbody tr {
            cursor: pointer;
        }

        td.details-control {
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            cursor: pointer;
            text-align: center;
            width: 1.25em;
        }
        td.details-control:before {
            content: "\f105";
        }
        tr.shown td.details-control:before {
            content: "\f107";
        }
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

            var listTableElement = $('#TransactionList');
            var table = javatmp.plugins.DataTableAjaxWrapper(listTableElement, {
                "ajax": {
                    "url": javatmp.settings.contextPath + "/accounting/ListEntries"
                },
                columns: [
                    {title: 'id', data: 'id', name: "id", width: "3rem", "render": javatmp.plugins.DataTableColRenderWrapper("3rem")},
                    {title: 'transactionId', data: 'transactionId', name: "transactionId", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {title: 'accountId', data: 'accountId', name: "accountId", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {title: 'amount', data: 'amount', name: "amount", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {title: 'status', data: 'status', name: "status", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")},
                    {title: 'description', data: 'description', name: "description", width: "10rem", "render": javatmp.plugins.DataTableColRenderWrapper("10rem")}
                ]
            });

            var addNewPopupButton = $("#TableList-AddNewPopupId");
            addNewPopupButton.on("click", function (event) {
                BootstrapModalWrapperFactory.createAjaxModal({
                    message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                    title: "${labels['global.loadingText']}",
                    passData: {},
                    updateSizeAfterDataFetchTo: null, // default is  or null for standard or "modal-sm"
                    //                        size: "modal-lg",
                    url: javatmp.settings.contextPath + "/customer/AddNewCustomerPopup",
                    ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady,
                    localData: {
                        callback: function (callbackData) {
                            if (callbackData.cancel === true) {
                            } else {
                                table.columns.adjust().draw();
                            }
                        }
                    }
                });
            });
            var updateSelectedButton = $("#TableList-UpdatePopupId");
            updateSelectedButton.on("click", function (event) {

                BootstrapModalWrapperFactory.showMessage("<span class='text-danger'>Sorry This feature is not supported yet</span>");
                return;
                //                var selectedCount = table.rows({selected: true}).count();
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    BootstrapModalWrapperFactory.createAjaxModal({
                        message: '<div class="text-center"><i class="fa fa-sync fa-spin fa-3x fa-fw text-primary"></i></div>',
                        passData: selectedRecord,
                        updateSizeAfterDataFetchTo: null, // default is  or null for standard or "modal-sm"
                        //                            size: "modal-lg",
                        url: javatmp.settings.contextPath + "/accounting/UpdateAccountPopup",
                        ajaxContainerReadyEventName: javatmp.settings.javaTmpAjaxContainerReady,
                        localData: {
                            callback: function (callbackData) {
                                if (callbackData.cancel === true) {
                                } else {
                                    table.columns.adjust().draw();
                                }
                            }
                        }
                    });
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }
            });
            var deleteSelectedButton = $("#TableList-DeletePopupId");
            deleteSelectedButton.on("click", function (event) {
                var selectedData = table.rows({selected: true}).data();
                if (selectedData.length > 0) {
                    var selectedRecord = selectedData[0];
                    window.javatmp.plugins.confirmAjaxAction(
                            "Delete Customer Confirmation",
                            "Are You Sure You want to delete selected Customer ?",
                            "Delete Customer",
                            javatmp.settings.labels["global.cancel"],
                            javatmp.settings.contextPath + "/customer/DeleteCustomer",
                            selectedRecord,
                            function (data) {
                                table.columns.adjust().draw();
                            }
                    );
                } else {
                    BootstrapModalWrapperFactory.showMessage("Kindly Select a record from the table");
                }
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpAjaxContainerReady, function (event) {
                // fire AFTER all transition done and your ajax content is shown to user.
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.javaTmpContainerResizeEventName, function (event) {
                // fire when user resize browser window or sidebar hide / show
                table.columns.adjust().draw();
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenCompress, function (event, card) {
                // when card compress by pressing the top right tool button
                table.columns.adjust().draw();
            });
            $(javatmp.settings.defaultOutputSelector).on(javatmp.settings.cardFullscreenExpand, function (event, card) {
                // when card Expand by pressing the top right tool button
                table.columns.adjust().draw();
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
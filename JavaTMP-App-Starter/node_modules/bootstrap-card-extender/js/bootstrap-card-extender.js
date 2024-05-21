(function (root, factory) {
    "use strict";
    // CommonJS module is defined
    if (typeof module !== "undefined" && module.exports) {
        module.exports = factory(require("jquery"), require("bootstrap"));
    }
    // AMD module is defined
    else if (typeof define === "function" && define.amd) {
        define("bootstrap-card-extender", ["jquery", "bootstrap"], function ($) {
            return factory($);
        });
    } else {
        // planted over the root!
        root.BootstrapCardExtender = factory(root.jQuery);
    }

}(this, function ($) {
    "use strict";

    var defaults = {
        cardFullscreenExpand: "card.fullscreen.expand",
        cardFullscreenCompress: "card.fullscreen.compress"
    };

    // The actual plugin constructor
    function BootstrapCardExtender() {
        this.options = $.extend({}, defaults);
        this.init();
    }

    BootstrapCardExtender.prototype.init = function () {
        var $this = this;

        // https://andylangton.co.uk/blog/development/get-viewportwindow-size-width-and-height-javascript
        function viewport()
        {
            var e = window, a = 'inner';
            if (!('innerWidth' in window)) {
                a = 'client';
                e = document.documentElement || document.body;
            }
            return {width: e[ a + 'Width' ], height: e[ a + 'Height' ]};
        }

        // Initialize and extends default bootstrap card by supporting remove card option.
        $('body').on('click', '.card > .card-header a.remove', function (e) {
            e.preventDefault();
            var panel = $(this).closest(".card");

            if ($('html').hasClass('has-card-extender-fullscreen')) {
                $('html').removeClass('has-card-extender-fullscreen');
            }

            panel.remove();
        });

        // Initialize and extends default bootstrap card by supporting min/max fullscreen card option.
        $('body').on('click', '.card > .card-header a.fullscreen', function (e) {
            e.preventDefault();
            var panel = $(this).closest(".card");
            if (panel.hasClass('card-extender-fullscreen')) {
                $(this).removeClass('on');
                panel.removeClass('card-extender-fullscreen');
                $('html').removeClass('has-card-extender-fullscreen');

                if ($(this).children('i').hasClass('fa-compress')) {
                    $(this).children('i').removeClass('fa-compress');
                    $(this).children('i').addClass('fa-expand');
                }

                panel.children('.card-body').css('height', 'auto');
                panel.trigger($this.options.cardFullscreenCompress, [panel]);

            } else {
                $(this).addClass('on');
                panel.addClass('card-extender-fullscreen');
                $('html').addClass('has-card-extender-fullscreen');

                var height = viewport().height
                        - panel.children('.card-header').outerHeight()
                        - (panel.children(".card-footer").length > 0 ? panel.children('.card-footer').outerHeight() : 0);

                panel.children('.card-body').css('height', height);

                if ($(this).children('i').hasClass('fa-expand')) {
                    $(this).children('i').removeClass('fa-expand');
                    $(this).children('i').addClass('fa-compress');
                }

                panel.trigger($this.options.cardFullscreenExpand, [panel]);
            }
        });

        // Initialize and extends default bootstrap card by supporting card collapsing option.
        $('body').on('click', '.card > .card-header a.collapse, .card > .card-header a.expand', function (e) {
            e.preventDefault();
            var el = $(this).closest(".card").find(".card-body");
            if ($(this).hasClass("collapse")) {
                $(this).removeClass("collapse").addClass("expand");
                el.slideUp(200);
                if ($(this).children('i').hasClass('fa-chevron-up')) {
                    $(this).children('i').removeClass('fa-chevron-up');
                    $(this).children('i').addClass('fa-chevron-down');
                }
            } else {
                $(this).removeClass("expand").addClass("collapse");
                el.slideDown(200);
                if ($(this).children('i').hasClass('fa-chevron-down')) {
                    $(this).children('i').removeClass('fa-chevron-down');
                    $(this).children('i').addClass('fa-chevron-up');
                }
            }
        });

    };

    return new BootstrapCardExtender();
}));

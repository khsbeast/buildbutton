// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "controllers/index"
require("jquery")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function () {
    setTimeout(function () {
        $('.flash-error').fadeOut();
    }, 2000);

    setTimeout(function () {
        $('.flash-success').fadeOut();
    }, 2000);

    $(".rcalc").hover(function () {
        let user_info_hover = $(this).attr('id').split('-')[1];
        $("#card-" + user_info_hover).hide();
        $("#card-" + user_info_hover + "-hover").show();
    }, function () {
        let user_info_hover = $(this).attr('id').split('-')[1];
        $("#card-" + user_info_hover).show();
        $("#card-" + user_info_hover + "-hover").hide();
    }
    );

    $(".subscribe_compressed_button").click(function () {
        $(".subscribe_compressed").hide();
        $(".subscribe_compressed").addClass('subscribe_compressed_hidden');
        $(".subscribe_expand").show();
        $(".subscribe_expand").removeClass('subscribe_expand_hidden');
    });

    $(".subscribe_expand_button").click(function () {
        $(".subscribe_compressed").show();
        $(".subscribe_compressed").removeClass('subscribe_compressed_hidden');
        $(".subscribe_expand").hide();
        $(".subscribe_expand").addClass('subscribe_expand_hidden');
    });

    $(".subscribe_compressed_close").click(function () {
        $(".subscribe_compressed").hide();
        $(".subscribe_expand").hide();
        setCookie('popups', 'seen', 100);
    });

    $(".subscribe_compressed_button_d").click(function () {
        $(".subscribe_compressed_d").hide();
        $(".subscribe_expand_d").show();
    });


    $(".modal-close").click(function () {
        location.href = "/";
    });

    $(".modal-close-show").click(function () {
        $(".modal").hide();
    });

    $('body').click(function (event) {
        if (!$(event.target).closest('#modal-content').length && !$(event.target).is('#modal-content')) {
            $(".modal").hide();
        }
    });

    $(document).scroll(function () {
        var y = $(this).scrollTop();
        if (y > 100 && getCookie('popups') != 'seen' && !$('.subscribe_compressed').hasClass('subscribe_compressed_hidden')) {
            $('.subscribe_compressed').fadeIn();
        } else {
            $('.subscribe_compressed').fadeOut();
        }
    });

    function setCookie(c_name, value, minutes) {
        var exdate = new Date();
        exdate.setTime(exdate.getTime() + minutes * 60 * 1000);
        var c_value = escape(value) + ((minutes == null) ? "" : "; expires=" + exdate.toUTCString());
        document.cookie = c_name + "=" + c_value;
    }

    function getCookie(c_name) {
        var i, x, y, ARRcookies = document.cookie.split(";");
        for (i = 0; i < ARRcookies.length; i++) {
            x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
            y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
            x = x.replace(/^\s+|\s+$/g, "");
            if (x == c_name) {
                return unescape(y);
            }
        }
    }

});

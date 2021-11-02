// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "stylesheets/application.scss"
require("jquery")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function() {
  setTimeout(function(){
    $('.flash-error').fadeOut();
  }, 2000);

  setTimeout(function(){
    $('.flash-success').fadeOut();
  }, 2000);

  $(".rcalc").hover(function(){
    let user_info_hover = $(this).attr('id').split('-')[1];
    $("#card-"+user_info_hover).hide();
    $("#card-"+user_info_hover+"-hover").show();
  },function(){
    let user_info_hover = $(this).attr('id').split('-')[1];
    $("#card-"+user_info_hover).show();
    $("#card-"+user_info_hover+"-hover").hide();
  }
  );

});

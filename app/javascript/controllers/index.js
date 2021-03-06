// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import NutshellController from "./nutshell_controller.js"
application.register("nutshell", NutshellController)

import OverviewController from "./overview_controller.js"
application.register("overview", OverviewController)

import OverviewDropdownController from "./overview_dropdown_controller.js"
application.register("overview-dropdown", OverviewDropdownController)

import ScrollSliderController from "./scroll_slider_controller.js"
application.register("scroll-slider", ScrollSliderController)

import SubscribeModalController from "./subscribe_modal_controller.js"
application.register("subscribe-modal", SubscribeModalController)

import TldrSliderController from "./tldr_slider_controller.js"
application.register("tldr-slider", TldrSliderController)

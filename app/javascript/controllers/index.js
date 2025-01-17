// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ConfirmDialogController from "./confirm_dialog_controller"
application.register("confirm-dialog", ConfirmDialogController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import InputNumberController from "./input_number_controller"
application.register("input-number", InputNumberController)

import LoadingController from "./loading_controller"
application.register("loading", LoadingController)

import SelectSubmitController from "./select_submit_controller"
application.register("select-submit", SelectSubmitController)

import TabsController from "./tabs_controller"
application.register("tabs", TabsController)

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
// import Swal from 'sweetalert2/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'
window.Swal = Swal;
import "../stylesheets/application"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

global.toastr = require("toastr")

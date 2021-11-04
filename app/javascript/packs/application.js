// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "chartkick/chart.js"

Rails.start()

ActiveStorage.start()
//= require bootstrap-sprockets
//= require jquery3
//= require popper
//= require bootstrap-datepicker

function toggleDropdown(element) {
    var dropdown = new Dropdown(element);
    dropdown.toggle();
}

document.addEventListener('turbolinks:load', function() {
    var dropdown_buttons = document.querySelectorAll('[data-toggle="dropdown"]');

    dropdown_buttons.forEach(function(element) {
        element.addEventListener('click', function(event) {
            event.preventDefault();

            toggleDropdown(this);
        });
    });
});



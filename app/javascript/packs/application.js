// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//=require bootstrap
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// my added
import '@fortawesome/fontawesome-free/js/all';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require('jquery')

// フォームが入力されたらsubmitを活性化
$(function() {
    if ($('#text').val().length == 0) {
        $('#submit').prop('disabled', true);
    }
    $('#text').on('keydown keyup keypress change', function() {
        if ( $(this).val().length > 0 ) {
            $('#submit').prop('disabled', false);
        } else {
            $('#submit').prop('disabled', true);
        }
    });
});

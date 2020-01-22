// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("chartkick")
require("chart.js")

//= require jquery_ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

 $(window).on('load',function(){
    var max_ele = $('.rate')[0];
    var min_ele = $('.rate')[0] ;
    var max = parseFloat($('.rate')[0].textContent);;
    var min = parseFloat($('.rate')[0].textContent);;
    var bg = 0;
    $('.rate').each(function () {

        val = parseFloat($(this).text());    
        if (val > max)
        {
            max = val;
            max_ele = this
        }
        if (val < min)
        {
            min = val;
            min_ele = this
        }
    
    });
  $(max_ele).attr('id','highest');
  $(min_ele).attr('id','lowest');

  document.getElementById("highest").style.backgroundColor = "green";
  document.getElementById("lowest").style.backgroundColor = "red";

});
    
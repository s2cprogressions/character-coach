// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require material


emojione.imageType = 'svg';
emojione.imagePathSVG = '/emojione/assets/svg/';

document.addEventListener("turbolinks:load", function() {
  $(".js-emojione").each(function() {
    var $this = $(this);
    var replacementHtml = emojione.toImage($this.html())
    $this.html(replacementHtml)
  });
});

function getNavigationBarColor() {
  var colorString = getComputedStyle(document.getElementsByTagName("header")[0]).backgroundColor
  return colorString.replace(/[\srgb()]/g, ""); // rgb(1,2,3) -> 1,2,3
}

function hideNavigationBarForMobile() {
  // TODO: implement?
}

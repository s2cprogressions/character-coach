// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


var animNumber = 0;
var anims = [
  'pulse',
  'bounce',
  'rubberBand'
]

document.addEventListener("turbolinks:load", function() {
  $(document.body).on('click', '.animated-link', function (event) {
    event.preventDefault();
    var $this = $(this);
    $this.addClass("selected");

    anim = anims[animNumber];
    animNumber = (animNumber + 1) % anims.length;

    $this.animateCss(anim)
    setTimeout(function() {
      Turbolinks.visit($this.attr('href'));
    }, 1000)
  });
});

$.fn.extend({
  animateCss: function (animationName) {
    var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
    this.addClass('animated ' + animationName).one(animationEnd, function() {
      $(this).removeClass('animated ' + animationName);
    });
  }
});

function addAnimateCSS() {
  $('#activities').animateCss('bounce');
}

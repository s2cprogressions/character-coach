// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$('#activitiesSubmit').click(function (event) {
    alert('Hooray!');
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
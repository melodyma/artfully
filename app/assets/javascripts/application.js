// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require masonry/jquery.masonry
//= require masonry/jquery.event-drag
//= require masonry/jquery.imagesloaded.min
//= require masonry/jquery.infinitescroll.min
//= require masonry/modernizr-transitions
//= require masonry/box-maker
//= require masonry/jquery.loremimages.min
//= require bootstrap/modal
//= require_tree .


$(function() {

  // Freewall Layout //
  var wall = new freewall("#freewall");
  wall.reset({
  selector: '.brick',
  animate: true,
  cellW: 200,
  cellH: 'auto',
  onResize: function() {
      wall.fitWidth();
    }
  });
  
  wall.container.find('.brick img').load(function() {
    wall.fitWidth();
  });
 
  // Form Labels Animation //
  var i = 0, inputs = document.querySelectorAll('input'), l = inputs.length;

  for(; i < l; i++) {
    inputs[i].addEventListener('focus', function(){
      this.parentNode.classList.add('focus');
    }, false);
    inputs[i].addEventListener('blur', function(){
      this.parentNode.classList.remove('focus');
      if (this.value.length > 0) {
        this.parentNode.classList.add('data');
      }
      else {
        this.parentNode.classList.remove('data');
      }
    }, false);
  }
});

// Header and Search Bar Animation //
$(window).scroll(function() {
  if ($(this).scrollTop() > 1){  
    $('nav').addClass("sticky");
    $('.search-bar').slideUp();
    $('.search-icon').css({'cursor': 'pointer'});
    $('.search-icon').click(function() {
      $('.search-bar').slideDown();
    }); 
  }
  else {
    $('nav').removeClass("sticky");
    $('.search-bar').slideDown();
  }
});




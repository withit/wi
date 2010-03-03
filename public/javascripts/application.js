// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
  $('body').supersleight({shim: '/images/blank.gif'});
  
  $('.website a').live('click', function(){
    $('body').append('<div class="enlargement"><h2>' + $(this).text() + '</h2><div><img src="' + this.href + '"><a href="#" class="close">close</a></div></div>');
    return false;
  });
  $('.enlargement').live('click', function(){
    $('.enlargement').remove();
    return false;
  });
  
  $('.enlargement').live('click', function(){
    $('.enlargement').remove();
    return false;
  });
  
  $('.case_study_main .thumbnails img').live('click',function(){
    $('.case_study_main img').first().attr('src', $(this).attr('data-enlargement'));
    $('.case_study_main p').first().html($(this).attr('title'));
  });
  $('#tweets').tweetable({username: 'withimagination', limit: 30, time: true}); //get 30 but only display first 3 so that it isn't empty when there are retweets
  $('.sizes select').live('change', function(){
     document.location = '/projects/banners/' + this.value;
  });
  
  $('.testimonials .testimonial').hide();
  $('.testimonials .testimonial').first().show();
  if(!support_input_placeholder())
  {
    $('input[type=text]').placeholder();
  }
});

function support_input_placeholder(){
  var i = document.createElement('input');
  return 'placeholder' in i;
}

$.periodic({}, function() {
  $('.testimonials .testimonial:visible').first().fadeOut(1000, function(){
    if($(this).next().text()){
      $(this).next().fadeIn(1000);
    } else {
      $('.testimonials .testimonial').first().fadeIn(1000);
    }
  });
});

$.periodic({}, function() {
  var p = $('.projects .project.selected').first();
  p.children('.main').show();
  p.children('.main').fadeOut(1000, function(){
    $(p).removeClass('selected');
    var next = p.next();
    if(next.length == 0){
      next = $('.projects .project').first()
    }
    next.children('.main').hide();
    next.addClass('selected');
    next.children('.main').fadeIn(1000);
  });
});






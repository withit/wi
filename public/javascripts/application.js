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
  $('#tweets').tweetable({username: 'withimagination', limit: 5, time: true});
  $('.sizes select').live('change', function(){
     document.location = '/projects/banners/' + this.value;
  });
})

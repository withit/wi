// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
  $('body').supersleight({shim: '/images/blank.gif'});
  
  $('.website a').live('click', function(){
    $('body').append('<div class="enlargement"><h2>' + this.innerHTML + '</h2><div><img src="' + this.href + '"><a href="#" class="close">close</a></div></div>');
    return false;
  });
  $('.enlargement').live('click', function(){
    $('.enlargement').remove();
    return false;
  });
})

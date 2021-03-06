// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var current_slide;
var current_marker;
var in_transaction = false;
function next_slide()
{
  if(Effect.Queues.get('slide').size()==0)
  {  
    current_slide.fade({queue: {position: 'end', scope: 'slide'}});
    current_slide = current_slide.next() || $('slide_show').down();
    current_slide.appear();
  
    current_marker.morph({backgroundColor: '#E1E1E1'});
    current_marker = current_marker.next('div') || $('markers').down();
    current_marker.morph({backgroundColor: '#2D9DD8'});
  }
}

function prev_slide()
{
  if(Effect.Queues.get('slide').size()==0)
  {  
    current_slide.fade({queue: {position: 'end', scope: 'slide'}});
    current_slide = current_slide.previous() || $('slide_show').immediateDescendants().last();
    current_slide.appear();
  
    current_marker.morph({backgroundColor: '#E1E1E1'});
    current_marker = current_marker.previous('div') || $('markers').getElementsBySelector('div').last();
    current_marker.morph({backgroundColor: '#2D9DD8'});
  }
}


document.observe("dom:loaded", function() {
  $$('div#slide_show img').invoke('hide');
  
  if($('slide_show') && $('slide_show').down() && $('markers'))
  {
    current_slide = $('slide_show').down().show();
    current_marker = $('markers').down().setStyle({backgroundColor: '#2D9DD8'});
    new PeriodicalExecuter(next_slide, 3);
  }
  if($$('form #page_content').first())
  {
    new Form.Element.Observer($('page_content'), 3, function(e){
      new Ajax.Request('/previews.js', {method: 'post', parameters: {content: e.getValue()}});
    })
  }
});

var DefaultClearingInput = Behavior.create({
  initialize: function(default_value) {
    this.default_value = default_value;
  },
  onfocus: function(e) {
    if(e.element().value == this.default_value){
      e.element().value = '';
    }
  },
  onblur: function(e) {
    if(e.element().value == ''){
      e.element().value = this.default_value;
    }
  }
});

Event.addBehavior({
  '.twitter:mouseover': function(e){
    if($('latest_tweet')){
      $('latest_tweet').show();
    }
  },
  '.twitter:mouseout': function(e){
    if($('latest_tweet')){
      $('latest_tweet').hide();
    }
  },
  '.assets li:click' : function(e){
    $('page_content').value += (" !" + e.element().down('.full_path').innerHTML + "! ");
  },
  'body.home .hero #next:click' : function(e){
    next_slide();
  },
  'body.home .hero #previous:click' : function(e){
    prev_slide();
  },
  '#express_contact_us #enquiry_name': DefaultClearingInput('name'),
  '#express_contact_us #enquiry_email': DefaultClearingInput('email address'),
  '#express_contact_us #enquiry_phone': DefaultClearingInput('phone'),
  '.sizes select#size:change': function(e){
    window.location = "/banners/" + e.element().value
  }
})


document.observe("dom:loaded", function () {
   var banner = $$('.top_banner').first();
   if (banner) {
    banner.setStyle({'margin' : '0'});
   }
});
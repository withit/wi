// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var current_slide;
var current_marker;
function next_slide()
{
  current_slide.fade();
  current_slide = current_slide.next() || $('slide_show').down()
  current_slide.appear();
  
  current_marker.morph({backgroundColor: '#E1E1E1'});
  current_marker = current_marker.next('div') || $('markers').down();
  current_marker.morph({backgroundColor: '#2D9DD8'});
}


document.observe("dom:loaded", function() {
  $$('div#services div').invoke('hide');
  $$('div#slide_show img').invoke('hide');
  
  if($('slide_show') && $('markers'))
  {
    current_slide = $('slide_show').down().show();
    current_marker = $('markers').down().setStyle({backgroundColor: '#2D9DD8'});
    new PeriodicalExecuter(next_slide, 3);
  }
});

Event.addBehavior({
  'div#services a:mouseover' : function() {
    Effect.BlindDown(this.up('u').next('div'),{ delay: 0.2, duration: 0.7, queue: {scope: this.identify(), position: 'end', limit: 1}});
  },
  'div#services a:mouseout' : function() {
    var q = Effect.Queues.get(this.identify());
    var c = false;
    q.each(function(e){
      if(e.currentFrame == 0)
        {e.cancel();c = true;}
    });
    if(!c)
    {
      Effect.BlindUp(this.up('u').next('div'),{ duration: 0.7, queue: {scope: this.identify(), position: 'end'}});
    }
  }
});


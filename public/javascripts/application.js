// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


document.observe("dom:loaded", function() {
  // initially hide all containers for tab content
  
  $$('div#services p').invoke('hide');
});

Event.addBehavior({
  'div#services a:mouseover' : function(e) {
    Effect.BlindDown(this.up('u').next('p'),{ duration: 0.5, queue: {scope: this.name, position: 'end', limit: 1}});
  },
  'div#services a:mouseout' : function(e) {
    Effect.BlindUp(this.up('u').next('p'),{ duration: 0.3, queue: {scope: this.name, position: 'end'}});
  },
});

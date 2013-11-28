// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .
jQuery.expr[':'].regex = function(elem, index, match) {
var matchParams = match[3].split(','),
    validLabels = /^(data|css):/,
    attr = {
        method: matchParams[0].match(validLabels) ?
                    matchParams[0].split(':')[0] : 'attr',
        property: matchParams.shift().replace(validLabels,'')
    },
    regexFlags = 'ig',
    regex = new RegExp(matchParams.join('').replace(/^\s+|\s+$/g,''), regexFlags);
return regex.test(jQuery(elem)[attr.method](attr.property));
}
jQuery(function(){
  $( "#show_do_log_in" ).click(function() {
    $( "#do_log_in" ).toggle( "blind" );
  });
  $( "#do_log_in" ).hide();

  $( ":regex(id, ^comments_)" ).click(function() {
    var dom_str = ".list_" + $(this).attr("id");
    $( dom_str ).toggle( "blind" );
  });
  $( ".list_comments" ).hide();
});
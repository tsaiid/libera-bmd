$(document).ready(function(){
  t1 = $('#i1').contents().find('#t1');

  $.getJSON( "/studies/report/64304529/text").done(function(data){
    t1.val(data.report);
  });

  t2 = $('#i2').contents().find('#t2');
  t2.val("t2");
});
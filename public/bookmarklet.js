$(document).ready(function(){
  acc_no = $('iframe[name=frameWork]').contents().find('#tabIframe2').contents().find('input[name=OldAccNo]').val();
  report_area = $('iframe[name=frameWork]').contents().find('#tabIframe2').contents().find('textarea[name=ReportContent]');

  $.ajax({
    dataType: "json",
    url: "//bda.dev/studies/report/" + acc_no + "/text",
    crossDomain: true
  }).done(function(data){
    //report_area.val(data.report);
    alert(data.report);
  });
});
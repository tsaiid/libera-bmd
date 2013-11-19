# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.bda-btn-report').popover({
    container: "body",
    placement: "right",
    content: ->
      div_id = "div-id-" + $.now()
      acc_no = $(this).attr('id').substring(4)
      return details_in_popup(acc_no, div_id)
    html: true,
    trigger: 'hover'
  });

details_in_popup = (acc_no, div_id) ->
  report = ""
  $.getJSON( "/studies/report/" + acc_no )
    .done (data)-> 
      $('#'+div_id).html(data.report)
  '<div id="' + div_id + '">Loading...</div>'

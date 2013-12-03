$(document).ready ->
  # get previous and next link via ajax
  $.getJSON( "/studies/pagination/" + $('#acc_no').text() )
    .done (data)->
      if data.prev_link?.length
        $('#prev_link').attr('href', data.prev_link)
        $('#prev_link').parent().removeClass('disabled')
      if data.next_link?.length
        $('#next_link').attr('href', data.next_link)
        $('#next_link').parent().removeClass('disabled')

details_in_popup = (acc_no, div_id) ->
  report = ""
  $.getJSON( "/studies/report/" + acc_no )
    .done (data)->
      $('#'+div_id).html(data.report)
  '<div id="' + div_id + '">Loading...</div>'

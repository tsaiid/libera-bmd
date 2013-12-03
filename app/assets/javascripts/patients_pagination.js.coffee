$(document).ready ->
  # get previous and next link via ajax
  $.getJSON( "/patients/pagination/" + $('#pid').text() )
    .done (data)->
      if data.prev_link?.length
        $('#prev_link').attr('href', data.prev_link)
        $('#prev_link').parent().removeClass('disabled')
      if data.next_link?.length
        $('#next_link').attr('href', data.next_link)
        $('#next_link').parent().removeClass('disabled')

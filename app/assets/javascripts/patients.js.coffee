# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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

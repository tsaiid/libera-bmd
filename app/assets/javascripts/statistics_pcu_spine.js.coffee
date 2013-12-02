$(document).ready ->
  age_lists = eval($('#age_lists').val())
  interval = $('#interval').val()
  sex = $('#sex').val()

  # get bmd and std via ajax
  completed = [[], [], [], [], []]
  $.each [1, 2, 3, 4], (i, level)->
    $.each age_lists, (i, age)->
      $.getJSON( "/statistics/spine/"+level+"/"+sex+"/"+age+"/"+interval+"/round/4" )
        .done (data)->
          $("#"+sex+"_"+age+"_avg_l"+level+"_bmd").text(data.avg_bmd)
          $("#"+sex+"_"+age+"_l"+level+"_std").text(data.std)
          $("#"+sex+"_"+age+"_l"+level+"_count").text(data.count)
          completed[level].push age
          if completed[level].sort().toString() == age_lists.sort().toString()
            $('#l'+level+'_is_loading').fadeOut()

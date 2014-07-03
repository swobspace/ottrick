$(document).on('click', '#ticket_ticketfor_type', ->
  type = $(this).find("option:selected").val()
  # alert(type)
  $('#ticket_ticketfor_id optgroup').find('option').andSelf().hide()
  $("#ticket_ticketfor_id optgroup[label=\"#{type}\"]").find('option').andSelf().show()
)
ready = ->
  $('#ticket_ticketfor_id optgroup').find('option').andSelf().hide()

$(document).ready(ready)
$(document).on('page:load', ready)

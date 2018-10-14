$(document).on 'turbolinks:load', ->
  
  current_health    = $('#current_status').data('fighter-health')
  current_strength  = $('#current_status').data('fighter-strength')
  available_upgrade = $('#current_status').data('fighter-available_upgrade')

  $('#fighter_health_range').on 'input', ->
    $('#health_output').text @value
    bonus = @value - current_health
    potential_strength = current_strength + (available_upgrade - (bonus))
    $('#fighter_strength_range').val potential_strength
    $('#strength_output').text potential_strength
    return

  $('#fighter_strength_range').on 'input', ->
    $('#strength_output').text @value
    bonus = @value - current_strength
    potential_health = current_health + (available_upgrade - (bonus))
    $('#fighter_health_range').val potential_health
    $('#health_output').text potential_health
    return

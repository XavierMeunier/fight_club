$(document).on 'turbolinks:load', ->

  $('#fight_winner').on 'change', ->
    self = this
    $('#fight_looser').find('option').prop 'disabled', ->
      @value == self.value
    return

  $('#fight_looser').on 'change', ->
    self = this
    $('#fight_winner').find('option').prop 'disabled', ->
      @value == self.value
    return

TTicket.TroublesIndex =
  init: ->
    @_initDatePicker()
  _initDatePicker: ->
    $('#troubles_grid_occupancy').datetimepicker
      format: 'YYYY-MM-DD'

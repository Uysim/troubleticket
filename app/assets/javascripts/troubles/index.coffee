TTicket.TroublesIndex =
  init: ->
    @_initDatePicker()
    @_initDateTimePicker()
  _initDatePicker: ->
    $('#troubles_grid_occupancy').datetimepicker
      format: 'YYYY-MM-DD'
  _initDateTimePicker: ->
    $('.date_time_filter').datetimepicker
      format: 'YYYY-MM-DD LT'

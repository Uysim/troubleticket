TTicket.TroublesNew = TTicket.TroublesCreate = TTicket.TroublesForm =
  init: ->
    @_initDateTimePicker()

  _initDateTimePicker: ->
    $('.datetime-picker').datetimepicker format: 'YYYY/MM/DD LT'

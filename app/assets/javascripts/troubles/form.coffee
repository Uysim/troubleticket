TTicket.TroublesUpdate = TTicket.TroublesEdit = TTicket.TroublesNew = TTicket.TroublesCreate = TTicket.TroublesForm =
  init: ->
    @_initDatePicker()
    @_initDateTimePicker()
  _initDatePicker: ->
    $('.datepicker').datetimepicker
      format: 'YYYY-MM-DD',
      minDate: new Date()

  _initDateTimePicker: ->
    $('.datetime-picker').datetimepicker
      format: 'YYYY-MM-DD LT',
      minDate: new Date()

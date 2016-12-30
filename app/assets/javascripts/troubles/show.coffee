TTicket.TroublesShow =

  init: ->
    @_initDatePicker()

  _initDatePicker: ->
    $('#trouble_occupancy').datetimepicker
      format: 'YYYY-MM-DD',
      minDate: new Date()

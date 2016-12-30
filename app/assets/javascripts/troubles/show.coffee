TTicket.TroublesShow =

  init: ->
    @_initDatePicker()

  _initDatePicker: ->
    $('#trouble_occupancy').datepicker();

TTicket.TroublesUpdate = TTicket.TroublesEdit = TTicket.TroublesNew = TTicket.TroublesCreate = TTicket.TroublesForm =
  init: ->
    @_initDatePicker()
  _initDatePicker: ->
    $('#trouble_occupancy').datepicker();

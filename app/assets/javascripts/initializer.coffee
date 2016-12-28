TTicket.Initializer =
  exec: (pageName) ->
    if pageName && TTicket[pageName]
      TTicket[pageName]['init']()

  currentPage: ->
    return '' unless $('body').attr('id')

    bodyId      = $('body').attr('id').split('-')
    action      = TTicket.Util.capitalize(bodyId[1])
    controller  = TTicket.Util.capitalize(bodyId[0])
    controller + action

  init: ->
    TTicket.Initializer.exec('Common')
    if @currentPage()
      TTicket.Initializer.exec(@currentPage())

$(document).on 'ready', ->
  TTicket.Initializer.init()

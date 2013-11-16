class Counter

  constructor: ->
    @attachCounter()

  attachCounter: ->
    @startCounter() if $('#counter').length > 0

  startCounter: ->
    @duration = 60
    @displayMessage()
    @counter = setInterval @counterCallback, 1000

  counterCallback: =>
    @duration -= 1
    if @duration > 0
      @displayMessage()
    else
      clearInterval @counter
      @redirect()

  displayMessage: ->
      $('#counter').html(@duration + ' s remaining')

  redirect: ->
    window.location.href = '/'

$ -> new Counter

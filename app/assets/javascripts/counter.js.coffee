class Counter

  constructor: ->
    @attachCounter() if @counterDivPresent()

  counterDivPresent: ->
    $('#counter').length > 0

  timeout: ->
    parseInt($("#counter").attr("data-timeout")) ? 60

  attachCounter: ->
    @startCounter()
    @observeAjax()

  observeAjax: ->
    $(document).on 'ajaxStart', @pauseCounter
    $(document).on 'ajaxStop', @resumeCounter

  startCounter: ->
    @duration = @timeout()
    @paused = false
    @displayMessage()
    @counter = setInterval @counterCallback, 1000

  pauseCounter: =>
    @paused = true

  resumeCounter: =>
    @paused = false

  counterCallback: =>
    return if @paused
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

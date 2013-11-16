class TabooSpinner

  constructor: ->
    @spinner = new Spinner()
    @observeAjax()

  observeAjax: ->
    $(document).on 'ajaxStart', @showSpinner
    $(document).on 'ajaxStop', @hideSpinner

  showSpinner: =>
    $('#next_card').addClass('disabled')
    @spinner.spin($('#taboos')[0])

  hideSpinner: =>
    @spinner.stop()
    $('#next_card').removeClass('disabled')

$ -> new TabooSpinner

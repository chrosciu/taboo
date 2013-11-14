class TabooSpinner

  constructor: ->
    @spinner = new Spinner()
    @observeAjax()

  observeAjax: ->
    $(document).on 'ajaxStart', @showSpinner
    $(document).on 'ajaxStop', @hideSpinner

  showSpinner: =>
    $('a').addClass('disabled')
    @spinner.spin($('#taboos')[0])

  hideSpinner: =>
    @spinner.stop()
    $('a').removeClass('disabled')

$ -> new TabooSpinner

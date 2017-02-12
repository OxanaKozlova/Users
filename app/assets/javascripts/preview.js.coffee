class window.Preview
  constructor:(form) ->
    @form = form.find('input[type="file"]')
    @image = form.find('img#img_prev')
    @preview = form.find('.preview')
    @changeImage()
    # @hideIfEmptyImage()

  # hideIfEmptyImage: =>
    # unless @image.attr('src')?
    #   @preview.hide()

  changeImage: =>
    $(@input).on 'change', ->
      # @preview.show()
      # alert "sdfdf"
      if @files and @files[0]
        reader = new FileReader
        reader.onload = (e) ->
          $('#img_prev').attr 'src', e.target.result
          return
        reader.readAsDataURL @files[0]
      return

$ ->
  if('.preview-container').length
    new window.Preview($('.preview-container'))

$ ->
  if $('#infinite-scrolling').size() > 0
    $('.pagination').hide()
    $(window).on 'scroll', ->
      more_comments_url = $('.pagination .next_page a').attr('href')
      if more_comments_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
            $('.pagination').text('Please wait...')
            $.getScript more_comments_url
        return
      return

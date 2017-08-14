twttr_events_bound = false
 
$ ->
  loadTwitterSDK ->
    bindTwitterEventHandlers() unless twttr_events_bound
 
bindTwitterEventHandlers = ->
  $(document).on 'turbolinks:load', renderTweetButtons
  twttr_events_bound = true
 
renderTweetButtons = ->
  $('.twitter-share-button').each ->
    button = $(this)
    button.attr('data-url', document.location.href) unless button.data('url')?
    button.attr('data-text', document.title) unless button.data('text')?
  twttr.widgets.load()
 
loadTwitterSDK = (callback) ->
  $.getScript('//platform.twitter.com/widgets.js', callback)
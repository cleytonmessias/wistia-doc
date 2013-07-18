performSearch = () ->
  enteredQuery = $('#searchField').val().replace(/[ ]/g, '_')
  window.location.replace "#{basepath}/search?query=#{enteredQuery}"

$('#search button').on 'click', ->
  performSearch()

$(window).keyup (e) ->
  if e.keyCode == 191 # '/'
    searchField.focus()

$('#searchField').focus ->
  $search = $(this)
  if $search.val() == 'What are you looking for?' || $search.val() == 'Search our docs'
    $search.val('')
    $search.removeClass('example')

$('#searchField').blur ->
  $search = $(this)
  if $.trim($search.val()) == '' && $search.hasClass('homepage-search')
    $search.val('What are you looking for?')
    $search.addClass('example')
  else if $.trim($search.val()) == '' && $search.hasClass('nav-search')
    $search.val('Search our docs')
    $search.addClass('example')

$('#searchField').keyup (e) ->
  if e.keyCode == 13 # 'enter'
    performSearch()

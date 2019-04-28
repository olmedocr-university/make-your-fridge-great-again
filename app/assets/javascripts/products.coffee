# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  # Setup sidenav
  $('.sidenav').sidenav()

  # Setup FAB
  $('.fixed-action-btn').floatingActionButton();

  # Setup datepicker
  $('.datepicker').datepicker();

  # Setup selects
  selectElements = $('select')
  index = 0
  while index < selectElements.length
    M.FormSelect.init(selectElements[index], {})
    index++

  # Setup tabs in cards
  cardTabsElements = $('.card .tabs')
  index = 0
  while index < cardTabsElements.length
    M.Tabs.init(cardTabsElements[index], {})
    index++

  # Setup dependant dropdowns
  $('#product_category_id').change ->
    url = '/food_options?category_id=' + $(this).val()
    $('#product_food_id option').remove()
    $.get url, (data) ->
      for key of data
        if data.hasOwnProperty(key)
          $('#product_food_id').append new Option(data[key], key)
          elems = document.querySelectorAll('select');
          instances = M.FormSelect.init(elems, {dropdownOptions: ('#product_food_id option')});
      return
    return
  return

$(document).on 'turbolinks:before-cache', ->
  # Destroy sidenav
  sidenav = $('.sidenav')
  sidenavInstance = M.Sidenav.getInstance(sidenav)
  sidenavInstance.destroy()

  # Destroy FAB
  floatingActionButton = $('.fixed-action-btn')
  floatingActionButtonInstance = M.FloatingActionButton.getInstance(floatingActionButton)
  floatingActionButtonInstance.destroy()

  # Destroy datepickers
  datePickerElements = $('.datepicker')
  index = 0
  while index < datePickerElements.length
    M.Datepicker.getInstance(datePickerElements[index]).destroy()
    index++

  # Destroy select
  selectElements = $('select')
  index = 0
  while index < selectElements.length
    M.FormSelect.getInstance(selectElements[index]).destroy()
    index++

  # Destroy tabs in cards
  cardTabsElements = $('.card .tabs')
  index = 0
  while index < cardTabsElements.length
    M.Tabs.getInstance(cardTabsElements[index]).destroy()
    index++
  return
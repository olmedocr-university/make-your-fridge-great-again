# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  console.log 'Turbolinks loading, setting up materialize components'
  # Setup sidenav
  $('.sidenav').sidenav()

  # Setup collapsible
  $('.collapsible').collapsible();

  # Setup scrollspy elements
  scrollSpyElements = $('.scrollspy')
  index = 0
  while index < scrollSpyElements.length
    new (M.ScrollSpy)(scrollSpyElements[index])
    index++

  # Setup parallax elements
  parallaxElements = document.querySelectorAll('.parallax')
  index = 0
  while index < parallaxElements.length
    new (M.Parallax)(parallaxElements[index])
    index++
  return

$(document).on 'turbolinks:before-cache', ->
  console.log 'Turbolinks is about to save in cache, destroying materialize components'
  # Destroy sidenav
  sidenav = $('.sidenav')
  sidenavInstance = M.Sidenav.getInstance(sidenav)
  sidenavInstance.destroy()

  # Destroy collapsible
  collapsible = $('.collapsible')
  collapsibleInstance = M.Collapsible.getInstance(collapsible)
  collapsibleInstance.destroy()

  # Destroy scrollSpies
  scrollSpyElements = $('.scrollspy')
  index = 0
  while index < scrollSpyElements.length
    M.ScrollSpy.getInstance(scrollSpyElements[index]).destroy()
    index++

  # Destroy parallax elements
  parallaxElements = $('.parallax')
  index = 0
  while index < parallaxElements.length
    M.Parallax.getInstance(parallaxElements[index]).destroy()
    index++
  return
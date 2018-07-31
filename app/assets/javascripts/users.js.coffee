# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.midhdglyphnil').click ->
    alert "Your account has not been provisioned yet!. Please verify your account."
  
  
$(document).on "turbolinks:load", ->
  $('[data-toggle="popover"]').popover()
 

$(document).click ->
  $('.uop').effect 'shake', {
    direction: 'up'
    times: 1
    distance: 3
  }, 300
  return 
  
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


times = $('.time')
$ ->
  # console.log times
  # setInterval ->
  do timeFromNow
  # , 1000
  # console.log times



# update = ->
#     console.log(moment().format('hh:mm:ss a'))
# x = setInterval update, 1000;
# setTimeout (-> clearInterval(x)), 10000

timeFromNow = ->
  for time in times
    # console.log(times)
    time.innerText = moment(time.innerText).fromNow()
FareCalculator =
  start: ->
    @router = new FareCalculator.AppRouter
    Backbone.history.start({pushState: true})

class FareCalculator.AppRouter extends Backbone.Router
  routes:
    '': 'index'
    'about': 'about'
    'results': 'results'

  index: ->
    console.log 'index triggered'

  about: ->
    console.log 'about triggered whooray!'

  results: ->
    console.log 'results triggered, wow!'

FareCalculator.start()

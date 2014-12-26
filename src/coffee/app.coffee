FareCalculator =
  start: ->
    @router = new FareCalculator.AppRouter
    Backbone.history.start({pushState: true})

class FareCalculator.AppRouter extends Backbone.Router
  routes:
    '': 'index'
    'about': 'about'
    'results': 'results'
    'foobar': 'foobar'

  index: ->
    # new App.TestView
    console.log 'index triggered'

  about: ->
    console.log 'about triggered whooray!'

  results: ->
    console.log 'results triggered, wow!'

  foobar: ->
    console.log 'this is foobar'

FareCalculator.start()

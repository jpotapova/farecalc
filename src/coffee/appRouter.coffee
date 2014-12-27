FareCalculator =
  start: ->
    @router = new FareCalculator.AppRouter
    Backbone.history.start({pushState: true})

class FareCalculator.AppRouter extends Backbone.Router
  routes:
    '': 'index'
    'about': 'about'
    'results': 'results'

  initialize: ->
    FareCalculator.aboutView = new FareCalculator.AboutView
    FareCalculator.headerView = new FareCalculator.HeaderView
    FareCalculator.introView = new FareCalculator.IntroView
    FareCalculator.formView = new FareCalculator.FormView
    FareCalculator.homeView = new FareCalculator.HomeView

  index: ->
    console.log 'index triggered'
    FareCalculator.homeView.render()
    
  about: ->
    console.log 'about triggered whooray!'
    FareCalculator.aboutView.render()

  results: ->
    console.log 'results triggered, wow!'

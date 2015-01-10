FareCalculator =
  start: ->
    @router = new FareCalculator.AppRouter
    Backbone.history.start({pushState: true})

class FareCalculator.AppRouter extends Backbone.Router
  routes:
    '': 'index'
    'about': 'about'
    'results': 'results',
    'error': 'error'

  initialize: ->
    FareCalculator.aboutView = new FareCalculator.AboutView
    FareCalculator.headerView = new FareCalculator.HeaderView
    FareCalculator.introView = new FareCalculator.IntroView
    FareCalculator.formView = new FareCalculator.FormView
    FareCalculator.resultsView = new FareCalculator.ResultsView
    FareCalculator.homeView = new FareCalculator.HomeView
    FareCalculator.errorView = new FareCalculator.ErrorView

  index: ->
    FareCalculator.homeView.render()
    FareCalculator.stationsCollection = new FareCalculator.StationsCollection

  about: ->
    FareCalculator.aboutView.render()

  results: ->
    FareCalculator.resultsView.render()

  error: ->
    FareCalculator.errorView.render()

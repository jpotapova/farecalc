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
    FareCalculator.resultsView = new FareCalculator.ResultsView
    FareCalculator.homeView = new FareCalculator.HomeView

  index: ->
    FareCalculator.homeView.render()

  about: ->
    FareCalculator.aboutView.render()

  results: ->
    FareCalculator.resultsView.render()

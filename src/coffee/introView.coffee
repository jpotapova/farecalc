class FareCalculator.IntroView extends Backbone.View

  el: '.intro'

  events:
    'click a': 'navigate'

  navigate: ->
    FareCalculator.router.navigate 'about'

FareCalculator.introView = new FareCalculator.IntroView

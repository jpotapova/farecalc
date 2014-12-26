class FareCalculator.IntroView extends Backbone.View

  el: '.intro'

  events:
    'click a': 'navigate'

  navigate: (e)->
    e.preventDefault()
    FareCalculator.router.navigate(
      'about'
      {trigger: true}
    )

FareCalculator.introView = new FareCalculator.IntroView

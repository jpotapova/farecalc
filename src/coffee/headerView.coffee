class FareCalculator.HeaderView extends Backbone.View

  el: 'header'

  events:
    'click a': 'navigate'

  navigate: (e)->
    e.preventDefault()
    FareCalculator.router.navigate(
      '/'
      {trigger: true}
    )

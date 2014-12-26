class FareCalculator.FormView extends Backbone.View

  el: '.journey-form'

  events:
    'click #submit': 'navigate'

  navigate: ->
    FareCalculator.router.navigate 'results'

FareCalculator.formView = new FareCalculator.FormView

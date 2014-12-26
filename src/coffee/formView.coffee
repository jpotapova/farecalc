class FareCalculator.FormView extends Backbone.View

  el: '.journey-form'

  events:
    'submit': 'submit'

  submit: (e)->
    e.preventDefault()
    FareCalculator.router.navigate(
      'results'
      {trigger: true}
    )

FareCalculator.formView = new FareCalculator.FormView

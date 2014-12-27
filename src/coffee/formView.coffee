class FareCalculator.FormView extends Backbone.View

  el: '.main'

  events:
    'submit .journey-form': 'submit'
    'keypress #from': 'suggestStations'

  template: _.template($('.journey-form-template').html())

  submit: (e)->
    e.preventDefault()
    FareCalculator.router.navigate(
      'results'
      {trigger: true}
    )

  suggestStations: (e)->
    if not FareCalculator.fromStations?
      FareCalculator.fromStations = new FareCalculator.StationsView
      FareCalculator.fromStations.render($('#from').val())

  render: ->
    if this.$el.find('.journey-form').length is 0
       this.$el.append(this.template())
    this

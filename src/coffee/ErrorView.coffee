class FareCalculator.ErrorView extends Backbone.View

  el: '.main'

  template: _.template($('.error-template').html())

  events:
    'click .error a': 'navigate'

  navigate: (e)->
    e.preventDefault()
    FareCalculator.router.navigate(
      '/'
      {trigger: true}
    )

  render: ->
    view = this
    if view.$el.find('.error').length is 0
      view.$el.fadeOut(()->
        view.$el.html(view.template()).fadeIn()
      )
    this

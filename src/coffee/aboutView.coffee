class FareCalculator.AboutView extends Backbone.View

  el: '.main'

  template: _.template($('.about-template').html())

  render: ->
    view = this
    if view.$el.find('.about').length is 0
      view.$el.fadeOut(()->
        view.$el.html(view.template()).fadeIn()
      )
    this

class FareCalculator.HomeView extends Backbone.View

  el: '.main'

  render: ->
    el = this.$el
    el.fadeOut(()->
      el.empty()
      FareCalculator.introView.render()
      FareCalculator.formView.render()
      el.fadeIn()
    )
    this

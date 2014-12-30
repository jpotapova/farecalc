class FareCalculator.FormModel extends Backbone.Model

  urlRoot: "/api/request-journey"
  initialize: ()->
    result = this.save(
      this.attributes
      {
        success: ()->
          console.log 'success'
        error: ()->
          console.log 'error'
      }
    )

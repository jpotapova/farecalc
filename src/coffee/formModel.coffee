class FareCalculator.FormModel extends Backbone.Model

  urlRoot: "/api/request-journey"
  initialize: ()->
    console.log this.attributes
    console.log this.isNew()
    result = this.save(
      this.attributes
      {
        success: ()->
          console.log 'success'
        error: ()->
          console.log 'error'
      }
    )

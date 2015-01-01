class FareCalculator.FormModel extends Backbone.Model

  urlRoot: "/api/request-journey"
  initialize: ()->
    result = this.save(
      this.attributes
      {
        success: (model, response)->
          FareCalculator.resultsModel = new FareCalculator.ResultsModel(response)
          FareCalculator.router.navigate(
            'results'
            {trigger: true}
          )
        error: ()->
          console.log 'error'
      }
    )

  validate: ()->
    # TO DO
    return

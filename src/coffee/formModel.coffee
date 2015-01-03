class FareCalculator.FormModel extends Backbone.Model

  urlRoot: "/api/request-journey"
  initialize: ()->
    this.on(
      'invalid'
      ()->
        console.log 'invalid form'
    )

    this.save(
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


  validate: (attributes)->

    errors = []

    # validate from and to
    ['from', 'to'].forEach(
      (element)->
        # both from and to have to be filled in
        if attributes[element].length is 0
          errors.push({
              field: element
              msg: "Please fill in #{ element } station"
          })
        else
          # from and to have to be valid stations
          if FareCalculator.stationsCollection.find(
              (model)->
                model.get("name") is attributes[element]
          ) is undefined
            errors.push({
                field: element
                msg: "Please select a valid #{ element } station"
            })
    )

    # from and to have to be different
    if errors.length is 0
      if attributes['from'] is attributes['to']
        errors.push({
            field: 'to',
            msg: 'Destination station cannot be same as origin station'
        })

    # validate days of the week - at least one to be selected
    if attributes['days'].indexOf('1') is -1
      errors.push({
          field: 'days',
          msg: 'Please select at least one day of the week'
      })

    if errors.length is 0
      return
    else
      errors

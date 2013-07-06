Em.Handlebars.registerBoundHelper 'date', (date)->
  moment(date).fromNow()
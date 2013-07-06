Em.Handlebars.registerBoundHelper 'markdown', (input)->
  showdown = new Showdown.converter()
  new Em.Handlebars.SafeString showdown.makeHtml input
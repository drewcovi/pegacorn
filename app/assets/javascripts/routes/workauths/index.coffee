App.WorkauthsIndexRoute = App.WorkauthsRoute.extend
  events:
    error: (reason, transition)->
      alert 'error loading workauths!'
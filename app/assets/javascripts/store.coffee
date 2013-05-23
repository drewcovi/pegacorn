App.Store = DS.Store.extend
  revision: 12
  # adapter: DS.RESTAdapter.create
  #   url: '/api'

App.Store.registerAdapter 'App.Post', DS.LSAdapter.create
  namespace: "pegacorn:posts"
App.Store.registerAdapter 'App.User', DS.RESTAdapter.extend
  url: "/api"
App.Store = DS.Store.extend
  revision: 12

# App.Store.registerAdapter 'App.Post', DS.LSAdapter.create
#   namespace: "pegacorn:posts"
App.Store.registerAdapter 'App.Post', DS.RESTAdapter.create
  url: "/api"
App.Store.registerAdapter 'App.User', DS.RESTAdapter.extend
  url: "/api"
App.Store.registerAdapter 'App.Workauth', DS.GUTSAdapter.extend
  url: "/api"
App.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter

# App.Store.registerAdapter 'App.Post', DS.LSAdapter.create
#   namespace: "pegacorn:posts"

App.Store.registerAdapter 'App.Post', DS.RESTAdapter.create
  url: "/api"

App.Store.registerAdapter 'App.User', DS.RESTAdapter.create
  url: "/api"

App.Store.registerAdapter 'App.Workauth', DS.GUTSAdapter.create
  url: "https://guts.clockwork.net/tcs/?action=get_work_auths_json"
  primaryKey: (type) ->
    'gutsId' if type is 'App.Workauth'

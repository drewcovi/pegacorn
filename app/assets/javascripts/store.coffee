App.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter

App.Adapter = DS.RESTAdapter.extend
  serializer: DS.RESTSerializer.extend
    primaryKey: (type) ->
      if type is App.Post
        'permalink'
      else
        'id'


# App.Store.registerAdapter 'App.Post', DS.LSAdapter.create
#   namespace: "pegacorn:posts"

App.Store.registerAdapter 'App.Post', App.Adapter.create
  url: '/api'
  primaryKey: 'permalink'

App.Store.registerAdapter 'App.User', App.Adapter.create
  url: '/api'

App.Store.registerAdapter App.Workauth, DS.GUTSAdapter.extend
  url: "https://mattgutsviz.dev.clockwork.net/tcs_connector/?action=",
  # primaryKey: (type) ->
  #   'gutsId' if type is 'App.Workauth'
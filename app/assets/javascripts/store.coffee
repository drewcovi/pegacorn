App.Store = DS.Store.extend
  revision: 12
  adapter: DS.RESTAdapter.create({ bulkCommit: false })
  # adapter: DS.LSAdapter.create({namespace: 'app'})
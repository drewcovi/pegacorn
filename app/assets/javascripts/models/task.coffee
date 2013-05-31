App.Task = DS.Model.extend
  client: DS.belongsTo 'App.Client'
  project: DS.belongsTo 'App.Project'
  gutsId: DS.attr 'number'
  name: DS.attr 'string'
  workauth: DS.belongsTo 'App.Workauth'
  manager: DS.belongsTo 'App.User'
  workers: DS.hasMany 'App.User'
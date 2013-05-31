App.Client = DS.Model.extend
  task: DS.hasMany 'App.Task'
  project: DS.hasMany 'App.Project'
  gutsId: DS.attr 'number'
  name: DS.attr 'string'
  workauth: DS.hasMany 'App.Workauth'
  manager: DS.belongsTo 'App.User'
  workers: DS.hasMany 'App.User'
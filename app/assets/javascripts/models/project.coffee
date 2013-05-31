App.Project = DS.Model.extend
  tasks: DS.hasMany 'App.Task'
  client: DS.belongsTo 'App.Client'
  gutsId: DS.attr 'number'
  name: DS.attr 'string'
  workauth: DS.hasMany 'App.Workauth'
  manager: DS.belongsTo 'App.User'
  workers: DS.hasMany 'App.User'
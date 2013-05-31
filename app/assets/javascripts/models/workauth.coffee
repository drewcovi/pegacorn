App.Workauth = DS.Model.extend
  task: DS.belongsTo 'App.Task'
  client: DS.belongsTo 'App.Client'
  project: DS.belongsTo 'App.Project'
  gutsId: DS.attr 'number'
  name: DS.attr 'string'
  manager: DS.belongsTo 'App.User'
  worker: DS.belongsTo 'App.User'
  hours: DS.attr 'number'
  due: DS.attr 'date',
  breadcrumb: (->
    "#{@get('client.name')} > #{@get('project.name')} > #{@get('task.name')}"
    ).property('client', 'project', 'task')

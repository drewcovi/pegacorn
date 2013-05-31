App.User = DS.Model.extend
  email: DS.attr 'string'
  firstName: DS.attr 'string'
  password: DS.attr 'string'
  lastName: DS.attr 'string'
  fullName: (->
    "#{@get('firstName')} #{@get('lastName')}"
    ).property('firstName', 'lastName')
  param: DS.attr 'string'
  projects: DS.hasMany 'DS.Project'
  managedProjects: DS.hasMany 'DS.Project'
  tasks: DS.hasMany 'DS.Task'
  workauths: DS.hasMany 'DS.Workauth'
  tcsToken: DS.attr 'string'
  ldap: DS.attr 'string'

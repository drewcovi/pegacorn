App.User = DS.Model.extend
  email: DS.attr 'string'
  firstName: DS.attr 'string'
  password: DS.attr 'string'
  lastName: DS.attr 'string'
  fullName: (->
    "#{@get('firstName')} #{@get('lastName')}"
    ).property('firstName', 'lastName')
  # param: DS.attr 'string'
  param: (->
    "#{@get('id')}-#{@get('email').split('@')[0]}"
    ).property('email')
  projects: DS.hasMany 'App.Project'
  managedProjects: DS.hasMany 'App.Project'
  tasks: DS.hasMany 'App.Task'
  workauths: DS.hasMany 'App.Workauth',
    inverse: 'worker'
  gutsToken: DS.attr 'string'
  ldap: DS.attr 'string'
  roles: DS.hasMany 'App.Role'

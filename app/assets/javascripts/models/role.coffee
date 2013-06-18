App.Role = DS.Model.extend
  name: DS.attr 'string'
  hasMany: DS.attr 'App.User'
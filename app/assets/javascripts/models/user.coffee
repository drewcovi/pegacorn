App.User = DS.Model.extend
  email: DS.attr 'string'
  firstName: DS.attr 'string'
  password: DS.attr 'string'
  lastName: DS.attr 'string'
  fullName: (->
    "#{@get('firstName')} #{@get('lastName')}"
    ).property('firstName', 'lastName')
  param: DS.attr 'string'
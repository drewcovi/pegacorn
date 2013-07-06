App.Post = DS.Model.extend
  title: DS.attr 'string'
  body: DS.attr 'string'
  param: DS.attr 'string'
  permalink: DS.attr 'string'
  updatedAt: DS.attr 'date'
App.Post = DS.Model.extend
  title: DS.attr 'string'
  body: DS.attr 'string'
  param: DS.attr 'string'
  permalink: (->
      return @get('title').dasherize()
    ).property('title')
  updatedAt: DS.attr 'date'
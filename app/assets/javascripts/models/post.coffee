App.Post = DS.Model.extend
  title: DS.attr 'string'
  body: DS.attr 'string'
  param: (->
    "#{@get('id')}-#{@get('title')}".dasherize()
  ).property('title')
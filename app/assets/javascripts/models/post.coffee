App.Post = DS.Model.extend
  title: DS.attr 'string'
  body: DS.attr 'string'
  param: DS.attr 'string'
  permalink: (->
      if @get('title')
        return @get('title').dasherize()
    ).property('title')
  updatedAt: DS.attr 'date'
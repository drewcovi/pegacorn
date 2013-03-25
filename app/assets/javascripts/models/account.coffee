App.Account = DS.Model.extend(
  email:    DS.attr('string', defaultValue: '' )
  username: DS.attr('string', defaultValue: '' )
  password: DS.attr('string', defaultValue: '' )
  user:     DS.belongsTo('App.User', defaultValue: '' )
)
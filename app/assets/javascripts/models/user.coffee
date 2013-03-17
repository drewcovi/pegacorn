App.User = DS.Model.extend(
  firstName:  DS.attr('string', defaultValue: '' )
  lastName:   DS.attr('string', defaultValue: '' )
  eyeColor:   DS.attr('string', defaultValue: '' )
  quote:   DS.attr('string', defaultValue: '' )
  # account:    DS.belongsTo('')
  fullName: (->
    "#{@get('firstName')} #{@get('lastName')}"
  ).property('firstName', 'lastName')
)
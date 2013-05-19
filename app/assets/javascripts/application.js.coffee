#= require modernizr
#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require application
#= require localstorage_adapter
#= require bootstrap
#= require_self
#= require store
#= require routes
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ember_rails_api
window.EmberRailsAPI = Ember.Application.create()

#= require_tree ./controllers
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ember_rails_api
window.EmberRailsAPI = Ember.Application.create()

#= require_tree ./models
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ember_rails_api
window.EmberRailsAPI = Ember.Application.create()

#= require_tree ./templates
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ember_rails_api
window.EmberRailsAPI = Ember.Application.create()

#= require_tree ./views




window.App = Em.Application.create
  LOG_TRANSITIONS: true
  paths:
    login: '/sign_in'
    logout: '/sign_out'
    join: '/sign_up'


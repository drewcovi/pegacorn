#= require jquery
#= require jquery_ujs
#= require showdown
#= require moment
#= require handlebars
#= require ember
#= require ember-data
#= require ember-auth
#= require_self
#= require auth
#= require localstorage-adapter
#= require guts-adapter
#= require app
#= require_tree .

window.App = Em.Application.create
    LOG_TRANSITIONS: true
    LOG_TRANSITIONS_INTERNAL: true

# Ember.LOG_BINDINGS = true
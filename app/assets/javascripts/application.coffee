#= require jquery
#= require jquery_ujs
#= require handlebars
#= require ember
#= require ember-data
#= require ember-auth
#= require_self
#= require auth
#= require localstorage-adapter
#= require app
#= require_tree .
window.App = Em.Application.create
    LOG_TRANSITIONS: true
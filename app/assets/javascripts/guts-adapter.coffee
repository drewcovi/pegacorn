url = 'https://mattgutsviz.dev.clockwork.net/tcs_connector/?action='

Array::unique = (identifier)->
  output = {}
  output[@[key][identifier]] = @[key] for key in [0...@length]
  value for key, value of output

DS.GUTSSerializer = DS.JSONSerializer.extend()

DS.GUTSAdapter = DS.RESTAdapter.extend Ember.Evented,
  
  serializer: DS.GUTSSerializer.create()
  
  init: ->
    this._super.apply this, arguments
    console.log 'initializing guts adapter'
  
  find: (store, type, id) ->
    console.log('finding workauths by id', store, type, id)

  findAll: (store, type) ->
    return if !App.Auth.get('user')
    method = 'get_work_auths_json'
    adapter = @
    token = App.Auth.get('user').get('gutsToken')
    ldap = App.Auth.get('user').get('ldap')
    $.ajax
      url: url+method, 
      data: 
        ldap_username: ldap,
        ldap_auth_token: token,
      type: 'post',
      dataType: 'json',
      success: (data, status, jqxhr)->
        workauths=( \
          gutsId:workauth.work_auth_id, \
          name: ( \
            if Em.isEmpty workauth.work_auth_name \
            then workauth.project_name \
            else workauth.work_auth_name), \
          hours:workauth.work_auth_hours, \
          due:workauth.work_auth_date_due \
          for workauth in data).unique 'gutsId'
        workauths = 
          workauths : workauths
        adapter.didFindAll store, type, workauths
      error: (request, status, error)->
        # console.log 'error', request, status, error
  findQuery: (store, type, query, recordArray) ->
    console.log('find query')

  findMany: (store, type, ids) ->
    console.log('finding many')
  
    query: (records, query) ->
    console.log('query')

  # redacted sync adapter.
  # findProjects: (user, name, process) ->
  #   $.getJSON url, ldap_username: ldap, ldap_auth_token: token, \
  #     (data, status, jqxhr)->
  #       projects=( \
  #         gutsId:workauth.project_id, \
  #         name:workauth.project_name \
  #         for workauth in data).unique gutsId
  #       process(projects).load()

  # findTasks: (user, name, process) ->
  #   $.getJSON url, ldap_username: ldap, ldap_auth_token: token, \
  #     (data, status, jqxhr)->
  #       tasks=( \
  #         gutsId:workauth.task_id, \
  #         name:workauth.task_name \
  #         for workauth in data).unique gutsId
  #       process(tasks).load()

  # findClients: (user, name, process) ->
  #   $.getJSON url, ldap_username: ldap, ldap_auth_token: token, \
  #     (data, status, jqxhr)->
  #       clients=( \
  #         gutsId:workauth.client_id, \
  #         name:workauth.client_name \
  #         for workauth in data).unique gutsId
  #       process(clients).load()

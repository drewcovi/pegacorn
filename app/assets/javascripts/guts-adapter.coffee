Array::unique = (identifier)->
  output = {}
  output[@[key][identifier]] = @[key] for key in [0...@length]
  value for key, value of output

DS.GUTSSerializer = DS.JSONSerializer.extend()

DS.GUTSAdapter = DS.Adapter.extend Ember.Evented,
  
  serializer: DS.GUTSSerializer.create()
  
  init: ->
    this._super.apply this, arguments
  
  find: (store, type, id) ->
    console.log 'finding workauths by id', store, type, id

  findAll: (store, type) ->
    return if !App.Auth.get('user').get('ldap')
    method = 'get_work_auths_json'
    adapter = @
    token = App.Auth.get('user').get('gutsToken')
    ldap = App.Auth.get('user').get('ldap')
    url = this.url
    $.ajax(
      url: url+method, 
      data: 
        ldap_username: ldap,
        ldap_auth_token: token,
      type: 'post'
    ).done( (data) ->
      workauths=( \
          id:workauth.work_auth_id, \
          name: ( \
            if Em.isEmpty workauth.work_auth_name \
            then workauth.project_name \
            else workauth.work_auth_name), \
          hours:workauth.work_auth_hours, \
          due:workauth.work_auth_date_due, \
          worker: App.Auth.get('userId') \
          for workauth in data).unique 'id'
      workauths = 
        workauths : workauths
      # console.log workauths
      adapter.didFindAll store, type, workauths
    ).fail( (request, status) ->
        # adapter.didError store, type, {}, request
      Em.assert("Unable to find records for model type "+type.toString(), error);
    )

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

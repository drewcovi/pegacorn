url = 'https://guts.clockwork.net/tcs/?action=get_work_auths_json'
token = '01b82f2e4ce42ad2ad8d79978a7f272c'
ldap = 'drew'

Array::unique = (identifier)->
  output = {}
  output[@[key][identifier]] = @[key] for key in [0...@length]
  console.log output
  value for key, value of output

DS.GUTSSerializer = DS.JSONSerializer.extend

DS.GUTSAdapter = DS.Adapter.extend Ember.Evented,

  findWorkauths: (user, name, process) ->
    # token = user.gutsToken
    # ldap = "#{ user.ldap }@clockwork.net"
    $.getJSON url, ldap_username: ldap, ldap_auth_token: token, \
      (data, status, jqxhr)->
        workauths=( \
          gutsId:workauth.work_auth_id, \
          name:workauth.work_auth_name, \
          hours:workauth.work_auth_hours, \
          due:workauth.work_auth_due_date \
          for workauth in data).unique gutsId
        process(workauths).load()

  findProjects: (user, name, process) ->
    # token = user.tcsToken
    # ldap = "#{ user.ldap }@clockwork.net"
    $.getJSON url, ldap_username: ldap, ldap_auth_token: token, \
      (data, status, jqxhr)->
        projects=( \
          gutsId:workauth.project_id, \
          name:workauth.project_name \
          for workauth in data).unique gutsId
        process(projects).load()

  findTasks: (user, name, process) ->
    # token = user.tcsToken
    # ldap = "#{ user.ldap }@clockwork.net"
    $.getJSON url, ldap_username: ldap, ldap_auth_token: token, \
      (data, status, jqxhr)->
        tasks=( \
          gutsId:workauth.task_id, \
          name:workauth.task_name \
          for workauth in data).unique gutsId
        process(tasks).load()

  findClients: (user, name, process) ->
    # token = user.tcsToken
    # ldap = "#{ user.ldap }@clockwork.net"
    $.getJSON url, ldap_username: ldap, ldap_auth_token: token, \
      (data, status, jqxhr)->
        clients=( \
          gutsId:workauth.client_id, \
          name:workauth.client_name \
          for workauth in data).unique gutsId
        process(clients).load()

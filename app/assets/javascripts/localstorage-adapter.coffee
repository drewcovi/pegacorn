DS.LSSerializer = DS.JSONSerializer.extend(
  addBelongsTo: (data, record, key, association) ->
    data[key] = record.get(key + ".id")

  addHasMany: (data, record, key, association) ->
    data[key] = record.get(key).map((record) ->
      record.get "id"
    )

  
  # extract expects a root key, we don't want to save all these keys to
  # localStorage so we generate the root keys here
  extract: (loader, json, type, record) ->
    @_super loader, @rootJSON(json, type), type, record

  extractMany: (loader, json, type, records) ->
    @_super loader, @rootJSON(json, type, "pluralize"), type, records

  rootJSON: (json, type, pluralize) ->
    root = @rootForType(type)
    root = @pluralize(root)  if pluralize is "pluralize"
    rootedJSON = {}
    rootedJSON[root] = json
    rootedJSON
)
DS.LSAdapter = DS.Adapter.extend(Ember.Evented,
  init: ->
    @_loadData()

  generateIdForRecord: ->
    Math.random().toString(32).slice(2).substr 0, 5

  serializer: DS.LSSerializer.create()
  find: (store, type, id) ->
    namespace = @_namespaceForType(type)
    @_async ->
      copy = Ember.copy(namespace.records[id])
      @didFindRecord store, type, copy, id


  findMany: (store, type, ids) ->
    namespace = @_namespaceForType(type)
    @_async ->
      results = []
      i = 0

      while i < ids.length
        results.push Ember.copy(namespace.records[ids[i]])
        i++
      @didFindMany store, type, results


  
  # Supports queries that look like this:
  #
  #   {
  #     <property to query>: <value or regex (for strings) to match>,
  #     ...
  #   }
  #
  # Every property added to the query is an "AND" query, not "OR"
  #
  # Example:
  #
  #  match records with "complete: true" and the name "foo" or "bar"
  #
  #    { complete: true, name: /foo|bar/ }
  findQuery: (store, type, query, recordArray) ->
    namespace = @_namespaceForType(type)
    @_async ->
      results = @query(namespace.records, query)
      @didFindQuery store, type, results, recordArray


  query: (records, query) ->
    results = []
    id = undefined
    record = undefined
    property = undefined
    test = undefined
    push = undefined
    for id of records
      record = records[id]
      for property of query
        test = query[property]
        push = false
        if Object::toString.call(test) is "[object RegExp]"
          push = test.test(record[property])
        else
          push = record[property] is test
      results.push record  if push
    results

  findAll: (store, type) ->
    namespace = @_namespaceForType(type)
    @_async ->
      results = []
      for id of namespace.records
        results.push Ember.copy(namespace.records[id])
      @didFindAll store, type, results


  createRecords: (store, type, records) ->
    namespace = @_namespaceForType(type)
    records.forEach ((record) ->
      @_addRecordToNamespace namespace, record
    ), this
    @_async ->
      @_didSaveRecords store, type, records


  updateRecords: (store, type, records) ->
    namespace = @_namespaceForType(type)
    @_async ->
      records.forEach ((record) ->
        id = record.get("id")
        namespace.records[id] = record.serialize(includeId: true)
      ), this
      @_didSaveRecords store, type, records


  deleteRecords: (store, type, records) ->
    namespace = @_namespaceForType(type)
    @_async ->
      records.forEach (record) ->
        id = record.get("id")
        delete namespace.records[id]

      @_didSaveRecords store, type, records


  dirtyRecordsForHasManyChange: (dirtySet, parent, relationship) ->
    dirtySet.add parent

  dirtyRecordsForBelongsToChange: (dirtySet, child, relationship) ->
    dirtySet.add child

  
  # private
  _getNamespace: ->
    @namespace or "DS.LSAdapter"

  _loadData: ->
    storage = localStorage.getItem(@_getNamespace())
    @_data = (if storage then JSON.parse(storage) else {})

  _didSaveRecords: (store, type, records) ->
    success = @_saveData()
    if success
      store.didSaveRecords records
    else
      records.forEach (record) ->
        store.recordWasError record

      @trigger "QUOTA_EXCEEDED_ERR", records

  _saveData: ->
    try
      localStorage.setItem @_getNamespace(), JSON.stringify(@_data)
      return true
    catch error
      if error.name is "QUOTA_EXCEEDED_ERR"
        return false
      else
        throw new Error(error)

  _namespaceForType: (type) ->
    namespace = type.url or type.toString()
    @_data[namespace] or (@_data[namespace] = records: {})

  _addRecordToNamespace: (namespace, record) ->
    data = record.serialize(includeId: true)
    namespace.records[data.id] = data

  _async: (callback) ->
    _this = this
    setTimeout (->
      Ember.run _this, callback
    ), 1
)
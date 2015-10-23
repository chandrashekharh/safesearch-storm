validate = require('json-schema').validate
assert = require 'assert'
Promise = require 'bluebird'
async = require 'async'
needle = Promise.promisifyAll(require('needle'))

schema_SafeSearch = require('./schema').SafeSearch

getPromise = ->
    return new Promise (resolve, reject) ->
        resolve()

Validate =  (config) ->
    throw new Error "Validate SafeSearch - invalid input" unless config
    
    checkschema = validate config, schema_SafeSearch
    console.log 'SafeSearch schema validate result: ', checkschema
    unless checkschema.valid
        throw new Error "SafeSearch schema check failed"+  checkschema.valid
        return  false
    else
        return true

getCorenovaID = (baseUrl)->
    needle.getAsync baseUrl + "/corenova", json:true
    .then (resp) =>
        throw new Error 'invalidStatusCode' unless resp[0].statusCode is 200
        corenovaResp = resp[0].body
        console.log "corenovaID: ",corenovaResp[0].id
        return corenovaResp[0].id
    .catch (err) =>
        throw err

putConfig = (baseUrl,id,config)->
    needle.putAsync baseUrl + "/corenova/#{id}/transform/include", config, json:true
    .then (resp) =>
        throw new Error 'invalidStatusCode' unless resp[0].statusCode is 200                        
        return config
    .catch (err) =>
        throw err

Start =  (context) ->
    throw new Error 'safesearch-storm.Start missingParams' unless context.bInstalledPackages and context.service.name and context.service.factoryConfig
    getPromise()
    .then () =>
        return Validate(context.service.factoryConfig)
    .then (resp) =>
        return getCorenovaID(context.baseUrl)
    .then (corenovaID) =>
        return putConfig(context.baseUrl,corenovaID,context.service.factoryConfig)
    .then (resp) =>
        context.bFactoryPush = true
        console.log "SafeSearch START response:\n " + JSON.stringify context 
        return context
    .catch (err) =>
        throw err

Update =  (context) ->
    throw new Error 'safesearch-storm.update missingParams' unless context.bInstalledPackages and context.service.name and context.service.policyConfig
    getPromise()
    .then () =>
        return Validate(context.service.policyConfig)
    .then (resp) =>        
        return getCorenovaID(context.baseUrl)
    .then (corenovaID) =>       
        return putConfig(context.baseUrl,corenovaID,context.service.policyConfig)    
    .then (resp) =>
        console.log "SafeSearch UPDATE response:\n " + JSON.stringify resp
        return context
    .catch (err) =>
        throw err

Stop =  (context) ->
    throw new Error 'safesearch-storm.Start missingParams' unless context.bInstalledPackages and context.service.name and context.service.factoryConfig
    config = 
    "HAVE_SAFESEARCH": false,
    "SAFESEARCH_POLICY":
        "filename": "safesearch.policy",
        "encoding": "base64",
        "data": ""
    "SAFESEARCH": true,
    "SAFESEARCH_RESPONSE": false
    getPromise()
    .then () =>
        return Validate(config)
    .then (resp) =>    
        return getCorenovaID(context.baseUrl)
    .then (corenovaID) =>
        return putConfig(context.baseUrl,corenovaID,config)    
    .then (resp) =>
        console.log "SafeSearch STOP response:\n " + JSON.stringify resp 
        return context
    .catch (err) =>
        throw err

module.exports.start = Start
module.exports.stop = Stop
module.exports.update = Update
module.exports.validate = Validate

validate = require('json-schema').validate
assert = require 'assert'
Promise = require 'bluebird'
async = require 'async'
needle = Promise.promisifyAll(require('needle'))
utils = require('utils')._
diff = require('deep-diff').diff

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

isFactory = (factory, config, flag)->
    if flag or factory
        config.HAVE_SAFESEARCH = false
        config.SAFESEARCH = false
        config.SAFESEARCH_RESPONSE = false
        config.SAFESEARCH_POLICY.data = ""
    else
        config.HAVE_SAFESEARCH = true
        config.SAFESEARCH = true
        config.SAFESEARCH_RESPONSE = true
        #If config.SAFESEARCH_POLICY.data is optional from USG then we can comment the below config setting
        config.SAFESEARCH_POLICY.data = "Z29vZ2xlCnlhaG9vCmJpbmcK"
    #console.log "SafeSearch isFactory configs:\n " + JSON.stringify config
    return config

Start =  (context) ->
    throw new Error 'safesearch-storm.Start missingParams' unless context.bInstalledPackages and context.service.name and context.service.config
    getPromise()
    .then (resp) =>
        return isFactory(context.bFactoryPush, context.service.config, false)
    .then (config) =>
        return Validate(config)
    .then (resp) =>
        return getCorenovaID(context.baseUrl)
    .then (corenovaID) =>
        #console.log "SafeSearch Corenova START configs:\n " + JSON.stringify config
        return putConfig(context.baseUrl,corenovaID,context.service.config)
    .then (resp) =>
        console.log "SafeSearch START response:\n " + JSON.stringify resp
        return context
    .catch (err) =>
        throw err

Stop =  (context) ->
    throw new Error 'safesearch-storm.Start missingParams' unless context.bInstalledPackages and context.service.name and context.service.config
    getPromise()
    .then (resp) =>
        return isFactory(context.bFactoryPush, context.service.config, true)
    .then (config) =>
        return Validate(config)
    .then (resp) =>    
        return getCorenovaID(context.baseUrl)
    .then (corenovaID) =>
        #console.log "SafeSearch Corenova STOP configs:\n " + JSON.stringify config
        return putConfig(context.baseUrl,corenovaID,context.service.config)    
    .then (resp) =>
        console.log "SafeSearch Corenova STOP response:\n " + JSON.stringify resp
        return context
    .catch (err) =>
        throw err

Update =  (context) ->
    throw new Error 'safesearch-storm.update missingParams' unless context.bInstalledPackages and context.service.name and context.service.config
    getPromise()
    .then (resp) =>
        return isFactory(context.bFactoryPush, context.service.config, false)
    .then (config) =>
        return Validate(config)
    .then (resp) =>        
        return getCorenovaID(context.baseUrl)
    .then (corenovaID) =>       
        #console.log "SafeSearch Corenova UPDATAE configs:\n " + JSON.stringify config
        return putConfig(context.baseUrl,corenovaID,context.service.config)    
    .then (resp) =>
        console.log "SafeSearch Corenova UPDATE response:\n " + JSON.stringify resp
        return context
    .catch (err) =>
        throw err

module.exports.start = Start
module.exports.stop = Stop
module.exports.update = Update
module.exports.validate = Validate

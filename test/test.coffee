jsonfile = require('jsonfile')
Start = require('./../src/context').start
Stop = require('./../src/context').stop
Update = require('./../src/context').update
Validate = require('./../src/context').validate
Promise = require 'bluebird'
diff = require('deep-diff').diff
utils = require('utils')._
context = {}
# input data
#---------------------------------------------------------------------------------------------
safesearchConfig = 
    "HAVE_SAFESEARCH": false,
    "SAFESEARCH_POLICY": {
        "filename": "safesearch.policy",
        "encoding": "base64",
        "data": ""
    },
    "SAFESEARCH": false,
    "SAFESEARCH_RESPONSE": false


input = {
    "baseUrl": "http://192.168.122.246:5000",
    "bInstalledPackages": true,
    "bFactoryPush": false,
    "service":{
        "name": "SafeSearch",
        "config": {}
    }
}

input.service.config = safesearchConfig

getPromise = ->
	return new Promise (resolve, reject) ->
		resolve()

startcall = (input)->
	getPromise()
	.then (resp) =>
		jsonfile.writeFileSync("/tmp/start-input.json",input,{spaces: 2})
		return Start input
	.catch (err) =>
		console.log "Start err ", err
	.then (resp) =>
		jsonfile.writeFileSync("/tmp/start-output.json",resp,{spaces: 2})
		context = {}
		context = utils.extend {},resp
		console.log "result from Start:\n ", JSON.stringify context
	.done

stopcall = ()->
	getPromise()
	.then (resp) =>
		jsonfile.writeFileSync("/tmp/stop-input.json",context,{spaces: 2})
		#console.log "stop context is ", JSON.stringify context
		return Stop context
	.catch (err) =>
		console.log "Stop err ", err
	.then (resp) =>
		jsonfile.writeFileSync("/tmp/stop-output.json",resp,{spaces: 2})
		console.log "result from Stop:\n ", JSON.stringify resp
		context = {}
		context = utils.extend {},resp
		
	.done

updatecall = ()->
	getPromise()
	.then (resp) =>
		jsonfile.writeFileSync("/tmp/update-input.json",context,{spaces: 2})		
		return Update context
	.catch (err) =>
		console.log "Update err ", err
	.then (resp) =>
		jsonfile.writeFileSync("/tmp/update-output.json",resp,{spaces: 2})				
		context = {}
		context = utils.extend {},resp
		console.log "result from Update:\n ", JSON.stringify resp		
	.done

startcall(input);
setTimeout(updatecall, 20000, input);
setTimeout(stopcall, 40000, input);

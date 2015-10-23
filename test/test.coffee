jsonfile = require('jsonfile')
Start = require('./../src/context').start
Stop = require('./../src/context').stop
Update = require('./../src/context').update
Validate = require('./../src/context').validate
Promise = require 'bluebird'
diff = require('deep-diff').diff
utils = require('utils')._

# context data
#---------------------------------------------------------------------------------------------

context = {
    "baseUrl": "http://192.168.122.246:5000",
    "bInstalledPackages": true,
    "bFactoryPush": false,
    "service": {
        "name": "safesearch",
        "factoryConfig": {
            "config": {
                "safesearch": {
                    "enable": true,
                    "urlfilter": {
                        "enable": true,
                        "config": {
                            "HAVE_SAFESEARCH": true,
                            "SAFESEARCH_POLICY": {
                                "filename": "safesearch.policy",
                                "encoding": "base64",
                                "data": "Z29vZ2xlCnlhaG9vCmJpbmcK"
                            },
                            "SAFESEARCH": true,
                            "SAFESEARCH_RESPONSE": true
                        }
                    }
                }
            }
        },
        "policyConfig": {
            "safesearch": {
                "enable": true,
                "urlfilter": {
                    "enable": true,
                    "config": {
                        "HAVE_SAFESEARCH": true,
                        "SAFESEARCH_POLICY": {
                            "filename": "safesearch.policy",
                            "encoding": "base64",
                            "data": "Z29vZ2xlCnlhaG9vCmJpbmcK"
                        },
                        "SAFESEARCH": true,
                        "SAFESEARCH_RESPONSE": true
                    }
                }
            }
        }
    }
}


getPromise = ->
	return new Promise (resolve, reject) ->
		resolve()

startcall = (context)->
	getPromise()
	.then (resp) =>
		jsonfile.writeFileSync("/tmp/start-input.json",context,{spaces: 2})
		return Start context 
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

startcall(context);
setTimeout(updatecall, 20000, context);
setTimeout(stopcall, 40000, context);
setTimeout(startcall, 60000, context);
setTimeout(updatecall, 80000, context);
setTimeout(stopcall, 100000, context);

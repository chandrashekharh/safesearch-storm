safesearch-storm
===================

Synopsis
--------
safesearch-storm is a storm plugin for managing the safesearch service.

It provides the REST API to configure the saefsearch service using stormflash framework. Also the safesearch changes are assoiciated with universal process which is  monitored by the corenova-storm in containers.


*List of APIs*
=============

<table>
  <tr>
    <th>Verb</th><th>URI</th><th>Description</th>
  </tr>
  <tr>
    <td>GET</td><td>/corenova</td><td>List conreova configuration to extract the corenova instance ID</td>
  </tr>
  <tr>
    <td>PUT</td><td>/corenova/:id/transform/include</td><td>Update the safesearch configs for corenova instance running respective container</td>
  </tr>
</table>


**GET corenova-storm instanceID API**

    Verb      URI                Description
    GET       /corenova          Get the List of conreova configuration to extract the latest corenova instance ID

**Example Request


**Example Response**
    
### Response JSON   
		[
		  {
		    "id": "500eb587-2731-493a-8afa-ffcefee3bee2",
		    "data": {
		      "debug_level": 2,
		      "novacache": false,
		      "logdir": "/var/log/corenova",
		      "engine": {
			"exec_queue_timeout": 1000,
			"exec_timeout": "180s",
			"feeder_queue_timeout": 1,
			"load_delay": 250,
			"max_load": 200,
			"max_threads": 150,
			"min_threads": 50,
			"prefork": 1,
			"use_atomic": true,
			"use_cache": true
		      },
		      "transform": {
			"name": "uproxy",
			"source": {
			  "url": "http://registry.corenova.com/uproxy.xfc",
			  "encoding": "base64",
			  "data": ""
			},
			"include": {
			  "HAVE_NFQUEUE": false,
			  "HAVE_CATDNS": false,
			  "HAVE_FFPROXY": true,
			  "HAVE_COMMTOUCH": true,
			  "HAVE_KASPERSKY": true,
			  "HAVE_SAFESEARCH": true,
			  "HAVE_CLOGGER": true,
			  "UPROXY_LISTEN_PORT": 12345,
			  "PROTOCOL_ANALYSIS_TIMEOUT": 10000,
			  "PROTOCOL_ANALYSIS_MODULES": "cpn.net.analysis.http,cpn.net.analysis.smtp,cpn.net.analysis.pop3,cpn.net.analysis.imap,cpn.net.analysis.ssl",
			  "HTTP_DATASCAN_MAXSIZE": "1M",
			  "SMTP_DATASCAN_MAXSIZE": "3M",
			  "POP3_DATASCAN_MAXSIZE": "3M",
			  "IMAP_DATASCAN_MAXSIZE": "6M",
			  "KASPERSKY_SCAN_TIMEOUT": 2000,
			  "KASPERSKY_MAX_SESSIONS": 4,
			  "COMMTOUCH_PORT": 5678,
			  "COMMTOUCH_IP": "127.0.0.1",
			  "COMMTOUCH_CATEGORY_MAP": {
			    "filename": "commtouch.map",
			    "encoding": "base64",
			    "data": ""
			  },
			  "SAFESEARCH_POLICY": {
			    "filename": "safesearch.policy",
			    "encoding": "text",
			    "data": ""
			  },
			  "HTTP_FILTER_TEMPLATE": {
			    "filename": "template.filter",
			    "encoding": "base64",
			    "data": ""
			  },
			  "HTTP_VIRUS_TEMPLATE": {
			    "filename": "template.virus",
			    "encoding": "base64",
			    "data": ""
			  },
			  "SSL_CERT_INSPECTION": false,
			  "SSL_DOMAIN_FILTERING": false,
			  "SSL_FILTER_SCANDOMAIN_CERT": false,
			  "SSL_FILTER_RESTRICT_SSL_CERT": false,
			  "SSL_FILTER_WEBWARNING": false,
			  "SSL_FFPROXY_DIR": "ssl/data",
			  "SSL_CONTENT_INSPECTION": false,
			  "SSL_BYPASS_DATA_INSPECTION": true,
			  "SSL_BYPASS_INCLUDE_DOMAIN": false,
			  "SSL_INSPECT_CACHE": true,
			  "SSL_INSPECT_CACHE_MAX_ENTRIES": 1000,
			  "SSL_INSPECT_CACHE_PERSIST": true,
			  "SSL_INSPECT_CACHE_STORE": "/var/ssl-inspect.cache",
			  "SSL_INSPECT_CABUNDLE": {
			    "encoding": "base64",
			    "data": "",
			    "filename": "ca-cert.pem"
			  },
			  "SSL_INSPECT_CACERT": {
			    "encoding": "base64",
			    "data": "",
			    "filename": "rootcert.pem"
			  },
			  "SSL_INSPECT_CAKEY": {
			    "encoding": "base64",
			    "data": "",
			    "filename": "rootkey.pem"
			  },
			  "SSL_CATEGORY_POLICY": {
			    "filename": "ssl/data/filter.category.match",
			    "encoding": "text",
			    "data": "0.0.0.0/32 150 !152\n"
			  },
			  "SSL_CATEGORY_USER": {
			    "filename": "ssl/data/category.user",
			    "encoding": "text",
			    "data": "apple.com 150\n"
			  },
			  "PROXY_HTTP": true,
			  "HTTP_AV_SCAN": true,
			  "KASPERSKY_HTTP_UPLOAD": true,
			  "KASPERSKY_HTTP_DOWNLOAD": true,
			  "CONTENT_FILTERING": false,
			  "HTTP_CUSTOM_FILTER": true,
			  "HTTP_FFPROXY_DIR": "http/data",
			  "FFPROXY_TEMPLATE_DIR": "./",
			  "COMMTOUCH_CATEGORY": false,
			  "COMMTOUCH_CATEGORY_POLICY": {
			    "filename": "http/data/filter.category.match",
			    "encoding": "text",
			    "data": "0.0.0.0/32 150 151 !152 \n"
			  },
			  "COMMTOUCH_CATEGORY_USER": {
			    "filename": "http/data/category.user",
			    "encoding": "text",
			    "data": "apple.com 150\n"
			  },
			  "SAFESEARCH": true,
			  "SAFESEARCH_RESPONSE": true,
			  "MAIL_AV_SCAN": true,
			  "PROXY_SMTP": true,
			  "KASPERSKY_SMTP": true,
			  "PROXY_POP3": true,
			  "KASPERSKY_POP3": true,
			  "PROXY_IMAP": true,
			  "KASPERSKY_IMAP": true
			}
		      }
		    },
		    "saved": true,
		    "isRunning": true,
		    "_events": {
		      "running": [
			null,
			null
		      ]
		    },
		    "configPath": "/var/stormflash/plugins/corenova",
		    "logPath": "/var/log/corenova",
		    "out": 9,
		    "err": 17,
		    "configs": {
		      "source": {
			"filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/transform-source.xfc"
		      },
		      "include": {
			"filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/transform-include.xfh",
			"configs": {
			  "COMMTOUCH_CATEGORY_MAP": {
			    "filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/commtouch.map"
			  },
			  "SAFESEARCH_POLICY": {
			    "filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/safesearch.policy"
			  },
			  "HTTP_FILTER_TEMPLATE": {
			    "filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/template.filter"
			  },
			  "HTTP_VIRUS_TEMPLATE": {
			    "filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/template.virus"
			  },
			  "SSL_INSPECT_CABUNDLE": {
			    "filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/ca-cert.pem"
			  },
			  "SSL_INSPECT_CACERT": {
			    "filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/rootcert.pem"
			  },
			  "SSL_INSPECT_CAKEY": {
			    "filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/rootkey.pem"
			  },
			  "SSL_CATEGORY_POLICY": {
			    "filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/ssl/data/filter.category.match"
			  },
			  "SSL_CATEGORY_USER": {
			    "filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/ssl/data/category.user"
			  },
			  "COMMTOUCH_CATEGORY_POLICY": {
			    "filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/http/data/filter.category.match"
			  },
			  "COMMTOUCH_CATEGORY_USER": {
			    "filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/http/data/category.user"
			  }
			}
		      },
		      "xfc": {
			"filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/uproxy.xfc"
		      },
		      "engine": {
			"filename": "/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/engine.ini"
		      }
		    },
		    "invocation": {
		      "name": "universal",
		      "path": "/usr/bin",
		      "monitor": true,
		      "args": [
			"--config_file=/var/stormflash/plugins/corenova/500eb587-2731-493a-8afa-ffcefee3bee2/engine.ini"
		      ],
		      "options": {
			"env": {
			  "NOVAMODULE_PATH": "/usr/lib:/usr/local/lib",
			  "LD_LIBRARY_PATH": "/lib:/usr/lib:/usr/local/lib"
			},
			"detached": true,
			"stdio": [
			  "ignore",
			  9,
			  17
			]
		      }
		    },
		    "isReady": true,
		    "instance": 17225,
		    "isRestarting": false
		  }
		]
**PUT safesearch changes corenova-storm API**

    Verb    URI                                Description
    PUT     /corenova/:id/transform/include    Add the safesearch changes into corenova-storm instance configuration


**Example Request and Response**

### Request JSON

    {
        "HAVE_SAFESEARCH": true,
        "SAFESEARCH_POLICY": {
            "filename": "safesearch.policy",
            "encoding": "text",
            "data": "Z29vZ2xlCnlhaG9vCmJpbmcK"
        },
        "SAFESEARCH": true,
        "SAFESEARCH_RESPONSE": true
    }
 
### Request JSON
    {
        "updated": true
    }

Copyright & License
--------
LICENSE 

MIT

COPYRIGHT AND PERMISSION NOTICE

Copyright (c) 2014-2015, Clearpath Networks, <licensing@clearpathnet.com>.

All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

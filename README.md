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
			  "data": "W3RyYW5zZm9ybTptb2R1bGUgLT4gdHJhbnNmb3JtOmVuZ2luZV0KbW9kdWxlID0gY29yZW5vdmEuZGF0YS5wcm9jZXNzb3Iud"
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
			    "data": "MQlXZXJidW5nICYgUG9wLVVwcw0KMglBbGtvaG9sIHVuZCBUYWJhaw0KMwlBbm9ueW1pemVycw0KNAlLdW5zdA0KNQlVbnRlcm5laG1lbg0KNglUcmFuc3BvcnQNCjcJQ2hhdA0KOQlGb3JlbiAmIE5ld3Nncm91cHMNCjEwCUtvbXByb21pdHRpZXJ0DQoxMQlDb21wdXRlciAmIFRlY2huaWsNCjEyCUtyaW1pbmVsbGUgQWt0aXZpdCZhdW1sO3Rlbg0KMTMJRGF0aW5nICYgS29udGFrdGFuemVpZ2VuDQoxNAlEb3dubG9hZC1TZWl0ZW4NCjE1CUJpbGR1bmcNCjE2CVVudGVyaGFsdHVuZw0KMTcJRmluYW56ZW4NCjE4CUdsJnV1bWw7Y2tzc3BpZWwNCjE5CVNwaWVsZQ0KMjAJUmVnaWVydW5nDQoyMQlIYXNzICYgSW50b2xlcmFueg0KMjIJR2VzdW5kaGVpdCAmIE1lZGl6aW4NCjIzCUlsbGVnYWxlIERyb2dlbg0KMjQJSm9ic3VjaGUNCjI2CU1lZGlhc3RyZWFtaW5nICYgRG93bmxvYWRzDQoyNwlOYWNocmljaHRlbg0KMjgJR2VtZWlubiZ1dW1sO3R6aWdlIE9yZ2FuaXNhdGlvbmVuIHVuZCBOR09zDQoyOQlOYWNrdGhlaXQNCjMwCVBlcnMmb3VtbDtubGljaGUgU2VpdGVuDQozMQlQaGlzaGluZyAmIEJldHJ1Zw0KMzIJUG9saXRpaw0KMzMJUG9ybm9ncmFwaGllIC9leHBsaXppdGUgc2V4dWVsbGUgSW5oYWx0ZQ0KMzQJSW1tb2JpbGllbg0KMzUJUmVsaWdpb24NCjM2CVJlc3RhdXJhbnRzICYgR2FzdHJvbm9taWUgDQozNwlTdWNobWFzY2hpbmVuICYgUG9ydGFsZQ0KMzgJU2hvcHBpbmcNCjM5CVNvemlhbGUgTmV0endlcmtlDQo0MAlTcGFtc2VpdGVuDQo0MQlTcG9ydA0KNDIJU2NoYWRzb2Z0d2FyZQ0KNDQJJlV1bWw7YmVyc2V0emVyDQo0NQlSZWlzZW4NCjQ2CUdld2FsdA0KNDcJV2FmZmVuDQo0OAlXZWItYmFzaWVydGUgRS1NYWlscw0KNDkJQWxsZ2VtZWluZSBJbmhhbHRlDQo1MAlGcmVpemVpdCAmIEVyaG9sdW5nDQo2MQlCb3RuZXRzDQo2MglLdWx0ZSwgU2VrdGVuDQo2MwlNb2RlICYgU2NoQzZuaGVpdA0KNjQJR3J1JnN6bGlnO2thcnRlbg0KNjUJSGFja2luZw0KNjcJSWxsZWdhbGUgU29mdHdhcmUNCjY4CUJpbGRlciBTaGFyaW5nDQo2OQlTaWNoZXJoZWl0IGluIGRlciBJbmZvcm1hdGlvbnN0ZWNobmlrDQo3MAlJbnN0YW50IE1lc3NhZ2luZw0KNzEJTmV0endlcmtmZWhsZXINCjcyCUdlcGFya3RlIERvbWFpbnMNCjczCVBlZXItdG8tUGVlcg0KNzQJUHJpdmF0ZSBJUC1BZHJlc3Nlbg0KNzUJU2NodWxlDQo3NglTZXh1YWxrdW5kZSAmIEF1ZmtsJmF1bWw7cnVuZw0KNzcJR2VzY2htYWNrbG9zZXMNCjc4CUJpbGRlciB2b24gS2luZGVzbWlzc2hhbmRsdW5nZW4NCg=="
			  },
			  "SAFESEARCH_POLICY": {
			    "filename": "safesearch.policy",
			    "encoding": "text",
			    "data": "Z29vZ2xlCnlhaG9vCmJpbmcK"
			  },
			  "HTTP_FILTER_TEMPLATE": {
			    "filename": "template.filter",
			    "encoding": "base64",
			    "data": "SFRUUC8xLjEgMjAwIE9LIChmaWx0ZXJlZCkKQ29ubmVjdGlvbjogY2xvc2UKQ29udGVudC1UeXBl OiB0ZXh0L2h0bWw7IGNoYXJzZXQ9aXNvLTg4NTktMQoKPCFET0NUWVBFIEhUTUwgUFVCTElDICIt Ly9XM0MvL0RURCBIVE1MIDQuMDEgVHJhbnNpdGlvbmFsLy9FTiIgImh0dHA6Ly93d3cudzMub3Jn L1RSL2h0bWw0L2xvb3NlLmR0ZCI+CjxodG1sPgoJPHRpdGxlPlJlcXVlc3QgRmlsdGVyZWQ8L3Rp dGxlPgoJPGhlYWQ+CgkKCTxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+CgkJYm9keSB7CgkJCXBhZGRp bmc6IDE1cHggMjBweDsKCQkJZm9udC1mYW1pbHk6IEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2Vy aWY7ICAgICAgICAKCQl9CgkJLm1vYmlsZXsKCQkJZGlzcGxheSA6IG5vbmU7CgkJfQoJCS50YWJs ZXR7CgkJCWRpc3BsYXkgOiBibG9jazsKCQl9CgkJLnNtYWxsLWZvbnR7CgkJCWZvbnQtc2l6ZTog MTJweDsKCQl9CgkJQG1lZGlhIChtYXgtd2lkdGg6IDQ3OXB4KSB7CgkJCS5tb2JpbGV7CgkJCQlk aXNwbGF5IDogYmxvY2s7CgkJCX0KCQkJLnRhYmxldHsKCQkJCWRpc3BsYXkgOiBub25lOwoJCQl9 CgkJfQoJCUBtZWRpYSAobWluLXdpZHRoOiA0ODBweCkgYW5kIChtYXgtd2lkdGg6IDk3OXB4KSB7 CgkJCS5tb2JpbGV7CgkJCQlkaXNwbGF5IDogbm9uZTsKCQkJfQoJCQkudGFibGV0ewoJCQkJZGlz cGxheSA6IGJsb2NrOwoJCQl9CgkJfQogICAgPC9zdHlsZT4gIAkKPC9oZWFkPgoJCjxib2R5PgoJ PGNlbnRlcj4KCQk8ZGl2IGNsYXNzPSJtb2JpbGUiPgoJCQk8aW1nIHNyYz0iaHR0cHM6Ly9hc3Nl dHMuZW1zLnRlbGVrb20uaW50ZXJjbG91ZC5uZXQvaW1nL21vYl9ibG9ja2VkLnBuZyIgLz4KCQk8 L2Rpdj4KCQk8ZGl2IGNsYXNzPSJ0YWJsZXQiPgoJCQk8aW1nIHNyYz0iaHR0cHM6Ly9hc3NldHMu ZW1zLnRlbGVrb20uaW50ZXJjbG91ZC5uZXQvaW1nL3RhYl9ibG9ja2VkLnBuZyIgLz4KCQk8L2Rp dj4KCQk8aDIgY2xhc3M9Imdlcm1hbiI+U2VpdGUgd3VyZGUgZ2VmaWx0ZXJ0PC9oMj4JCgkJPHNw YW4gY2xhc3M9Imdlcm1hbiI+VVJMOiAkdSBhdWYgSG9zdCAkaDwvc3Bhbj4JCQkJCgkJPGJyIC8+ PGJyIC8+CgkJPGIgY2xhc3M9Imdlcm1hbiI+JGggd3VyZGUgZGVyL2RlbiBXZWJmaWx0ZXItS2F0 ZWdvcmllL24gJG08L2I+CgkJPGJyIC8+PGJyIC8+CgkJPHNwYW4gY2xhc3M9InNtYWxsLWZvbnQg Z2VybWFuIj5CaXR0ZSBtZWxkZW4gU2llIGZlaGxlcmhhZnRlIFdhcm51bmdlbiBpaHJlbSBsb2th bGVuIElULUFkbWluaXN0cmF0b3I8L3NwYW4+Cgk8L2NlbnRlcj4KPC9ib2R5Pgo8L2h0bWw+Cg=="
			  },
			  "HTTP_VIRUS_TEMPLATE": {
			    "filename": "template.virus",
			    "encoding": "base64",
			    "data": "SFRUUC8xLjEgNDAzIEZPUkJJRERFTiAodmlydXMpCkNvbm5lY3Rpb246IGNsb3NlCkNvbnRlbnQt VHlwZTogdGV4dC9odG1sOyBjaGFyc2V0PWlzby04ODU5LTEKCgo8IURPQ1RZUEUgSFRNTCBQVUJM SUMgIi0vL1czQy8vRFREIEhUTUwgNC4wMSBUcmFuc2l0aW9uYWwvL0VOIiAiaHR0cDovL3d3dy53 My5vcmcvVFIvaHRtbDQvbG9vc2UuZHRkIj4KPGh0bWw+Cgk8dGl0bGU+UmVxdWVzdCBCbG9ja2Vk PC90aXRsZT4KCTxoZWFkPgoJCgk8c3R5bGUgdHlwZT0idGV4dC9jc3MiPgoJCWJvZHkgewoJCQlw YWRkaW5nOiAxNXB4IDIwcHg7CgkJCWZvbnQtZmFtaWx5OiBBcmlhbCwgSGVsdmV0aWNhLCBzYW5z LXNlcmlmOyAgICAgICAgCgkJfQoJCS5tb2JpbGV7CgkJCWRpc3BsYXkgOiBub25lOwoJCX0KCQku dGFibGV0ewoJCQlkaXNwbGF5IDogYmxvY2s7CgkJfQoJCS5zbWFsbC1mb250ewoJCQlmb250LXNp emU6IDEycHg7CgkJfQoJCUBtZWRpYSAobWF4LXdpZHRoOiA0NzlweCkgewoJCQkubW9iaWxlewoJ CQkJZGlzcGxheSA6IGJsb2NrOwoJCQl9CgkJCS50YWJsZXR7CgkJCQlkaXNwbGF5IDogbm9uZTsK CQkJfQoJCX0KCQlAbWVkaWEgKG1pbi13aWR0aDogNDgwcHgpIGFuZCAobWF4LXdpZHRoOiA5Nzlw eCkgewoJCQkubW9iaWxlewoJCQkJZGlzcGxheSA6IG5vbmU7CgkJCX0KCQkJLnRhYmxldHsKCQkJ CWRpc3BsYXkgOiBibG9jazsKCQkJfQoJCX0KICAgIDwvc3R5bGU+ICAJCjwvaGVhZD4KCQo8Ym9k eT4KCTxjZW50ZXI+CgkJPGRpdiBjbGFzcz0ibW9iaWxlIj4KCQkJPGltZyBzcmM9Imh0dHBzOi8v YXNzZXRzLmVtcy50ZWxla29tLmludGVyY2xvdWQubmV0L2ltZy9tb2JfYmxvY2tlZC5wbmciIC8+ CgkJPC9kaXY+CgkJPGRpdiBjbGFzcz0idGFibGV0Ij4KCQkJPGltZyBzcmM9Imh0dHBzOi8vYXNz ZXRzLmVtcy50ZWxla29tLmludGVyY2xvdWQubmV0L2ltZy90YWJfYmxvY2tlZC5wbmciIC8+CgkJ PC9kaXY+CgkJPGgyIGNsYXNzPSJnZXJtYW4iPlNlaXRlIHd1cmRlIGdlZmlsdGVydDwvaDI+CgkJ PHNwYW4gY2xhc3M9Imdlcm1hbiI+VVJMOiAkdSBhdWYgSG9zdCAkaDwvc3Bhbj4KCQk8YnIgLz48 YnIgLz4JCQoJCTxiIGNsYXNzPSJnZXJtYW4iPiRoIGVudGgmYXVtbDtsdCBlaW5lbiBWaXJ1cyAk bTwvYj4KCQk8YnIgLz48YnIgLz4KCQk8c3BhbiBjbGFzcz0ic21hbGwtZm9udCBnZXJtYW4iPkJp dHRlIG1lbGRlbiBTaWUgZmVobGVyaGFmdGUgV2FybnVuZ2VuIGlocmVtIGxva2FsZW4gSVQtQWRt aW5pc3RyYXRvcjwvc3Bhbj4KCTwvY2VudGVyPgo8L2JvZHk+CjwvaHRtbD4K"
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
			    "data": "IyMKIyMgY2EtYnVuZGxlLmNydCAtLSBCdW5kbGUgb2YgQ0EgUm9vdCBDZXJ0aWZpY2F0ZXMKIyMKIyMgQ2",
			    "filename": "ca-cert.pem"
			  },
			  "SSL_INSPECT_CACERT": {
			    "encoding": "base64",
			    "data": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUY5VENDQk4yZ0F3SUJBZ0lHQVV3SEFHK01NQTBHQ1NxR1NJYjNEUUVCQlFVQU1JSHNNVUF3UGdZRFZRUUQKRERkRGIzSndiM0poZEdVZ1UyVmpkWEpwZEhrZ1NIVmlJRUZrYldsdUlEeERVMGd0WVdSdGFXNUFaVzF6TFhSbApiR1ZyYjIwdVpHVStNUTh3RFFZRFZRUUlEQVpUWldOMWNtVXhFekFSQmdOVkJBY01Da2x1ZEdWeVEyeHZkV1F4CkN6QUpCZ05WQkFZVEFsVlRNUjh3SFFZRFZRUUtEQlpEYjNKd2IzSmhkR1VnVTJWamRYSnBkSGtnU0hWaU1Rd3cKQ2dZRFZRUUxEQU5XVTFBeFJqQkVCZ2txaGtpRzl3MEJDUUVXTjBOdmNuQnZjbUYwWlNCVFpXTjFjbWwwZVNCSQpkV0lnUVdSdGFXNGdQRU5UU0MxaFpHMXBia0JsYlhNdGRHVnNaV3R2YlM1a1pUNHdIaGNOTVRBd016RXlNRFF3Ck16TXhXaGNOTWpBd016QTVNRFF3TXpNeFdqQ0I3REZBTUQ0R0ExVUVBd3czUTI5eWNHOXlZWFJsSUZObFkzVnkKYVhSNUlFaDFZaUJCWkcxcGJpQThRMU5JTFdGa2JXbHVRR1Z0Y3kxMFpXeGxhMjl0TG1SbFBqRVBNQTBHQTFVRQpDQXdHVTJWamRYSmxNUk13RVFZRFZRUUhEQXBKYm5SbGNrTnNiM1ZrTVFzd0NRWURWUVFHRXdKVlV6RWZNQjBHCkExVUVDZ3dXUTI5eWNHOXlZWFJsSUZObFkzVnlhWFI1SUVoMVlqRU1NQW9HQTFVRUN3d0RWbE5RTVVZd1JBWUoKS29aSWh2Y05BUWtCRmpkRGIzSndiM0poZEdVZ1UyVmpkWEpwZEhrZ1NIVmlJRUZrYldsdUlEeERVMGd0WVdSdAphVzVBWlcxekxYUmxiR1ZyYjIwdVpHVStNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDCkFRRUF1ZDAzaGpqeFZwekRaRTdJWFNYam9NczFyeG1rV05QUzBxZ0dDNDBQNFY5QVF4ZFI5WWhycExaVnFJemMKWndCVWRKT2hCbXFuYXJ1WlRZbURTeVZyQmFISUFhNmJMdEZQeDNheHBuOXFsYjc5MVJnNEd0akZ2aFRzMUlkTQpUVjhkdEgvMFExQ3RrdjRDTHpjaTY0cGtIK1NOeFN0VzRCY25LLzc0RnZkN0FpcEZ5TFNYck8rUjdjaExidFp6CkFQaVd2dFBSWUxYaHVHekd3SGxLN3U3S3dlamFqYjM4amRPemxzYmYvdHVaait0S0Q1Z0hsNGRHQjBiZTk5bXUKdFhsMU9LQ3ZYZXdielUrbVkzWlpHWHRLWTJOaHl6YmQ5SElkK1ozNWt2TXJGeXBRT214cXVXZkNCb210K3FzWApiTi8zVnBxZHJ5MElxcCtxRVA3VVYvWmdoUUlEQVFBQm80SUJtVENDQVpVd1FnWURWUjBSQkRzd09ZRTNRMjl5CmNHOXlZWFJsSUZObFkzVnlhWFI1SUVoMVlpQkJaRzFwYmlBOFExTklMV0ZrYldsdVFHVnRjeTEwWld4bGEyOXQKTG1SbFBqQ0NBU0FHQTFVZEl3U0NBUmN3Z2dFVGdCUUlJS2ttRm9OWCt3ZmJUaHNJdWYxS2RpTnZONkdCOHFTQgo3ekNCN0RGQU1ENEdBMVVFQXd3M1EyOXljRzl5WVhSbElGTmxZM1Z5YVhSNUlFaDFZaUJCWkcxcGJpQThRMU5JCkxXRmtiV2x1UUdWdGN5MTBaV3hsYTI5dExtUmxQakVQTUEwR0ExVUVDQXdHVTJWamRYSmxNUk13RVFZRFZRUUgKREFwSmJuUmxja05zYjNWa01Rc3dDUVlEVlFRR0V3SlZVekVmTUIwR0ExVUVDZ3dXUTI5eWNHOXlZWFJsSUZObApZM1Z5YVhSNUlFaDFZakVNTUFvR0ExVUVDd3dEVmxOUU1VWXdSQVlKS29aSWh2Y05BUWtCRmpkRGIzSndiM0poCmRHVWdVMlZqZFhKcGRIa2dTSFZpSUVGa2JXbHVJRHhEVTBndFlXUnRhVzVBWlcxekxYUmxiR1ZyYjIwdVpHVSsKZ2dZQlRBY0FiNHd3REFZRFZSMFRCQVV3QXdFQi96QWRCZ05WSFE0RUZnUVVDQ0NwSmhhRFYvc0gyMDRiQ0xuOQpTbllqYnpjd0RRWUpLb1pJaHZjTkFRRUZCUUFEZ2dFQkFLc3g2ZGdwZXg3TzZqa1BKYytOYUFpRGdWaSszZnpTCis1dGVNWkRWTzRUVnFUeWhuTEZmNWF5RVJjZVUxTERYVENvczlCM0VST3VTbWJ3RSs1VDB3UWpvaUdBbkswbTQKNXFPd0JEU0tzRUpwSjhlUHZodDFFdHU2TG03U3VMM2MxcGJ6T2xiK1plNWNoNFlhNmNBZ2NjWVhmZ2dqZVVzRAovM1lpTnBPTHpJQ1prU0dpRmJ2bWZzWk5jM3V5RFBkb0cvekpkWDhRRDVoRzZlVEZLamlZL040S0s4ZStPU1pmCkFhN0xQOFd1SWdpeTdZN2szcWt5U0syRm1HZExRenV2VHRsZGR3YUF2akk4WXBxQ1ROSC8wZEtqVTIybW9KQkwKUEd2eFlXbzFCUXBpVXg3SzVOSHZYSVQ1L0h5TlNFc1prN3dZb01IRnQyVDZTcERqVGZHaVpiMD0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=",
			    "filename": "rootcert.pem"
			  },
			  "SSL_INSPECT_CAKEY": {
			    "encoding": "base64",
			    "data": "LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBdWQwM2hqanhWcHpEWkU3SVhTWGpvTXMxcnhta1dOUFMwcWdHQzQwUDRWOUFReGRSCjlZaHJwTFpWcUl6Y1p3QlVkSk9oQm1xbmFydVpUWW1EU3lWckJhSElBYTZiTHRGUHgzYXhwbjlxbGI3OTFSZzQKR3RqRnZoVHMxSWRNVFY4ZHRILzBRMUN0a3Y0Q0x6Y2k2NHBrSCtTTnhTdFc0QmNuSy83NEZ2ZDdBaXBGeUxTWApyTytSN2NoTGJ0WnpBUGlXdnRQUllMWGh1R3pHd0hsSzd1N0t3ZWphamIzOGpkT3psc2JmL3R1WmordEtENWdICmw0ZEdCMGJlOTltdXRYbDFPS0N2WGV3YnpVK21ZM1paR1h0S1kyTmh5emJkOUhJZCtaMzVrdk1yRnlwUU9teHEKdVdmQ0JvbXQrcXNYYk4vM1ZwcWRyeTBJcXArcUVQN1VWL1pnaFFJREFRQUJBb0lCQUE3YTVYTXUzZXNrUUdHbQpBbEdmazUvb1hmUU93cG51NUN5K0RTMmpLcC9Dc3lvcGxQMWcxK21rUVJobG1jQUp3TFpJamxncThoS1B4K0x3Cm1MUEsyOURwYTBqbkliUU9PcWdnam5aV1BMaVhPVVpzMXg4ZU1EL1BBRmJFTVk4RmlTUkNEYzNMaHZQMnBVb00KeUJlM1NlVmFxUklYTXF4YWJXRVEwZGRVRkZySnp2aUp6QzNmSXNSSWw1UlRsblZmZ2pSWSs1SDZZcWVZVU52WQoxclpmS3JmT3IvSE1pY0FncURKV3pIc3ovSU9SbVY0Ty9zeGFWOWpCTHZoejVZTEZxa25nYWprRFpvQytEU2p5ClBydlg0Q1NkbEprZllrSnJlbisrV1A3Wi95NERsQUQzSmxvVngvano3a0QvRnByUWowRHZQTlNEWHJ5dW91K3YKd2ZGVEU4a0NnWUVBK1M0NWxzN0NmSnh2NSsrbWJsZ1J1ZzJYdUpLUVE3SjlWcnZsOEszaWc4WUg2aSs2aWlYcQpySlZWTjJVZW9YYU9SeUhBcUhjajhuOTFKdjBsNUpUMjg1RzBCbVcrZVNQK3hUbVVpTHNGZ2JJTlg0RFdzZVhIClJrZzVTZ3BPdElySFUxQUVUMHNQR3lKQzJhRlRkb00rYkpUaUs5VGQ4cjNVamQySTFZK1FxVk1DZ1lFQXZ2TmsKbFk2OXQ4MVI4YXlWUHZmSkVkKzBWSHRiY2ZDdFBaS0U5TlMvK3k2amQ5STJHaHVNdlBaWmtwdDVpWkdXUHQxbQo2NThET3lOSTRzOTBwWWx1enJNQ3Z2MlNvY1pSM0o1VC81T2ExTEVPWmc1Y0dNK0pFeWxKcTl2RzNscjh2bFN6CkE5QklVMGd0MkUreWpaQTdyNkhVdElkUHpuZ2RJNFFxalhEZEc4Y0NnWUVBN1hKNkdGWlFpSlErSXlPQVVqZ0UKTkdwTmdPblJKV0dLQk1PcTJ3Mm9BM0FMRE1PTW02YUVHUTk0ay8vOUQxbTlQTlZTRkhicnYySnJ6Y3AvZUhIbgpYYlVqZXRFcmo1NllZWEo4TTBzY2RUbXBlcTk0WnkrU0ZFd3dvM2h0QmFnVlJ6UEIxNW1yL0d4S2piNG9uWTkxClJkMGVKU3lFajVNTFlHQ1J5d2d5anRjQ2dZQkhxR3Nzdk41eFpYbkU2ZkV3S2lpb3JueXIzNGNYb1N4Q0dRUVEKSk83T3dsZlNGVzc4S1M2Tmt4MVdLVVpZMit1NE43bngza0NHSnQycFVCVUVNaWtGSktSNUxBdWs3aG0yWXl3KwpreFBka1h4SHpFZS9mOUovQUZXSFN2aThaUVRJSUZ6MXAyb2M1czlkaDdzSDZRS2RER3dZTzFjMXNsbXRCR0k3CnBna3o3UUtCZ1FEa1l1LzhEcXB6eWdITGhOUUE4SGhwelUyWVduZUYwbnNKampQNk9GQi9Yc2ZhRWZ4NjBvaWYKUlEvQ2hVVEVWV1VKMnhRRkdFaFFWS3MweDZ1KzhvOVZYa1dJbWJmV0dZWTlnNENCZytwS1RZSDJTTWkwZ3lzaApac3JqeTNRT2E5ODAxRzRKMWhXVlJuK29SWEFJWkprZWRHL3ladGNnTDlhK3VQQ0w1UEtEalE9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo=",
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

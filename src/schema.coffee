
#To Validate the SafeSearch schema
schema_SafeSearch =
    name: "SafeSearch"
    type: "object"
    required: true
    additionalProperties: true 
    properties:
        HAVE_SAFESEARCH:            {"type":"boolean", "required":true}
        SAFESEARCH:                 {"type":"boolean", "required":true}
        SAFESEARCH_RESPONSE:        {"type":"boolean", "required":true}
        SAFESEARCH_POLICY:
            type: "object"
            required: true
            properties:
                filename:           {"type":"string", "required":true}
                encoding:           {"type":"string", "required":true}
                data:               {"type":"string", "required":true}

module.exports.SafeSearch = schema_SafeSearch

Class TextHandler.adapter.RESTAdapter Extends EnsLib.HTTP.OutboundAdapter
{

/// Send a POST to the configured Server, Port and URL, sending form data to the named form variables.
Method Post(Output pHttpResponse As %Net.HttpResponse, pFormVarNames As %String, pData...) As %Status
{
     quit ..SendFormDataArray(.pHttpResponse, "POST", ..GetRequest(), .pFormVarNames, .pData)
}

ClassMethod GetRequest() As %Net.HttpRequest
{
     set request = ##class(%Net.HttpRequest).%New()
     set request.ContentType = "application/json;charset=UTF-8"
     Set request.FollowRedirect = 1
     quit request
}

}

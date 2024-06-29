Class TextHandler.api.AIFuncDispatcher Extends %CSP.REST
{

Parameter CONTENTTYPE = "application/json";

Parameter CHARSET = "UTF-8";

/// Sets the response charset to utf-8
Parameter HandleCorsRequest = 1;

ClassMethod Text2FHIR() As %Status
{
	kill ^A
    #Dim tSc As %Status = $$$OK
    Set txt = $ZCVT($ZCVT(%request.Content.Read(),"I","UTF8"),"I","JSON")
    /*Set ^A(0) = txt
    Set ^A(1) = %request.Content.ContentType
    Set ^A(2) = %request.Content.CharSet*/
    #Dim jsonObj as %DynamicObject = {}.%FromJSON(txt)
    //Set ^A(3) = jsonObj.%ToJSON()
    Set req = ##Class(Ens.StringRequest).%New()
    Set req.StringValue = jsonObj.text
	#Dim service As  Ens.BusinessService = ""
    Set tSC = ##Class(Ens.Director).CreateBusinessService("TextHandler.services.Text2FHIRService",.service)
    #Dim resp As Ens.StringResponse
    Set tSC = service.ProcessInput(req,.resp)
	w $ZCVT(resp.StringValue,"O","UTF8")
	Quit tSc
}

ClassMethod OnPreHTTP() As %Boolean
{
    Set %session.AppTimeout = 200
}

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
        <Route Url="/Text2FHIR" Method="POST" Call="Text2FHIR" />
    </Routes>
}

}

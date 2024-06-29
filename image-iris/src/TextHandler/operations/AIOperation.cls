Class TextHandler.operations.AIOperation Extends EnsLib.REST.Operation
{

Parameter ADAPTER = "TextHandler.adapter.RESTAdapter";

Method GetEntities(pRequest As TextHandler.messages.ExtractEntityRequest, Output pResponse As TextHandler.messages.ExtractEntityResponse) As %Status
{
	Set tSC = $$$OK
    try {
      // Prepare and log the call
      #Dim reqObj As %DynamicObject = {}
      Set reqObj.text = pRequest.ClinicText
      // Execute the call
      //Set tSC= ..Adapter.PostURL(tURL,.tHttpResponse, , reqObj.%ToJSON())
      
      Set ..Adapter.URL = "/extract"
      Set tSC= ..Adapter.Post(.tHttpResponse, , reqObj.%ToJSON())
      // Return the response
      If $$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
         Set tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
      }
      Quit:$$$ISERR(tSC)
      If $IsObject(tHttpResponse) {
         // Instantiate the response object
         Set pResponse = ##class(TextHandler.messages.ExtractEntityResponse).%New()
         #Dim resp As %DynamicObject = {}
         //Set tSC = resp.%FromJSON(tHttpResponse.Data)
         //Set resp = str
         //Set pResponse.EntityPayload = resp.%ToJSON()
         Set pResponse.EntityPayload = ..GetJsonString(tHttpResponse.Data.Read())
       }
   }catch{
       Set tSC=$$$SystemError
   }
   Quit tSC
}

Method GetFHIR(pRequest As TextHandler.messages.ExtractFHIRRequest, Output pResponse As TextHandler.messages.ExtractFHIRResponse) As %Status
{
	Set tSC = $$$OK
    try {
      // Prepare and log the call
      #Dim reqObj As %DynamicObject = {}
      Set reqObj.text = pRequest.EntitiesText
      // Execute the call
      Set ..Adapter.URL = "/fhir"
      Set ^temp = ..Adapter.URL
      Set tSC= ..Adapter.Post(.tHttpResponse, , reqObj.%ToJSON())
      // Return the response
      If $$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
         Set tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
      }
      Quit:$$$ISERR(tSC)
      If $IsObject(tHttpResponse) {
         // Instantiate the response object
         Set pResponse = ##class(TextHandler.messages.ExtractFHIRResponse).%New()
         Set pResponse.FHIRPayload = tHttpResponse.Data.Read()
       }
   }catch{
       Set tSC=$$$SystemError
   }
   Quit tSC
}

ClassMethod GetJsonString(text) As %String [ Language = python, SqlProc ]
{
  import json
  # 将JSON字符串解析为Python对象
  data = json.loads(text)

# 将Python对象转换回字符串，确保中文字符正确显示
  output_str = json.dumps(data, ensure_ascii=False, indent=2)

  return output_str
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="TextHandler.messages.ExtractEntityRequest"> 
		<Method>GetEntities</Method>
	</MapItem>
    <MapItem MessageType="TextHandler.messages.ExtractFHIRRequest"> 
		<Method>GetFHIR</Method>
	</MapItem>
</MapItems>
}

}

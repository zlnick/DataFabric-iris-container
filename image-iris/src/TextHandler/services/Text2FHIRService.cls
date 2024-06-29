Class TextHandler.services.Text2FHIRService Extends Ens.BusinessService
{

Parameter SETTINGS = "TargetConfigName:Basic:selector?context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

/// Configuration item to which to send inbound messages.
Property TargetConfigName As Ens.DataType.ConfigName;

Method OnProcessInput(pInput As Ens.StringRequest, Output pOutput As Ens.StringResponse) As %Status
{
        Set tSC = $$$OK
        #Dim req As TextHandler.messages.ExtractEntityRequest = ##Class(TextHandler.messages.ExtractEntityRequest).%New()
        Set req.ClinicText = pInput.StringValue
        //Set ^A(10) = pInput.StringValue
        #Dim resp As TextHandler.messages.ExtractFHIRResponse
        Set tSC = ..SendRequestSync(..TargetConfigName,req,.resp)
        Set pOutput = ##Class(Ens.StringResponse).%New()
        Set pOutput.StringValue = resp.FHIRPayload
        Quit tSC
}

}

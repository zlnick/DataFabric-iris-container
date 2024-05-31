Class ChatGLM.logger.ExtractionLogSerial Extends (%SerialObject, %JSON.Adaptor)
{

Property sessionId As %String;

Property originalText As %String(MAXLEN = 8000);

Property textReceiveTime As %DateTime;

Property entitiesText As %String(MAXLEN = 20000);

Property entitiesExtractedTime As %DateTime;

Property fhirJosnText As %String(MAXLEN = 40000);

Property fhirGeneratedTime As %DateTime;

Property status As %String(VALUELIST = ",rev,ext,fhir");

Property errorLog As %String(MAXLEN = 40000);

Storage Default
{
<Data name="ExtractionLogState">
<Value name="1">
<Value>sessionId</Value>
</Value>
<Value name="2">
<Value>originalText</Value>
</Value>
<Value name="3">
<Value>textReceiveTime</Value>
</Value>
<Value name="4">
<Value>entitiesText</Value>
</Value>
<Value name="5">
<Value>entitiesExtractedTime</Value>
</Value>
<Value name="6">
<Value>fhirJosnText</Value>
</Value>
<Value name="7">
<Value>fhirGeneratedTime</Value>
</Value>
<Value name="8">
<Value>status</Value>
</Value>
<Value name="9">
<Value>errorLog</Value>
</Value>
</Data>
<State>ExtractionLogState</State>
<StreamLocation>^ChatGLM.logger.ExtractionLogS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}

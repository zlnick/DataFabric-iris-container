Class ChatGLM.logger.ExtractionLog Extends %Persistent
{

Property sessionId As %String;

Property batchId As %String;

Property TextId As %String;

Property event As %String(VALUELIST = ",rev,txtSent,entRev,fhirReq,fhirResp");

Property eventTime As %Library.TimeStamp;

Property context As %String;

Storage Default
{
<Data name="ExtractionLogDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>sessionId</Value>
</Value>
<Value name="3">
<Value>batchId</Value>
</Value>
<Value name="4">
<Value>event</Value>
</Value>
<Value name="5">
<Value>eventTime</Value>
</Value>
<Value name="6">
<Value>context</Value>
</Value>
</Data>
<DataLocation>^ChatGLM.logger.ExtractionLogD</DataLocation>
<DefaultData>ExtractionLogDefaultData</DefaultData>
<IdLocation>^ChatGLM.logger.ExtractionLogD</IdLocation>
<IndexLocation>^ChatGLM.logger.ExtractionLogI</IndexLocation>
<StreamLocation>^ChatGLM.logger.ExtractionLogS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

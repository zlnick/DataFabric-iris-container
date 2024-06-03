Class ChatGLM.messages.ExtractionLogRequest Extends Ens.Request
{

Property sessionId As %String;

Property batchId As %Integer;

Property event As %String(VALUELIST = ",rev,txtSent,entRev,fhirReq,fhirResp");

Property eventTime As %TimeStamp;

Property content As %String;

Storage Default
{
<Data name="ExtractionLogRequestDefaultData">
<Subscript>"ExtractionLogRequest"</Subscript>
<Value name="1">
<Value>sessionId</Value>
</Value>
<Value name="2">
<Value>batchId</Value>
</Value>
<Value name="3">
<Value>event</Value>
</Value>
<Value name="4">
<Value>eventTime</Value>
</Value>
<Value name="5">
<Value>content</Value>
</Value>
</Data>
<DefaultData>ExtractionLogRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

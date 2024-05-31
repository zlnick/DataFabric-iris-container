Class ChatGLM.messages.ExtractionLogRequest Extends Ens.Request
{

Property Operation As %String(VALUELIST = ",rev,ext,fhir");

Property Payload As ChatGLM.logger.ExtractionLogSerial;

Storage Default
{
<Data name="ExtractionLogRequestDefaultData">
<Subscript>"ExtractionLogRequest"</Subscript>
<Value name="1">
<Value>Operation</Value>
</Value>
<Value name="2">
<Value>Payload</Value>
</Value>
</Data>
<DefaultData>ExtractionLogRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

Class ChatGLM.logger.ExtractionLogSerial Extends %SerialObject
{

Property sessionId As %String;

Property batchId As %String;

Property TextId As %String;

Property Text As %String(MAXLEN = 4096);

Property Entites As %String(MAXLEN = 4096);

Property FHIRText As %String(MAXLEN = 4096);

Storage Default
{
<Data name="ExtractionLogSerialState">
<Value name="1">
<Value>sessionId</Value>
</Value>
<Value name="2">
<Value>batchId</Value>
</Value>
<Value name="3">
<Value>TextId</Value>
</Value>
<Value name="4">
<Value>Text</Value>
</Value>
<Value name="5">
<Value>Entites</Value>
</Value>
<Value name="6">
<Value>FHIRText</Value>
</Value>
</Data>
<State>ExtractionLogSerialState</State>
<StreamLocation>^ChatGLM.log41A.ExtractionLC757S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}

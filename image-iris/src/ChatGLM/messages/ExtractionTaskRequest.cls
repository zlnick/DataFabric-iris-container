Class ChatGLM.messages.ExtractionTaskRequest Extends Ens.Request
{

Property BatchId As %Integer;

Property TextId As %String;

Property Text As %String(MAXLEN = 4096);

Storage Default
{
<Data name="ExtractionTaskRequestDefaultData">
<Subscript>"ExtractionTaskRequest"</Subscript>
<Value name="1">
<Value>BatchId</Value>
</Value>
<Value name="2">
<Value>TextId</Value>
</Value>
<Value name="3">
<Value>Text</Value>
</Value>
</Data>
<DefaultData>ExtractionTaskRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

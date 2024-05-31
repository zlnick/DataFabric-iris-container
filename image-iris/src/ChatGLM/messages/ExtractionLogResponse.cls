Class ChatGLM.messages.ExtractionLogResponse Extends Ens.Response
{

Property LogId As %String;

Property OpResult As %String;

Storage Default
{
<Data name="ExtractionLogResponseDefaultData">
<Subscript>"ExtractionLogResponse"</Subscript>
<Value name="1">
<Value>LogId</Value>
</Value>
<Value name="2">
<Value>OpResult</Value>
</Value>
</Data>
<DefaultData>ExtractionLogResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

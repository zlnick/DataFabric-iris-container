Class TextHandler.messages.ExtractEntityResponse Extends Ens.Response
{

Property EntityPayload As %String(MAXLEN = 8192);

Storage Default
{
<Data name="ExtractEntityResponseDefaultData">
<Subscript>"ExtractEntityResponse"</Subscript>
<Value name="1">
<Value>EntityPayload</Value>
</Value>
</Data>
<DefaultData>ExtractEntityResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

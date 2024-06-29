Class TextHandler.messages.ExtractFHIRResponse Extends Ens.Response
{

Property FHIRPayload As %String(MAXLEN = 8192);

Storage Default
{
<Data name="ExtractFHIRResponseDefaultData">
<Subscript>"ExtractFHIRResponse"</Subscript>
<Value name="1">
<Value>FHIRPayload</Value>
</Value>
</Data>
<DefaultData>ExtractFHIRResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

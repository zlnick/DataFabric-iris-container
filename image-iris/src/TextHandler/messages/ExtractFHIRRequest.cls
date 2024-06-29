Class TextHandler.messages.ExtractFHIRRequest Extends Ens.Request
{

Property EntitiesText As %String(MAXLEN = 8192);

Storage Default
{
<Data name="ExtractFHIRRequestDefaultData">
<Subscript>"ExtractFHIRRequest"</Subscript>
<Value name="1">
<Value>EntitiesText</Value>
</Value>
</Data>
<DefaultData>ExtractFHIRRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

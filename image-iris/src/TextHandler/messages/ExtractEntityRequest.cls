Class TextHandler.messages.ExtractEntityRequest Extends Ens.Request
{

Property ClinicText As %String(MAXLEN = 8192);

Storage Default
{
<Data name="ExtractEntityRequestDefaultData">
<Subscript>"ExtractEntityRequest"</Subscript>
<Value name="1">
<Value>ClinicText</Value>
</Value>
</Data>
<DefaultData>ExtractEntityRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

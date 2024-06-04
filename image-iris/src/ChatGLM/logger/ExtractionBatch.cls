Class ChatGLM.logger.ExtractionBatch Extends %Persistent
{

Property FilePath As %String(MAXLEN = 128);

Property TextCount As %Integer;

Property StartTime As %TimeStamp;

Storage Default
{
<Data name="ExtractionBatchDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FilePath</Value>
</Value>
<Value name="3">
<Value>TextCount</Value>
</Value>
<Value name="4">
<Value>StartTime</Value>
</Value>
</Data>
<DataLocation>^ChatGLM.log41A.ExtractionB34F5D</DataLocation>
<DefaultData>ExtractionBatchDefaultData</DefaultData>
<IdLocation>^ChatGLM.log41A.ExtractionB34F5D</IdLocation>
<IndexLocation>^ChatGLM.log41A.ExtractionB34F5I</IndexLocation>
<StreamLocation>^ChatGLM.log41A.ExtractionB34F5S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

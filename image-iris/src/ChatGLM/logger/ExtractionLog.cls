Class ChatGLM.logger.ExtractionLog Extends (%Persistent, ChatGLM.logger.ExtractionLogSerial)
{

Storage Default
{
<Data name="ExtractionLogDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>sessionId</Value>
</Value>
<Value name="3">
<Value>batchId</Value>
</Value>
<Value name="4">
<Value>TextId</Value>
</Value>
<Value name="5">
<Value>Text</Value>
</Value>
<Value name="6">
<Value>Entites</Value>
</Value>
<Value name="7">
<Value>FHIRText</Value>
</Value>
</Data>
<DataLocation>^ChatGLM.logger.ExtractionLogD</DataLocation>
<DefaultData>ExtractionLogDefaultData</DefaultData>
<IdLocation>^ChatGLM.logger.ExtractionLogD</IdLocation>
<IndexLocation>^ChatGLM.logger.ExtractionLogI</IndexLocation>
<StreamLocation>^ChatGLM.logger.ExtractionLogS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

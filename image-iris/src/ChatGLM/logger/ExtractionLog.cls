Class ChatGLM.logger.ExtractionLog Extends (%Persistent, ChatGLM.logger.ExtractionLogSerial)
{

Index idxSessionId On sessionId [ Unique ];

ClassMethod GetPersistentEntity(serial As ChatGLM.logger.ExtractionLogSerial, Output entity As ChatGLM.logger.ExtractionLog) As %Status
{
    Set sc = $$$OK
    Set entity = ##Class(ChatGLM.logger.ExtractionLog).%New()
    Set sc = serial.%JSONExportToStream(.stream)
    Set sc = entity.%JSONImport(stream)
    Quit sc
}

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
<Value>originalText</Value>
</Value>
<Value name="4">
<Value>textReceiveTime</Value>
</Value>
<Value name="5">
<Value>entitiesText</Value>
</Value>
<Value name="6">
<Value>entitiesExtractedTime</Value>
</Value>
<Value name="7">
<Value>fhirJosnText</Value>
</Value>
<Value name="8">
<Value>fhirGeneratedTime</Value>
</Value>
<Value name="9">
<Value>status</Value>
</Value>
<Value name="10">
<Value>errorLog</Value>
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

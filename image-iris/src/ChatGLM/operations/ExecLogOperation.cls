Class ChatGLM.operations.ExecLogOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method HandleLog(pRequest As ChatGLM.messages.ExtractionLogRequest, Output pResponse As ChatGLM.messages.ExtractionLogResponse) As %Status
{
    Set sc = $$$OK
    Set op = pRequest.Operation
    Set pResponse = ##Class(ChatGLM.messages.ExtractionLogResponse).%New()
    #Dim entity As ChatGLM.logger.ExtractionLog
    if ("rev" = op){
        Set sc = ##Class(ChatGLM.logger.ExtractionLog).GetPersistentEntity(pRequest.Payload,.entity)
        Set sc = entity.%Save()
        Set pResponse.LogId = entity.%Id()
        Set pResponse.OpResult = "Log saved"
        return sc
    }
    if ("ext" = op){
        Set sessionId = pRequest.Payload.sessionId
        Set entity = ##Class(ChatGLM.logger.ExtractionLog).idxSessionIdOpen(sessionId,,.sc)
        Set sc = pRequest.Payload.%JSONExportToStream(.stream)
        Set sc = entity.%JSONImport(stream)
        Set sc = entity.%Save()
        Set pResponse.LogId = entity.%Id()
        Set pResponse.OpResult = "Log replaced"
        return sc
    }
    if ("fhir" = op){
        Set sessionId = pRequest.Payload.sessionId
        Set entity = ##Class(ChatGLM.logger.ExtractionLog).idxSessionIdOpen(sessionId,,.sc)
        Set sc = pRequest.Payload.%JSONExportToStream(.stream)
        #Dim obj As %DynamicObject = ##Class(%DynamicObject).%FromJSON(stream.Read())
        set iterator=obj.%GetIterator()
        while iterator.%GetNext(.key,.val) {
            SET $PROPERTY(entity,key) = val
        }
        Set sc = entity.%Save()
        Set pResponse.LogId = entity.%Id()
        Set pResponse.OpResult = "Log updated"
        return sc
    }
    Quit sc
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="ChatGLM.messages.ExtractionLogRequest">
    <Method>HandleLog</Method>
  </MapItem>
</MapItems>
}

}

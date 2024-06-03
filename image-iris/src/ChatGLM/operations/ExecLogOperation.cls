Class ChatGLM.operations.ExecLogOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method HandleLog(pRequest As ChatGLM.messages.ExtractionLogRequest, Output pResponse As Ens.Response) As %Status
{
    Set sc = $$$OK
    #Dim log As ChatGLM.logger.ExtractionLog = ##Class(ChatGLM.logger.ExtractionLog).%New()
    Set log.sessionId = pRequest.sessionId
    Set log.batchId = pRequest.batchId
    Set log.event = pRequest.event
    Set log.eventTime = pRequest.eventTime
    
    If ("" '= pRequest.quickStreamId){
        Set log.context = ##Class(%Stream.GlobalCharacter).%New()
        Set quickStream = ##Class(HS.SDA3.QuickStream).%OpenId(pRequest.quickStreamId,,.sc)
        Set sc = log.context.CopyFrom(quickStream)
        //Set sc = log.context.%Save()
        //Set sc = quickStream.Clear()
    }
    Set sc = log.%Save()
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

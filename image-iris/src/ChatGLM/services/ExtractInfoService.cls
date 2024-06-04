Class ChatGLM.services.ExtractInfoService Extends Ens.BusinessService
{

/// Configuration item(s) to which to send file stream messages
Property TargetConfigNames As %String(MAXLEN = 1000);

Parameter SETTINGS = "TargetConfigNames:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    Set sc = $$$OK
    #Dim req as ChatGLM.messages.ExtractionTaskRequest = pInput
    /*#Dim log AS ChatGLM.logger.ExtractionLogSerial = ##Class(ChatGLM.logger.ExtractionLogSerial).%New()
    Set log.batchId = req.BatchId
    Set log.TextId = req.TextId
    Set log.context = req.Text
    Set log.event = "rev"
    Set log.eventTime = $ZDATETIME($ZTIMESTAMP,3,,9)
    Set logReq = ##Class(ChatGLM.messages.ExtractionLogRequest).%New()
    Set logReq.log = log
    Set tSC1=..SendRequestAsync("ChatGLM.operations.ExecLogOperation",logReq)  Set:$$$ISERR(tSC1) tSC=$$$ADDSC(sc,tSC1)*/
    
    For iTarget=1:1:$LENGTH(..TargetConfigNames, ",") { 
        Set tOneTarget=$ZSTRIP($PIECE(..TargetConfigNames,",",iTarget),"<>W")  Continue:""=tOneTarget
        Set tSC1=..SendRequestAsync(tOneTarget,req)  Set:$$$ISERR(tSC1) tSC=$$$ADDSC(sc,tSC1)
        Set pOutput  = ##Class(Ens.StringResponse).%New()
        Set pOutput.StringValue = "Sent"
    }
    Quit sc
}

}

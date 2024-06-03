Class ChatGLM.utils.TestFileLoader Extends %RegisteredObject
{

/// Description
ClassMethod loadTrainFile(filePath As %String) As %Status
{
        Set sc = $$$OK
        #Dim fileJsonArray As %DynamicArray = ##Class(%DynamicArray).%FromJSONFile(filePath)
        Set iter = fileJsonArray.%GetIterator()
        if (fileJsonArray.size() < 1){
            W "No text found for extraction",!
            Return sc
        }
        #Dim batchInst As ChatGLM.logger.ExtractionBatch = ##Class(ChatGLM.logger.ExtractionBatch).%New() 
        Set batchInst.FilePath = filePath
        Set batchInst.StartTime = $ZDATETIME($ZTIMESTAMP,3,,9)
        Set batchInst.TextCount = fileJsonArray.size()
        Set sc = batchInst.%Save()
        while iter.%GetNext(.key, .value){
            #Dim node As %DynamicObject = value
            #Dim serviceInstance As Ens.BusinessService = ""
            Set sc = ##Class(Ens.Director).CreateBusinessService("ChatGLM.services.ExtractInfoService",.serviceInstance)
            #Dim req As ChatGLM.messages.ExtractionTaskRequest = ##Class(ChatGLM.messages.ExtractionTaskRequest).%New()
            Set req.BatchId = batchInst.%Id()
            Set req.TextId = node.id
            Set req.Text = node.text
            Set sc = serviceInstance.OnProcessInput(req,.resp)
        }
        Return sc
}

ClassMethod testValidate(filePath As %String) As %Status
{
    Set sc = $$$OK
        #Dim fileJsonArray As %DynamicObject = ##Class(%DynamicArray).%FromJSONFile(filePath)
        w fileJsonArray.%ToJSON()
        #Dim validator As HS.FHIRServer.Util.ResourceValidator = ##Class(HS.FHIRServer.Util.ResourceValidator).%New()
        TRY {
            Set sc = validator.ValidateResource(fileJsonArray)
        }
        CATCH exp
        {
            WRITE "$ZERROR: ",$ZERROR,!
            WRITE "$ECODE: ",$ECODE,!
            WRITE "Data: ",exp.Data,!!
        }
        Return sc
}

}

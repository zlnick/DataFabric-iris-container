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
        while iter.%GetNext(.key, .value){
            #Dim node As %DynamicObject = value
            Set text = node.text
            #Dim serviceInstance As Ens.BusinessService = ""
            Set sc = ##Class(Ens.Director).CreateBusinessService("ChatGLM.services.ExtractInfoService",.serviceInstance)
            Set sc = serviceInstance.OnProcessInput(text,.resp)
            //w "Line:"_text,!
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

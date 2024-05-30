Class ChatGLM.utils.TestFileLoader Extends %RegisteredObject
{

/// Description
ClassMethod loadTrainFile(filePath As %String) As %Status
{
        Set sc = $$$OK
        #Dim fileJsonArray As %DynamicArray = ##Class(%DynamicArray).%FromJSONFile(filePath)
        set iter = fileJsonArray.%GetIterator()
        Set i = 0
        while iter.%GetNext(.key, .value){
            #Dim node As %DynamicObject = value
            Set text = node.text
            //w "Line:"_text,!
            Set i = i+1
        }
        w "Line count="_i,!
        Return sc
}

}

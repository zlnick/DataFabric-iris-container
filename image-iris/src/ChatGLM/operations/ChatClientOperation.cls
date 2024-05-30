Class ChatGLM.operations.ChatClientOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

/// ChatGLM client
Property glmClient As %SYS.Python;

/// System level prompt for the dialog
Property prompt As %String(MAXLEN = 2048) [ Required ];

/// apikey to connect to ChatGLM
Property apikey As %String(MAXLEN = 128) [ Required ];

Parameter SETTINGS = "prompt:Basic,apikey:Basic";

Method OnInit() As %Status
{
   #dim sc As %Status = $$$OK
   try {
      do ..clientInit(..apikey)
   } catch ex {
      set sc = ex.AsStatus()
   }
   quit sc
}

/// Connect to ChatGLM
Method clientInit(apikey) [ Language = python ]
{
   from zhipuai import ZhipuAI
   self.glmClient = ZhipuAI(api_key=apikey)
}

Method OnMessage(request As Ens.StringContainer, Output response As Ens.StringContainer) As %Status
{
   #dim sc As %Status = $$$OK
   try {
      set response = ##class(Ens.StringContainer).%New(..Chat(request.StringValue))
   } catch ex {
      set sc  = ex.AsStatus()
   }
   
   return sc
}

Method Chat(msg As %String) [ Language = python ]
{
   import json,re
   response = self.glmClient.chat.completions.create(
    model="glm-4", 
    messages=[
        {"role": "system", "content": self.prompt},
        {"role": "user", "content": msg},
    ],
    temperature=0.01,
    max_tokens=2048
   )
   entity_payload=response.choices[0].message.content
   json_block_pattern=r"```json\n?|```"
   entity_jsonString=re.sub(json_block_pattern,'',entity_payload,flags=re.DOTALL)
   return entity_jsonString
}

}

Class ChatGLM.operations.ChatGLMClientOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

/// ChatGLM client
Property glmClient As %SYS.Python;

/// System level prompt for the dialog
Property promptFile As %String(MAXLEN = 128) [ Required ];

/// Prompt Content
Property prompt As %String(MAXLEN = 4096);

/// apikey to connect to ChatGLM
Property apikey As %String(MAXLEN = 128) [ Required ];

Parameter SETTINGS = "promptFile:Basic,apikey:Basic";

Method OnInit() As %Status
{
   #dim sc As %Status = $$$OK
   Try {
      Set stream=##class(%Stream.FileCharacter).%New()
      Set sc=stream.LinkToFile(..promptFile)
      While 'stream.AtEnd {
         Set ..prompt=stream.Read()
      }
      Do ..clientInit(..apikey)
      Set rtnResp = ..initPrompt()
      $$$TRACE(..prompt)
   } Catch ex {
      Set sc = ex.AsStatus()
   }
   Quit sc
}

/// Connect to ChatGLM
Method clientInit(apikey) [ Language = python ]
{
   from zhipuai import ZhipuAI
   self.glmClient = ZhipuAI(api_key=apikey)
}

Method initPrompt() [ Language = python ]
{
   import json,re
   response = self.glmClient.chat.completions.create(
    model="glm-4", 
    messages=[
        {"role": "system", "content": self.prompt},
        {"role": "user", "content": "测试"}
    ],
    temperature=0.01,
    max_tokens=4096
   )
   entity_payload=response.choices[0].message.content
   return entity_payload
}

Method OnMessage(request As Ens.StringContainer, Output response As Ens.StringContainer) As %Status
{
   #dim sc As %Status = $$$OK
   Try {
      Set response = ##class(Ens.StringContainer).%New(..Chat(request.StringValue))
   } Catch ex {
      Set sc  = ex.AsStatus()
   }
   
   Return sc
}

Method Chat(msg As %String) [ Language = python ]
{
   import json,re
   response = self.glmClient.chat.completions.create(
    model="glm-4", 
    messages=[
        {"role": "user", "content": msg}
    ],
    temperature=0.01,
    max_tokens=4096
   )
   entity_payload=response.choices[0].message.content
   json_block_pattern=r"```json\n?|```"
   entity_jsonString=re.sub(json_block_pattern,'',entity_payload,flags=re.DOTALL)
   start_index = entity_jsonString.find('{')
   end_index = entity_jsonString.rfind('}') + 1
   json_string = entity_jsonString[start_index:end_index]

   # 定义一个函数来移除注释
   def remove_comments(json_str):
      # 正则表达式匹配不以引号内的//开头的行
      pattern = r'(?<!["\'])\/\/.*'
      # 使用正则表达式移除注释
      cleaned_str = re.sub(pattern, '', json_str)
      return cleaned_str

   # 移除注释
   cleaned_json_str = remove_comments(json_string)

   return cleaned_json_str
}

}

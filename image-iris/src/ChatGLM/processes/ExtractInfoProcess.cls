/// 
Class ChatGLM.processes.ExtractInfoProcess Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='ChatGLM.messages.ExtractionTaskRequest' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='entitiyString' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50000' />
</parameters>
</property>
<property name='fhirArrayString' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50000' />
</parameters>
</property>
<property name='log' type='ChatGLM.logger.ExtractionLog' instantiate='0' />
</context>
<sequence xend='200' yend='750' >
<code name='生成日志 - 收到请求' xpos='200' ypos='250' >
<![CDATA[ Set context.log = ##Class(ChatGLM.logger.ExtractionLog).%New()
 Set context.log.batchId = request.BatchId
 Set context.log.sessionId = ..%Process.%SessionId
 Set context.log.TextId = request.TextId
 Set context.log.Text = request.Text
 Do context.log.%Save()
]]>
</code>
<call name='获取实体' target='ExtractEntityOperation' async='0' xpos='200' ypos='350' >
<request type='Ens.StringContainer' >
<assign property="callrequest.StringValue" value="request.Text" action="set" languageOverride="" />
</request>
<response type='Ens.StringContainer' >
<assign property="context.entitiyString" value="callresponse.StringValue" action="set" languageOverride="" />
</response>
</call>
<code name='生成日志 - 获得实体' xpos='200' ypos='450' >
<![CDATA[ Set context.log.Entites = context.entitiyString
 Do context.log.%Save()]]>
</code>
<call name='获取FHIR资源数组' target='GetFHIROperation' async='0' xpos='200' ypos='550' disabled="true">
<request type='Ens.StringContainer' >
<assign property="callrequest.StringValue" value="context.entitiyString" action="set" languageOverride="" />
</request>
<response type='Ens.StringContainer' >
<assign property="context.fhirArrayString" value="callresponse.StringValue" action="set" languageOverride="" />
</response>
</call>
<code name='生成日志 - 获得FHIR' xpos='200' ypos='650' disabled="true">
<![CDATA[  Set context.log.FHIRText = context.fhirArrayString
 Do context.log.%Save()]]>
</code>
</sequence>
</process>
}

}

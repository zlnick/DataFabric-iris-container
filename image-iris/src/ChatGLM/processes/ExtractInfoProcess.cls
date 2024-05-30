/// 
Class ChatGLM.processes.ExtractInfoProcess Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.StringRequest' response='Ens.Response' height='2000' width='2000' >
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
</context>
<sequence xend='200' yend='450' >
<call name='获取实体' target='ExtractEntityOperation' async='0' xpos='200' ypos='250' >
<request type='Ens.StringContainer' >
<assign property="callrequest.StringValue" value="request.StringValue" action="set" languageOverride="" />
</request>
<response type='Ens.StringContainer' >
<assign property="context.entitiyString" value="callresponse.StringValue" action="set" languageOverride="" />
</response>
</call>
<call name='获取FHIR资源数组' target='GetFHIROperation' async='0' xpos='200' ypos='350' >
<request type='Ens.StringContainer' >
<assign property="callrequest.StringValue" value="context.entitiyString" action="set" languageOverride="" />
</request>
<response type='Ens.StringContainer' >
<assign property="context.fhirArrayString" value="callresponse.StringValue" action="set" languageOverride="" />
</response>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}

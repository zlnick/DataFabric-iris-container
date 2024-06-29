/// 
Class TextHandler.processes.ExtractFHIRBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='TextHandler.messages.ExtractEntityRequest' response='TextHandler.messages.ExtractEntityResponse' height='2000' width='2000' >
<context>
<property name='entityPayload' type='%Stream.GlobalCharacter' instantiate='0' />
<property name='fhirPayload' type='%Stream.GlobalCharacter' instantiate='0' />
</context>
<sequence xend='200' yend='450' >
<call name='将文本转换为实体' target='TextHandler.operations.AIOperation' async='0' xpos='200' ypos='250' >
<request type='TextHandler.messages.ExtractEntityRequest' >
<assign property="callrequest.ClinicText" value="request.ClinicText" action="set" languageOverride="" />
</request>
<response type='TextHandler.messages.ExtractEntityResponse' >
<assign property="context.entityPayload" value="callresponse.EntityPayload" action="set" languageOverride="" />
</response>
</call>
<call name='将实体转换为FHIR' target='TextHandler.operations.AIOperation' async='0' xpos='200' ypos='350' >
<request type='TextHandler.messages.ExtractFHIRRequest' >
<assign property="callrequest.EntitiesText" value="context.entityPayload" action="set" languageOverride="" />
</request>
<response type='TextHandler.messages.ExtractFHIRResponse' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
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

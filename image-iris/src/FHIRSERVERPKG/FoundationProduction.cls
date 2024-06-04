Class FHIRSERVERPKG.FoundationProduction Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="FHIRSERVERPKG.FoundationProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="ExtractEntityOperation" Category="" ClassName="ChatGLM.operations.ChatClientOperation" PoolSize="2" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="apikey">b0e7ac946daa9ad65813bae72cea7ea8.bPtijYK8y0NrGbw2</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
    <Setting Target="Host" Name="promptFile">/home/irisowner/irisdev/data/ExtractionPrompt.txt</Setting>
  </Item>
  <Item Name="GetFHIROperation" Category="" ClassName="ChatGLM.operations.ChatClientOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="apikey">b0e7ac946daa9ad65813bae72cea7ea8.bPtijYK8y0NrGbw2</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
    <Setting Target="Host" Name="promptFile">/home/irisowner/irisdev/data/FHIRPrompt.txt</Setting>
  </Item>
  <Item Name="HS.FHIRServer.Interop.Service" Category="" ClassName="HS.FHIRServer.Interop.Service" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.FHIRServer.Interop.Operation" Category="" ClassName="HS.FHIRServer.Interop.Operation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ChatGLM.services.ExtractInfoService" Category="" ClassName="ChatGLM.services.ExtractInfoService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">ChatGLM.processes.ExtractInfoProcess</Setting>
  </Item>
  <Item Name="ChatGLM.processes.ExtractInfoProcess" Category="" ClassName="ChatGLM.processes.ExtractInfoProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">1200</Setting>
  </Item>
</Production>
}

}

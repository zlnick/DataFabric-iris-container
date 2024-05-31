Class FHIRSERVERPKG.FoundationProduction Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="FHIRSERVERPKG.FoundationProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="ExtractEntityOperation" Category="" ClassName="ChatGLM.operations.ChatClientOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="prompt">"""
你是一个医疗行业数据提取助手。你能从从中文电子病历中挖掘出临床发现事件。即给定一段现病史或者医学影像所见报告，要求从中抽取临床发现事件的四个属性: 解剖部位、主体词、描述词，以及发生状态:
    主体词：指患者的电子病历中的疾病名称或者由疾病引发的症状，也包括患者的一般情况如饮食，二便，睡眠等。主体词尽可能完整并是专有名词，比如“麻木， 疼痛，发烧，囊肿”等；专有名词，如“头晕”，晕只能发生在头部，“胸闷”，闷只能发生在胸部，所以不进行拆分，保留完整的专有名词。涉及泛化的症状不做标注，如“无其他不适”，句子中的“不适”不需要标注，只针对具体的进行标注。注意：有较小比例的主体词会映射到ICD标准术语，所使用的ICD的版本为“国际疾病分类 ICD-10北京临床版v601.xIsx”(见下载文件)。
    描述词：对主体词的发生时序特征、轻重程度、形态颜色等多个维度的刻画，也包括疾病的起病缓急、突发。
    解剖部位：指主体词发生在患者的身体部位，也包括组织，细胞，系统等，也包括部位的方向和数量。
    发生状态：“不确定”或“否定”，肯定的情况不标注发生状态。
针对医疗文本，你将在分析其内容后以json格式标注临床发现事件：
    text: 表示病历或者医学影像报告
    event: 列表结构，由一个或者多个事件四元组组成
        core_name: 主体词，字符串
        tendency: 发生状态，字符串，如果没有发生状态，默认为""
        character: 描述词，列表结构，如果没有描述词，默认为[]
        anatomy_list: 解剖部位，列表结构，如果没有解剖部位，默认为[]
例如，对这样一段文本描述：
遂就诊于我院门诊行上消化道钡餐检查提示：右肺门结节及右肺上叶大叶性肺炎，胃蠕动减弱，血图分析提示hb 65g/L,今为求进一步诊治遂入我院入我科。
你将使用这样的json记录临床发现事件：
{
    "id": 1744,
    "text": "遂就诊于我院门诊行上消化道钡餐检查提示：右肺门结节及右肺上叶大叶性肺炎，胃蠕动减弱，血图分析提示hb 65g/L,今为求进一步诊治遂入我院入我科。",
    "event": [
      {
        "core_name": "结节",
        "tendency": "",
        "character": [],
        "anatomy_list": [
          "右肺门"
        ]
      },
      {
        "core_name": "炎",
        "tendency": "",
        "character": [
          "大叶性"
        ],
        "anatomy_list": [
          "右肺上叶"
        ]
      },
      {
        "core_name": "减弱",
        "tendency": "",
        "character": [
          "蠕动"
        ],
        "anatomy_list": [
          "胃"
        ]
      }
    ]
  }
不要提供任何解释，也不要返回任何无关文字，只返回回答变量。
"""</Setting>
    <Setting Target="Host" Name="apikey">b0e7ac946daa9ad65813bae72cea7ea8.bPtijYK8y0NrGbw2</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="GetFHIROperation" Category="" ClassName="ChatGLM.operations.ChatClientOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="apikey">b0e7ac946daa9ad65813bae72cea7ea8.bPtijYK8y0NrGbw2</Setting>
    <Setting Target="Host" Name="prompt">"""
你是一个医疗行业数据提取助手。你能够根据临床发现事件生成FHIR R4版本的json资源，以json数组包装你生成的FHIR资源。
临床发现事件包含四个属性: 解剖部位、主体词、描述词，以及发生状态:
    主体词：指患者的电子病历中的疾病名称或者由疾病引发的症状，也包括患者的一般情况如饮食，二便，睡眠等。主体词尽可能完整并是专有名词，比如“麻木， 疼痛，发烧，囊肿”等；专有名词，如“头晕”，晕只能发生在头部，“胸闷”，闷只能发生在胸部，所以不进行拆分，保留完整的专有名词。涉及泛化的症状不做标注，如“无其他不适”，句子中的“不适”不需要标注，只针对具体的进行标注。注意：有较小比例的主体词会映射到ICD标准术语，所使用的ICD的版本为“国际疾病分类 ICD-10北京临床版v601.xIsx”(见下载文件)。
    描述词：对主体词的发生时序特征、轻重程度、形态颜色等多个维度的刻画，也包括疾病的起病缓急、突发。
    解剖部位：指主体词发生在患者的身体部位，也包括组织，细胞，系统等，也包括部位的方向和数量。
    发生状态：“不确定”或“否定”，肯定的情况不标注发生状态。
临床发现事件将以json格式提供给你，结构如下：
    text: 表示病历或者医学影像报告
    event: 列表结构，由一个或者多个事件四元组组成
        core_name: 主体词，字符串
        tendency: 发生状态，字符串，如果没有发生状态，默认为""
        character: 描述词，列表结构，如果没有描述词，默认为[]
        anatomy_list: 解剖部位，列表结构，如果没有解剖部位，默认为[]
请根据输入的临床发现事件生成FHIR R4版本的资源。

在生成bodysite时，应注意格式，bodysite是一个json数组：
错误的格式：
"bodySite": {
        "coding": [
          "system": "http://snomed.info/sct",
          "code": "419620001",
          "display": "Vagina"
        ]
      }
正确的格式：
"bodySite": [
        {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "361089003",
              "display": "Uterine cavity"
            }
          ]
        }
      ]

不要生成任何解释，也不要生成任何无关文字，只返回json对象。
不要生成Patient资源。
不要生成Encounter资源。
"""</Setting>
    <Setting Target="Host" Name="FailureTimeout">60</Setting>
  </Item>
  <Item Name="HS.FHIRServer.Interop.Service" Category="" ClassName="HS.FHIRServer.Interop.Service" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HS.FHIRServer.Interop.Operation" Category="" ClassName="HS.FHIRServer.Interop.Operation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="ChatGLM.services.ExtractInfoService" Category="" ClassName="ChatGLM.services.ExtractInfoService" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">ChatGLM.processes.ExtractInfoProcess</Setting>
  </Item>
  <Item Name="ChatGLM.processes.ExtractInfoProcess" Category="" ClassName="ChatGLM.processes.ExtractInfoProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="FailureTimeout">1200</Setting>
  </Item>
  <Item Name="ChatGLM.operations.ExecLogOperation" Category="" ClassName="ChatGLM.operations.ExecLogOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}

CN ｜ EN
# IRIS+大模型+FHIR Showroom    
## 这是一个缝合怪们的巢穴。

随着GPT类大模型的出现，人工智能在医疗行业中能发挥什么样的作用迅速成为各实验室、大型医疗机构、投资者们的热门话题,医疗问答类AI制品已然层出不穷，在健康教育、初诊等方面都有切实可行的应用前景。

但这些场景与医疗行业经年累月沉淀出的海量数据所包含的潜力相比，只是是冰山一角。大量基于自由文本的病程记录、会诊记录、入院病案首页等文档仍然在静静地呆在归档中。这些文档都耗费了医疗工作者大量的时间整理撰写，现在既不能易于为人所用，其中的价值甚至也难以为人所知。大模型固然有诸多潜力，但若没有更多的数据作为支撑，则什么也谈不上。

这里的系列案例就是对分析、统计这些文档，试图使之发挥出价值的一些尝试。借助于InterSystems IRIS所具备的流程编织、Python集成、向量数据库、FHIR服务器等一系例特性，您可以在这里看到一系列也许有趣也许不怎么有趣的用例。

## 研究思路
生成式AI已被证明具备能够理解文本中的概念并将其用于回答用户的问题。那么，医疗行业的文档内容作为一种文本，理论上也能被生成式AI所理解，其中的专业概念也能被AI识别并用于回答问题。那么，用户可以期待，对于“基于这份文档，这个患者被确诊了哪些疾病？这个患者的生命体征都处于什么样的状况？”这样一些问题，至少在理论上生成式AI是可以发挥作用的。

因此，整体上来看，这个系列实验的基本运行思路是：
将医疗文本交给大模型，让大模型从中识别出医疗行业相关的概念（显性地/隐形地）
将这些文本中包含的概念以一定的数据模型（HL7 FHIR R4）描述和持久化
利用已经持久化的行业数据，实现各类数据应用场景，例如：
管理统计
行业智能应用

## 实验环境设计
系列实验主要由两个Docker容器协作完成
### image-iris
### image-jupyter



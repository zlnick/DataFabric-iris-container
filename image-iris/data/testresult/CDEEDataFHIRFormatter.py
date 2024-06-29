import json,os

# 假设你的JSON文件名为"data.json"
file_path = "image-iris/data/testresult/temp.json"
output_path = "image-iris/data/testresult/CHIP-CDEE_fhirFormatted.json"
#temppath = "image-iris/data/testresult/temp.txt"

# 打开并读取JSON文件
with open(file_path, 'r', encoding='utf-8') as file:
     # 将文件内容转换为Python对象（这里是假设为一个列表）
    json_array = json.load(file)
count = 0
 # 轮询数组中的元素
for item in json_array:
    #if [] != item['fhir']:
    try:
        fhirStr = str(item['fhir'])
        corrected_string = fhirStr.replace(r'\\', '\\')
        #corrected_string = corrected_string.replace('\"', '"')
        #corrected_string = corrected_string.replace('\n', '')
        item['fhir'] = json.loads(corrected_string)
    except FileNotFoundError:
        print(f"文件 {file_path} 未找到。")
    except json.JSONDecodeError:
        print(item['id'])
        print(f"文件 {file_path} 的内容不是有效的JSON格式。")
        count += 1
        continue
    except Exception as e:
        print(f"读取文件时发生错误: {e}")
    # 将Python列表转换为JSON格式的字符串
json_str = json.dumps(json_array, ensure_ascii=False, indent=4)

# 判断文件是否存在
if os.path.exists(output_path):
    # 如果文件存在，则删除文件
    os.remove(output_path)
    print(f"文件 {output_path} 已存在，已删除。")

# 使用with语句打开文件，并将JSON字符串写入文件
with open(output_path, 'w', encoding='utf-8') as file:
    file.write(json_str)
print(f"JSON数组已成功写入到文件: {output_path}") 
print(count)    


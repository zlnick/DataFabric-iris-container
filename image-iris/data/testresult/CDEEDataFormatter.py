import json

# 假设你的JSON文件名为"data.json"
file_path = "image-iris/data/testresult/CHIP-CDEE_test.json"
output_path = "image-iris/data/testresult/CHIP-CDEE_handled.json"

# 使用try-except来处理可能发生的文件读取错误
try:
    # 打开并读取JSON文件
    with open(file_path, 'r', encoding='utf-8') as file:
        # 将文件内容转换为Python对象（这里是假设为一个列表）
        json_array = json.load(file)
        
        # 轮询数组中的元素
        for item in json_array:
            if [] != item['event']:
                item['event'] = json.loads(item['event'])
    # 将Python列表转换为JSON格式的字符串
    json_str = json.dumps(json_array, ensure_ascii=False, indent=4)

    # 使用with语句打开文件，并将JSON字符串写入文件
    with open(output_path, 'w', encoding='utf-8') as file:
        file.write(json_str)
    print(f"JSON数组已成功写入到文件: {output_path}")        
except FileNotFoundError:
    print(f"文件 {file_path} 未找到。")
except json.JSONDecodeError:
    print(f"文件 {file_path} 的内容不是有效的JSON格式。")
except Exception as e:
    print(item['id'])
    print(item['event'])
    print(f"读取文件时发生错误: {e}")
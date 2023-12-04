import json
with open("./test.json",encoding='utf-8') as f:
	data = json.load(f)
print(data)
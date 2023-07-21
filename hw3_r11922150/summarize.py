import glob
import json
import sys

pred_path = sys.argv[1]

file_pattern = "./tmpjson/*.json"
file_list = glob.glob(file_pattern)

d = {}
for file_name in file_list:
    with open(file_name) as f:
        data = json.load(f)
    d.update(data)

with open(pred_path,'w') as f:
    json.dump(d, f, indent=4)

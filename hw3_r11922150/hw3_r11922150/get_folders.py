import glob
import sys
test_dir = sys.argv[1]
file_paths = glob.glob(f'{test_dir}/**/*.png', recursive=True)
d = {}
for path in file_paths:
    sub_dir = "/".join(path.split('/')[:-1]).split(test_dir)[-1]
    if sub_dir not in d:
        d[sub_dir] = 1
with open("./tmp.txt",'w') as f:
    for sub_dir in d.keys():
        f.write(sub_dir+'\n')

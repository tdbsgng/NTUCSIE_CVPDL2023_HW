import matplotlib.pyplot as plt
from torch import tensor
dir = "./curveuda/"
y = []
x = [0] + list(range(5,95+1,5)) + [100]
with open(dir+ 'init.txt','r') as f:
    d = eval(f.readline())
    y.append(float(d['map_50']))
for i in range(5,95+1,5):
    with open(dir + f'{i}.txt','r') as f:
        d = eval(f.readline())
        y.append(float(d['map_50']))
with open(dir+ 'last.txt','r') as f:
    d = eval(f.readline())
    y.append(float(d['map_50']))

plt.plot(x, y, marker='o')
plt.title("uda map50 curve on target val")
plt.xlabel("epoch")
plt.ylabel("map_50")

plt.savefig("./curve_uda.jpg")
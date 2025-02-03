import random
import json

N=10

points=[]
for i in range(N):
    points.append([random.random()*100,random.random()*100])

with open("points.json","w") as f:
    f.writelines(json.dumps(points))

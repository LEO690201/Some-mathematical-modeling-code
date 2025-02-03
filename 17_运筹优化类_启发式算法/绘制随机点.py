import matplotlib.pyplot as plt
import json

with open("points.json","r") as f:
    txt=f.readline()
points=json.loads(txt)

x=[t[0] for t in points]
y=[t[1] for t in points]
plt.scatter(x,y)
plt.show()
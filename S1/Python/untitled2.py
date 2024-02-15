import numpy as np
import matplotlib.pyplot as plt

#exo1
A1=np.array([[1, 2], [3, 4]])
B1=np.array([[1, 5], [2, 3]])
C1=np.dot(A1, B1)
D1=np.dot(B1, A1)

#exo2
A2=np.array([[2, 1, 0], [3, 1, 1], [0, 1, 2]])
B2=np.array([[2, 1, 0], [3, 1, 1]])
C2=np.array([[2, 1, 0]])
D2=np.array([[2], [0], [1]])
E2=np.array([[1], [2]])

#exo3
x=np.linspace(-1.5, 3, 50)
y=x**2
z=x**3
t=np.linspace(0.4*3.14)
w=sin(t)
plt.plot(x, y, 'g-')
plt.plot(x, z, 'r-')
plt.plot(t, w, 'b-')
plt.show()

D = csv.reader(d, delimiter = ';')

L1 = D.__next__()

i = 0
for ligne in D:
    
    L1.append(ligne[i])
    i = i + 1
    
X = [float(x) for x in L1]

d.close()
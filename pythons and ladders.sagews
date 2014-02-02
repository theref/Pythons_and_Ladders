︠35853a26-08b6-4f10-9231-f2e535ffda5d︠
a = matrix(QQ, 101) # creates a square matrix populated with 0's
SaLdic = {29: 7, # a dictionary of all the snakes and ladders
          71: 53,
          93: 1,
          97: 61,
          14: 64,
          30: 49,
          39: 60,
          67: 96,
          }

def rolldie(N):
    """
    Simulates the rolling of a die
    Inputs: an integer N, the index of the row in the matrix
    Outputs: alters the matrix a to reflect the outcome of the die
    """
    for i in range(1,7):
        if N + i <= 100: # player must land on '100' exactly
            a[N, N + i] = 1/6
        else: # otherwise, player does not move
            a[N, N] += 1/6

for k in range(100): # does rolldie over the entire matrix except for [100,100].
    if k not in SaLdic: # except for snakes and ladders
        rolldie(k)

for p, q in SaLdic.iteritems(): # changes probabilities of moving along snake/ladder
    a[p, q] = 1                 # to 1 because they are certain.

b = a.transpose() # required to ensure multiplying the vector works.
start = vector(QQ, 101)
start[0] = 1 # player starts off the board.
︡64a6924a-79bf-47d4-8aad-a287a9fb98ca︡
︠5e14633b-6ac0-450d-8940-143ac7d9a9fb︠
matplot = b.plot(cmap='Blues',colorbar=True)# just something interesting to look at
matplot.show()
matplot.save(filename='matplot.eps')
︡4aeb0c52-febe-4766-a28a-7b576c39e0f0︡{"once":false,"file":{"show":true,"uuid":"1ea08e12-1574-4221-ab72-8ba14d572bc0","filename":"/projects/cbca089d-ac1e-4fe2-84c0-1d09479a7268/.sage/temp/compute5a/32527/tmp_cR5lXV.png"}}︡
︠00c5005a-1de6-4a00-a789-d7b603807c1e︠
x = 101^3
y = (101-8)^3
(x - y)/float(x)*100 # percentage reduction in calculations
︡e39df2dc-1828-4abb-85d0-5c3683c1b97d︡{"stdout":"21.92990203833637\n"}︡
︠ab8c354b-7370-4728-a651-4c6af8ff9ed4︠
e = (b^7)*start # rolling the die several times
d = [e[i] for i in range(101)] # convert vector to list
p = list_plot(d, plotjoined=False, axes_labels=['$Position$ $on$ $Board$','$Pobability$'])
p.show()
p.save(filename='7plot.eps')
︡757245e6-167a-4bb0-b276-747861af803f︡{"once":false,"file":{"show":true,"uuid":"21a554c3-3172-4d12-97a2-901663d0a6a3","filename":"/mnt/home/s3W76uxR/.sage/temp/compute18a/26673/tmp_T0hL4E.png"}}︡
︠d17b2096-d8e8-49ab-95d7-ba7fcf7ef435︠
probls = []
for i in range(100):
    x = b^i*start # roll the die 100 times
    y = x[100]*100 # take the last value in the vector each time and convert to %
    probls.append(float(y))
︡8e76888f-80ba-43bf-9787-1bdb71edaa70︡
︠9ad6e986-ab87-42fe-9df5-0f225c04bf13︠
probls.index(max(probls)) # get the mode
︡c6af1283-81b0-407b-a80a-f1fa1a60b682︡{"stdout":"28\n"}︡
︠da1d656e-a517-4cbd-be6a-a456dee70691︠
import numpy as np
z = list(np.cumsum(probls)) # get the median
for i in z:
    if i >= 50:
        print z.index(i)
        break
︡91195db1-1906-4eb7-a593-9656e529d27f︡{"stdout":"33\n"}︡
︠c03fbe07-24b0-4bf6-ab25-ce0bdf46a8d5︠
q = list_plot(probls, plotjoined=True, ymax=3, axes_labels=['$N$','$\%$'])
q.show()
q.save(filename='turns.eps')

︡bcac1dcf-f4a3-4d8b-91df-b1b1a616b909︡{"once":false,"file":{"show":true,"uuid":"f4ffd973-46bd-4dcd-8b90-be5c1e9d9d5d","filename":"/mnt/home/s3W76uxR/.sage/temp/compute18a/9591/tmp_p4renq.png"}}︡
︠d874a735-8191-4ee0-aef7-5d3c45a01a66︠
r = list_plot(list(np.cumsum(probls)), plotjoined=True, ymax=100, axes_labels=['$N$','$\%$'])
r.show()
r.save(filename='sumturns.eps')


︡edd18348-5917-4064-b7b4-f97a92643b9b︡{"once":false,"file":{"show":true,"uuid":"156a282e-38d1-45c8-b3cc-f5e0555c40b2","filename":"/mnt/home/s3W76uxR/.sage/temp/compute18a/9591/tmp_UuAvVW.png"}}︡
︠0f97f469-c9e5-458c-aa81-a761fea09fab︠










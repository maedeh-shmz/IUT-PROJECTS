import sys
import random
import operator
import numpy as np
import math as m

def got():
    f=open("tsp-52.txt","r")
    out=int(f.readline())
    x=[]
    for line in f.readlines()[::1]:
        for token in line.split(" "):
            x.append(int(float(token)))

    matrix = np.round(np.array(x).reshape(out,3),2)
    a=matrix[:,0]
    b=matrix[:,1]
    c=matrix[:,2]
    f.close()
    return a,b,c,out

def compute_graph(b,c):
    matt={}
    for i in range(0,len(b)):
        for j in range(0,len(c)):
            if(i==j):
                matt[i,j]=0
            else:
                tmp=int(m.sqrt(pow((b[j]-b[i]),2)+pow((c[j]-c[i]),2)))
                matt[i,j]=tmp
    return matt

def evaluate(matt,graph):
    cities=matt
    c=0
    for i in range(0,len(cities)-1):
        j=i+1
        mohtava1=matt[i]-1
        mohtava2=matt[j]-1
        if(j==len(matt)-1):
            c+=graph[mohtava1,0]
        else:
            c+=graph[mohtava1,mohtava2]
    return c

def randomize(out):
    rand=[]
    rand.append(random.sample(range(1, out+1),out))
    first=rand[0][0]
    m = np.round(np.array(rand).reshape(out,1),2)
    m2=m[:,0]
    m3=np.append(m2,int(first))
    return m3

def neighbour(mat,graph):
    neighbours=[]
    tmp=0
    cp=mat.copy()
    for i in range(1,len(mat)-1):
        for j in range(i+1,len(mat)-2):
            mat[[i,j]]=mat[[j,i]]
            neighbours.append(mat)
            mat=cp.copy()
    return neighbours

 
def set_costs(hamsaye,graph):
    costs=[]
    for i in range(0,len(hamsaye)):
        h=hamsaye[i]
        h2=np.array(h).tolist()
        costs.append(evaluate(h2,graph))
    return costs

def run_step():
    city,tool,arz,out=got()
    graph=compute_graph(tool,arz)
    # print(graph)
    first_state=randomize(out)
    first_cost=evaluate(first_state,graph)
    #print("current cost is :")
    #print(first_cost)
    #print("wating!!")
    #ok
    
    hamsaye=neighbour(first_state,graph)
    costs=set_costs(hamsaye,graph)
    temp_cost=0
    prevoius=0
    while(first_cost>=temp_cost):
        temp_cost=min(costs)
        if(first_cost>=temp_cost):
            for i in range(0,len(hamsaye)):
                if(costs[i]==temp_cost):
                    final_neighbour=i
                    break
                else:
                    continue
            first_cost=temp_cost
            next_hamsaye=neighbour(hamsaye[final_neighbour],graph)
            costs=set_costs(next_hamsaye,graph)
        else:
            final_cost=first_cost
            for i in range(0,len(hamsaye)):
                if(costs[i]==final_cost):
                    final_neighbour=i
                    break
                else:
                    continue
            break
    return hamsaye[final_neighbour],final_cost
    
def run_final():
    print("wait")
    final_results=[]
    final_results_costs=[]
    for i in range(0,105):
        temp_answer,temp_answer_cost=run_step()
        final_results.append(temp_answer)
        final_results_costs.append(temp_answer_cost)
    
    # print(final_results)
    # print(final_results_costs)
    Min=final_results_costs[0]
    for i in range(0,105):
        if(final_results_costs[i]<=Min):
            Min=final_results_costs[i]

    for i in range(1,105):
        if(final_results_costs[i]==Min):
            index=i
            break
        else:
            continue
    print("this is the end!!!!!!!!!!!!!!!!!!!!!")
    print(Min,final_results[index])
        

run_final()

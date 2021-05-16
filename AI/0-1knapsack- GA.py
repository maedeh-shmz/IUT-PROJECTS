import sys
import random
import operator
import numpy as np
num=21
all_parents=[]
top_parents=[]

def get_input():
    
        f=open("knapsack-20.txt","r")
        total_w=int(input("enter the weight of the knapsack: "))
        population=num //2
        couple=[]
        couple = [[int(token) for token in line.split(" ")] for line in f.readlines()[::1]]
        matrix = np.round(np.array(couple).reshape(num,2),2)
        weights=matrix[:,0]
        values=matrix[:,1]
        return weights,values,total_w

class my_Main(object):
    def __init__(base):	
        base.capacity = 0
        base.Weight = []
        base.value = []
        base.X = []
        base.parents = []
        base.parent_generated = []
        base.top = []
        base.top_parents = []
        base.generation = 1
        base.population = 0

    def initialize(base):
        for i in range(base.population):
            parent = []
            for k in range(0, num):
                k = random.randint(0, 1)
                parent.append(k)
            base.parents.append(parent)
        
    def set_properties(base, W, P, X, C, population):
        base.weight = W
        base.value = P
        base.X = X
        base.capacity= C
        base.population = population
        base.initialize()

    def fitness(base,array):
        sum_w=0
        sum_v=0
        for index, i in enumerate(array):
            if i==0:
                continue
            else:
                sum_w += weights[index]
                sum_v += values[index]
        if sum_w > total_w:
            return -1
        else:
            return sum_v
    
    #choose parents
    def select(base):
        best_pop=base.population // 2
        for i in range(len(base.parents)):
            parent = base.parents[i]
            ft = base.fitness(parent)
            base.top.append((ft, parent))
        base.top.sort(key=operator.itemgetter(0), reverse=True)
        base.top_parents = base.top[:best_pop]
        base.top_parents = [x[1] for x in base.top_parents]

    #jahesh
    def mutation(base,arr):
        for i in range(len(arr)):
            k = random.uniform(0, 1)
            if k > 0.5:
                if arr[i] == 1:
                    arr[i] = 0
                else:
                    arr[i] = 1
        return arr

    def crossover(base,p1,p2):
        threshold=random.randint(1,len(p1)-1)
        tmp1=p1[threshold:]
        tmp2=p2[threshold:]
        p1=p1[:threshold]
        p2=p2[:threshold]
        p1.extend(tmp2)
        p2.extend(tmp1)
        return p1,p2

    # run algorithm
    def run(base):
        base.select()
        parent_generated = []
        pop = len(base.top_parents)-1
        sample = random.sample(range(pop), pop)
        for i in range(0, pop):
            if i < pop-1:
                r1 = base.top_parents[i]
                r2 = base.top_parents[i+1]
                nchild1, nchild2 = base.crossover(r1, r2)
                parent_generated.append(nchild1)
                parent_generated.append(nchild2)
            else:
                r1 = base.top_parents[i]
                r2 = base.top_parents[0]
                nchild1, nchild2 = base.crossover(r1, r2)
                parent_generated.append(nchild1)
                parent_generated.append(nchild2)

        for i in range(len(parent_generated)):
            parent_generated[i] = base.mutation(parent_generated[i])
        if base.generation > max_g-1:
            parent_generated.sort(key=operator.itemgetter(0), reverse=True)
            print("generation number of {} answers and final answer :" .format(base.generation))
            print(base.top_parents[0], sep = ', ')
        else:
            base.generation += 1
            base.parents = parent_generated
            base.top = []
            base.top_parents = []
            base.run()
    

weights,values,total_w=get_input()
# print("this is the weights: ")
# print(weights)
# print("this is the values: ")
# print(values)
# print("capacity of knapsack: ")
# print(total_w)
# print("****************************************")
first_state=[]
max_g=68
popu=10
for t in range(0,num):
    first_state.append(0)

print("this is the first_state: ")
print(first_state)
obj = my_Main()
obj.set_properties(weights,values, first_state,total_w,popu)
obj.run()
print("****************************************")

final=obj.top_parents[0]
#print(final)
final_v=0
final_w=0
for i in range(0,num):
    final_v += final[i]*values[i]
    final_w += final[i]*weights[i]

print("total weight is :")
print(final_w)
print("total value is :")
print(final_v)




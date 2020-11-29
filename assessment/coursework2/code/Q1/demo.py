# !/usr/bin/env python
# -*- coding: utf-8 -*-

"""
@Project : acs-project-scientific_computation      
@File    : demo.py
@Author  : Billy Sheng 
@Contact : shengdl999links@gmail.com  
@Date    : 2020/11/27 10:41 下午
@Version  : 1.0.0
@License : Apache License 2.0
@Desc    : None
"""

import numpy as np
import matplotlib.pyplot as plt

# t = [0.189367, 0.417477, 0.743755, 1.293817]
# s = [59, 104, 196, 369]
# for i in range(len(t)):
#     print(float(t[i]/s[i],))

tS=[0.003204,0.009056,0.046896,0.333218]
N = [81, 161, 321, 641]
log_ts = []
log_n = []
for i in range(len(tS)):
    log_n.append([np.log(N[i])])
    log_ts.append([np.log(float(tS[i]/N[i]))])

print(log_n, log_ts)

inputs = np.array(log_n)
targets = np.array(log_ts)


inputs = np.concatenate((np.ones((np.shape(inputs)[0],1)),inputs),axis=1)
q_matrix = np.dot(np.transpose(inputs),inputs)

q_inverse = np.linalg.inv(q_matrix)

q_pseudo = np.dot(q_inverse,np.transpose(inputs))

weights = np.dot(q_pseudo,targets)
print(weights)


plt.plot(log_n, log_ts, 'ob')
y1 = [-15.91508659 + 1.25947259*x for x in log_n] # y = w1 + w2 * x
plt.plot(log_n, y1)
# plt.plot(xset, y2)
# plt.plot(xset, y3)
# plt.plot(xset, y4)
plt.show()


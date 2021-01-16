# !/usr/bin/env python
# -*- coding: utf-8 -*-

"""
@Project : acs-project-scientific_computation      
@File    : final test.py
@Author  : Billy Sheng 
@Contact : shengdl999links@gmail.com  
@Date    : 2021/1/15 4:27 下午
@Version  : 1.0.0
@License : Apache License 2.0
@Desc    : None
"""


import matplotlib.pyplot as plt
import numpy as np
import math

x = []
y = []
y0 = []
y1 = []
y2 = []
y3 = []
for i in range(-100, 100):
    xt = i*0.01
    x.append(xt)
    y0.append(0)
    y.append(xt**4 + xt * math.sin(3*xt))
    y1.append(xt**3)
    y2.append(-math.sin(3*xt))
    y3.append(xt**3 + math.sin(3*xt))

plt.plot(x, y)
plt.plot(x, y0)
# plt.plot(x, y1)
# plt.plot(x, y2)
# plt.plot(x, y3)
plt.show()
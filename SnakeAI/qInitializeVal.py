import yaml
import matplotlib.pyplot as plt
import numpy as np

boxes = ['0000', '0001', '0010', '0011', '0100', '0101', '0110', '0111', '1000', '1001', '1010', '1011', '1100', '1101', '1110', '1111']

w = ['0','1','NA']

h = ['2','3','NA']

condition = {}

for w_i in w:
	for h_i in h:
		for box in boxes:
			key = str(tuple([w_i, h_i, box]))
			condition[key] = [0,0,0,0]

with open("q_amount.yaml", "w") as f:

	yaml.dump(condition, f)
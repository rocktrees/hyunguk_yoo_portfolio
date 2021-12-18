import itertools
import yaml
import random
#import json
import dataclasses
import matplotlib.pyplot as plt
import numpy as np


@dataclasses.dataclass
class Status:

    spread: tuple

    place: tuple

    bordering: str

    food: tuple



class Learner(object):

    def __init__(self, w, h, b_size):

        self.w = w

        self.h = h

        self.b_size = b_size

        self.eps = 0.15

        self.lr = 0.8

        self.dis = .5

        self.q_amount = self.Load_q_amount()

        self.past_q = []

        self.acts = {
            0:'left',
            1:'right',
            2:'up',
            3:'down'
        }

    def reset_q(self):

        self.past_q = []

    def Load_q_amount(self, path="q_amount.yaml"):

        with open(path, "r") as f:

            q_amount = yaml.load(f,Loader = yaml.FullLoader)

        return q_amount

    def Save_q_amount(self, path="q_amount.yaml"):

        with open(path, "w") as f:

            yaml.dump(self.q_amount, f)
            
    def snake_action(self, snake, food):

        circ = self.statusreport(snake, food)
        
        random_values = random.uniform(0,1)

        if random_values < self.eps:

            act_move = random.choices(list(self.acts.keys()))[0] 

        else:

            score_of_circ = self.q_amount[self.acquireStatus(circ)]

            act_move = score_of_circ.index(max(score_of_circ))

        value_of_action = self.acts[act_move]

        self.past_q.append({
            'circ': circ,
            'action': act_move
            })
        
        return value_of_action
    
    def q_amount_updated(self, cause):

        past_q = self.past_q[::-1]

        for i, h in enumerate(past_q[:-1]):

            if cause: 

                sN = past_q[0]['circ']

                aN = past_q[0]['action']

                game_condition = self.acquireStatus(sN)

                reward = -1

                self.q_amount[game_condition][aN] = (1-self.lr) * self.q_amount[game_condition][aN] + self.lr * reward 

                cause = None

            else:

                s_current = h['circ'] 

                s_prev = past_q[i+1]['circ'] 

                act_prev = past_q[i+1]['action'] 
                
                x_current = s_prev.spread[0] 

                y_current = s_prev.spread[1] 
    
                x_prev = s_current.spread[0] 

                y_prev = s_current.spread[1] 
                
                if s_prev.food != s_current.food: 

                    reward = 1

                elif (abs(x_current) > abs(x_prev) or abs(y_current) > abs(y_prev)): 

                    reward = 1

                else:

                    reward = -1 
                    
                game_condition = self.acquireStatus(s_prev)

                new_game_condition = self.acquireStatus(s_current)

                self.q_amount[game_condition][act_prev] = (1-self.lr) * (self.q_amount[game_condition][act_prev]) + self.lr * (reward + self.dis*max(self.q_amount[new_game_condition])) 

# stopped here 11/22/20

    def statusreport(self, snake, food):

        sFore = snake[-1]

        xD = food[0] - sFore[0]

        yD = food[1] - sFore[1]

        if xD > 0:

            siteX = '1' 

        elif xD < 0:

            siteX = '0' 

        else:

            siteX = 'NA' 

        if yD > 0:

            siteY = '3' 

        elif yD < 0:

            siteY = '2' 

        else:

            siteY = 'NA' 

        boxs = [
            (sFore[0]-self.b_size, sFore[1]),   
            (sFore[0]+self.b_size, sFore[1]),         
            (sFore[0],sFore[1]-self.b_size),
            (sFore[0],sFore[1]+self.b_size),
        ]
        
        close = []

        for box in boxs:

            if box[0] < 0 or box[1] < 0: 

                close.append('1')

            elif box[0] >= self.w or box[1] >= self.h: 

                close.append('1')

            elif box in snake[:-1]: 

                close.append('1')

            else:

                close.append('0')

        bordering = ''.join(close)

        return Status((xD, yD), (siteX, siteY), bordering, food)

    def acquireStatus(self, circ):

        return str((circ.place[0],circ.place[1],circ.bordering))
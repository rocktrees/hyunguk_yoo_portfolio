
import pygame
import random
import Learner
import matplotlib.pyplot as plt
import numpy as np


pygame.init()

max = 0

t = True

starterS = 1

Red = (255, 102, 102)

Orange = (255, 178, 102)

Turquoise = (72, 209, 204)

Eggshell = (255, 255, 204)

b_size = 10 

screenW = 1200

screenH = 800

q = 100000

frames = 10000000

def looping_game():

    global game_distance

    for event in pygame.event.get():

        if event.type == pygame.QUIT:

            return

        elif event.type == pygame.KEYDOWN:

            if event.key == pygame.K_ESCAPE:

                pygame.quit()

                return

    game_distance = pygame.display.set_mode((screenW, screenH))

    pygame.display.set_caption('Snake Q-Learning')

    time = pygame.time.Clock()

    z = 0

    placer = 10.0

    disp_div = 2

    dispx = screenW / disp_div

    dispy = screenH / disp_div

    x_current = dispx

    y_current = dispy

    x_current_change = z

    y_current_change = z

    snake_stored = [(x_current,y_current)]

    snake_length = starterS

    upW = (screenW - b_size)

    upH = (screenH - b_size)

    roundX = round(random.randrange(z, upW) / placer)

    roundY = round(random.randrange(z, upH) / placer)

    f = False

    n = None

    food_xaxis = roundX * placer

    food_yaxis = roundY * placer

    game_finished = f

    cause = n

    negPos = -1

    posPos = 1

    while not game_finished:

        move = learner.snake_action(snake_stored, (food_xaxis,food_yaxis))

        # changed ifelse to just if( still works)
        if move == "left":

            x_current_change = negPos * b_size

            y_current_change = 0

        if move == "right":

            x_current_change = posPos * b_size

            y_current_change = 0

        if move == "up":

            y_current_change = negPos * b_size

            x_current_change = 0

        if move == "down":

            y_current_change = posPos * b_size

            x_current_change = 0

        xCu = x_current_change

        yCu = y_current_change

        x_current = xCu + x_current

        y_current = yCu + y_current 

        sFore = (x_current,y_current)

        snake_stored.append(sFore)

        if x_current >= screenW or x_current < 0 or y_current >= screenH or y_current < 0:

            cause = 'Screen'

            game_finished = t

        if sFore in snake_stored[:-1]:

            cause = 'Tail'

            game_finished = t

        if x_current == food_xaxis and y_current == food_yaxis:

            upW = (screenW - b_size)

            upH = (screenH - b_size)

            roundX = round(random.randrange(z, upW) / placer)

            roundY = round(random.randrange(z, upH) / placer)

            food_xaxis = roundX * placer

            food_yaxis = roundY * placer

            snake_length = starterS + snake_length

        if len(snake_stored) > snake_length:

            del snake_stored[0]

        game_distance.fill(Eggshell)

        display_food(food_xaxis, food_yaxis)

        display_snake(snake_stored)

        display_score(snake_length - starterS)

        pygame.display.update()

        learner.q_amount_updated(cause)
        
        time.tick(frames)

    return snake_length - starterS, cause

def display_food(food_xaxis, food_yaxis):

    pygame.draw.rect(game_distance, Turquoise, [food_xaxis, food_yaxis, b_size, b_size])   

def display_score(score):

    font = pygame.font.SysFont("arial", 40)

    value = font.render(f"Score: {score}", t, Red)

    game_distance.blit(value, [400, 0])

    # high score
    font2 = pygame.font.SysFont("arial", 40)

    show_max = font2.render(f"Best: {max}", t, Red)

    game_distance.blit(show_max,[700,0])

def display_snake(snake_stored):

    for x in snake_stored:

        pygame.draw.rect(game_distance, Orange, [x[0], x[1], b_size, b_size])

game_number = starterS

learner = Learner.Learner(screenW, screenH, b_size)

while t:

    learner.reset_q()

    if game_number > 20:

        learner.eps = 0

    else:

        learner.eps = 0.15

    score, cause = looping_game()

    if(score > max):

        max = score

        print(f"Games: {game_number}; Highest Score!: {score}")

    else:

        print(f"Games: {game_number}; Score: {score}")

    game_number = starterS + game_number

    if ((game_number % q) == 0): 

        print("Save Qvals")
        
        learner.Save_q_amount()
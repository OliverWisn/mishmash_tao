import sys, pygame
from pygame.sprite import Sprite

pygame.init()

size = width, height = 1350, 700
speed_x1 = 1
speed_y1 = 1
speed_x2 = 1
speed_y2 = 2
black = 0, 0, 0

screen = pygame.display.set_mode(size)

# allsprites = pygame.sprite.Group()

ball = pygame.image.load("intro_ball.gif")

ballrect1 = ball.get_rect()
ballrect2 = ball.get_rect()

ballrect1.x = ballrect1.width
ballrect1.y = ballrect1.height

ballrect2.x = ballrect2.width
ballrect2.x = ballrect2.x + 120
ballrect2.y = ballrect2.height

# allsprites.add(ballrect1)
# allsprites.add(ballrect2)


while 1:
    for event in pygame.event.get():
        if event.type == pygame.QUIT: sys.exit()

    screen_rect = screen.get_rect()

    ballrect1.x += speed_x1
    ballrect1.y += speed_y1
    if ballrect1.x <= 0 or ballrect1.x >= (screen_rect.right - 
        ballrect1.width):
        speed_x1 = -speed_x1
    if ballrect1.y <= 0 or ballrect1.y >= (screen_rect.bottom - 
        ballrect2.height):
        speed_y1 = -speed_y1

    ballrect2.x += speed_x2
    ballrect2.y += speed_y2
    if ballrect2.x <= 0 or ballrect2.x >= (screen_rect.right - 
        ballrect1.width):
        speed_x2 = -speed_x2
    if ballrect2.y <= 0 or ballrect2.y > (screen_rect.bottom - 
        ballrect2.height):
        speed_y2 = -speed_y2

    # if pygame.sprite.collide_rect(ballrect1.x, ballrect2.x):
    #     ballrect1.x *= -1
    #     ballrect1.y *= -1
    #     ballrect2.x *= -1
    #     ballrect2.y *= -1

    screen.fill(black)
    screen.blit(ball, ballrect1)
    screen.blit(ball, ballrect2)
    pygame.display.flip()
    pygame.time.delay(4)
//
//  Obstacle.m
//  FlyAway
//
//  Created by Maxime Britto on 20/04/10.
//  Copyright 2010 Logimax SARL. All rights reserved.
//

#import "Obstacle.h"

#import "Constantes.h"

@implementation Obstacle


- (id)initWithPosition:(CGPoint)point
{
    if (self = [super initWithFrame:CGRectMake(point.x, point.y, LARGEUR_OBSTACLE, HAUTEUR_OBSTACLE)]) {
        self.image = [UIImage imageNamed:@"pigs.png"];
    }
    return self;
}

- (void)move
{
    self.center = CGPointMake(self.center.x + xOrientation, self.center.y + yOrientation);
    
    self.checkScreenCollision;
}

- (void)getFirstOrientation
{
    xOrientation = -1;
    
    int y = arc4random() % 1000;
    
    if( (y % 2) == 1)
        yOrientation = 1;
    else
        yOrientation = -1;
    
}

- (void)checkScreenCollision
{
    if((self.center.y - 10) <= HAUTEUR_ARRIVEE || (self.center.y + 10) >= (HAUTEUR_ECRAN - HAUTEUR_ARRIVEE))
    {
        yOrientation *= -1;
    }
    if((self.center.x - (LARGEUR_OBSTACLE / 2)) <= 0 || (self.center.x + (LARGEUR_OBSTACLE / 2)) >= LARGEUR_ECRAN)
    {
        xOrientation *= -1;
    }
}

- (void)deleteObstacle
{
    self.image = nil;
}


@end

//
//  Hero.m
//  FlyAway
//
//  Created by Maxime Britto on 20/04/10.
//  Copyright 2010 Logimax SARL. All rights reserved.
//

#import "Hero.h"
#import "Constantes.h"

@implementation Hero

@synthesize isMoving;



- (BOOL)isTouchingObstacle:(Obstacle*)monObstacle
{
    BOOL result = NO;
    
    result = [self estProcheDuPoint:CGPointMake(monObstacle.center.x + HAUTEUR_OBSTACLE - 10, monObstacle.center.y)];
    
    if(result == NO)
        result = [self estProcheDuPoint:CGPointMake(monObstacle.center.x - HAUTEUR_OBSTACLE + 10, monObstacle.center.y)];
    
    if(result == NO)
        result = [self estProcheDuPoint:CGPointMake(monObstacle.center.x, monObstacle.center.y + LARGEUR_OBSTACLE - 10)];
    
    if(result == NO)
        result = [self estProcheDuPoint:CGPointMake(monObstacle.center.x, monObstacle.center.y - LARGEUR_OBSTACLE + 10)];
    
    if(result == NO)
        result = [self estProcheDuPoint:CGPointMake(monObstacle.center.x + HAUTEUR_OBSTACLE / 2, monObstacle.center.y + LARGEUR_OBSTACLE / 2)];
    
    if(result == NO)
        result = [self estProcheDuPoint:CGPointMake(monObstacle.center.x + HAUTEUR_OBSTACLE / 2, monObstacle.center.y - LARGEUR_OBSTACLE / 2)];
    
    if(result == NO)
        result = [self estProcheDuPoint:CGPointMake(monObstacle.center.x - HAUTEUR_OBSTACLE / 2, monObstacle.center.y + LARGEUR_OBSTACLE / 2)];
    
    if(result == NO)
        result = [self estProcheDuPoint:CGPointMake(monObstacle.center.x - HAUTEUR_OBSTACLE / 2, monObstacle.center.y - LARGEUR_OBSTACLE / 2)];
    
    
    
    return result;
}



@end

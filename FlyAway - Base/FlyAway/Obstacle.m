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
        self.image = [UIImage imageNamed:@"Montgolfiere.png"];
    }
    return self;
}




@end

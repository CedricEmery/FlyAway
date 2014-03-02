//
//  Hero.h
//  FlyAway
//
//  Created by Maxime Britto on 20/04/10.
//  Copyright 2010 Logimax SARL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjetVisible.h"
#import "Obstacle.h"

@interface Hero : ObjetVisible {
	BOOL isMoving;
    int life:3;
}
@property BOOL isMoving;
@property (nonatomic,assign) int life;

- (BOOL)isTouchingObstacle:(Obstacle*)monObstacle;
@end

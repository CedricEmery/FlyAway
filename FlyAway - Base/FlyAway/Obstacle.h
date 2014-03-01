//
//  Obstacle.h
//  FlyAway
//
//  Created by Maxime Britto on 20/04/10.
//  Copyright 2010 Logimax SARL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjetVisible.h"

@interface Obstacle : ObjetVisible {
    
    int xOrientation;
    int yOrientation;
    
}

- (id)initWithPosition:(CGPoint)point;
- (void)getFirstOrientation;
- (void)move;
- (void)checkScreenCollision;
- (void)deleteObstacle;

@end

//
//  Hero.h
//  FlyAway
//
//  Created by Maxime Britto on 20/04/10.
//  Copyright 2010 Logimax SARL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjetVisible.h"

@interface Hero : ObjetVisible {
	BOOL isMoving;
}
@property BOOL isMoving;

- (void)moveHome:(BOOL)animated;

@end
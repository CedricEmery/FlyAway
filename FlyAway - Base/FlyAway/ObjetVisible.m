//
//  ObjetVisible.m
//  FlyAway
//
//  Created by Maxime Britto on 20/04/10.
//  Copyright 2010 Logimax SARL. All rights reserved.
//

#import "ObjetVisible.h"
#import "Constantes.h"

@implementation ObjetVisible

- (BOOL)estProcheDuPoint:(CGPoint)point
{
	float hypotenuse, a, b;
	a = fabs(point.x - self.center.x);
	b = fabs(point.y - self.center.y);
	hypotenuse = sqrt(a*a + b*b) ;
	
	if (hypotenuse <= (self.frame.size.width)/4) {
		return YES;
	} else {
		return NO;
	}
}

- (void)moveCenterToPosition:(CGPoint)newPosition
{
	[self moveCenterToPosition:newPosition animated:NO];
}


- (void)moveCenterToPosition:(CGPoint)newPosition animated:(BOOL)animateMovement
{
	if (animateMovement == YES) {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1];
	}
	self.center = newPosition;
	
	if (animateMovement == YES) {
		[UIView commitAnimations];
	}
}



@end

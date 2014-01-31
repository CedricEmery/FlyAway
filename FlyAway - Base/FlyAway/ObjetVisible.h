//
//  ObjetVisible.h
//  FlyAway
//
//  Created by Maxime Britto on 20/04/10.
//  Copyright 2010 Logimax SARL. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ObjetVisible : UIImageView {

}
- (BOOL)estProcheDuPoint:(CGPoint)point;
- (void)moveCenterToPosition:(CGPoint)newPosition;
- (void)moveCenterToPosition:(CGPoint)newPosition animated:(BOOL)animateMovement;
@end

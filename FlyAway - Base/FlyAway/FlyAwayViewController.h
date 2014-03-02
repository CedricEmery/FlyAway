//
//  FlyAwayViewController.h
//  FlyAway
//
//  Created by Maxime Britto on 20/04/10.
//  Copyright Logimax SARL 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>
@class Hero;

@interface FlyAwayViewController : UIViewController  {
    
	IBOutlet Hero* monHero;
	IBOutlet UILabel* messageHaut;
    IBOutlet UILabel *messageDepart;
	NSMutableArray* listeObstacles;
    
    NSTimer *timeToMove;
}



@property (strong, nonatomic) IBOutlet UILabel *lifeIndicator;

- (BOOL)checkArrive:(CGPoint)position;
- (IBAction)soundButton:(id)sender;
- (void)moveAllObstacle;

@end


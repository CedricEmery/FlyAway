//
//  FlyAwayViewController.h
//  FlyAway
//
//  Created by Maxime Britto on 20/04/10.
//  Copyright Logimax SARL 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import <AVFoundation/AVFoundation.h>
@class Hero;

@interface FlyAwayViewController : UIViewController <ADBannerViewDelegate> {
    ADBannerView *adView;
	IBOutlet Hero* monHero;
	IBOutlet UILabel* messageHaut;
    IBOutlet UILabel *messageDepart;
	NSMutableArray* listeObstacles;
    
    NSTimer * timeToMove;
}

@property (nonatomic,retain) IBOutlet ADBannerView *adView;


- (BOOL)checkArrive:(CGPoint)position;
- (IBAction)soundButton:(id)sender;
- (void)moveAllObstacle;

@end


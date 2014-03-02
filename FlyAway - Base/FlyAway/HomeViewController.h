//
//  HomeViewController.h
//  FlyAway
//
//  Created by louis on 28/02/2014.
//  Copyright (c) 2014 Maxime Britto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
@interface HomeViewController : UIViewController <ADBannerViewDelegate>{
    ADBannerView *adView;
}

@property (nonatomic,retain) IBOutlet ADBannerView *adView;


@end

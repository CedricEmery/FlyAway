//
//  HomeViewController.m
//  FlyAway
//
//  Created by louis on 28/02/2014.
//  Copyright (c) 2014 Maxime Britto. All rights reserved.
//

#import "HomeViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation HomeViewController
@synthesize adView;
AVAudioPlayer *player;

-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [adView setHidden:NO];
    NSLog(@"Showing");   
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [adView setHidden:YES];
    NSLog(@"Hidden");
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //Pub
    adView.delegate = self;
    [adView setHidden:NO];
    //audio
    NSURL *audioFile=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"pacman_intro" ofType:@"mp3" ]];
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:audioFile error:nil];
    player.volume = 0.80;
    [player play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

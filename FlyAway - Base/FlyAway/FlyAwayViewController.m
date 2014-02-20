///Users/macOsX/Desktop/GIT/FlyAway/FlyAway - Base/FlyAway/icons_fly/bg.jpg
//  FlyAwayViewController.m
//  FlyAway
//
//  Created by Maxime Britto on 20/04/10.
//  Copyright Logimax SARL 2010. All rights reserved.
//

#import "FlyAwayViewController.h"

#import "Obstacle.h"
#import "Hero.h"
#import "Constantes.h"
#import <AVFoundation/AVFoundation.h>
#
@implementation FlyAwayViewController
@synthesize adView;

AVAudioPlayer *player;
NSTimer* mov;

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



- (float)valeurAleatoireCompriseEntre:(float)borne1 et:(float)borne2
{
	return (rand() * (borne2 - borne1) / RAND_MAX) + borne1;
}


/*
// Override to allow orientations other than the default portrait orientation.*/
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    adView.delegate = self;
    [adView setHidden:NO];
	[self moveHome:NO];
    [self placerObstaclesAleatoirement];
}

- (void)placerObstaclesAleatoirement
{
    listeObstacles = [[NSMutableArray alloc] init];
	for (int i = 0; i < 4; i++)
    {
		float x = [self valeurAleatoireCompriseEntre:0 et:LARGEUR_ECRAN];
		float y = 0.0f;
        
		Obstacle* newObstacle = [[Obstacle alloc] initWithPosition:CGPointMake(x, y)];
		[listeObstacles addObject:newObstacle];
        
		[self.view addSubview:newObstacle];
        
	}
    //mov = [NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(moveObstacle:) userInfo:nil repeats:YES];
}


- (void)partieTerminee
{
	[self moveHome:YES];
	if (monHero.isMoving) {
		monHero.isMoving = NO;
	}
}

-  (void)partieGagnee
{
	messageHaut.text = @"Gagné!";
	[self partieTerminee];
}

- (void)partiePerdue
{
	messageHaut.text = @"Perdu";
	[self partieTerminee];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint position = [touch locationInView:self.view];
    
    //Mettre le hero en mouvement si le doigt de l'utilisateur est assez proche
    if(monHero != nil)
    {
        if([monHero estProcheDuPoint:position])
            monHero.isMoving = YES;
    }

	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint position = [touch locationInView:self.view];
	if (monHero.isMoving == YES)
    {
		//Deplacement du heros jusqu'a la position du doigt
        if(monHero != nil)
        {
            [monHero moveCenterToPosition:position animated:FALSE];
        }
		
		//Verification des obstacles

		
		//Verification de la ligne d'arrivee
        if([self checkArrive:position])
        {
            [self partieGagnee];
        }

	}
}

-(void)moveObstacle
{
    for(int i = 0 ; i < listeObstacles.count ; i++)
    {
        [listeObstacles objectAtIndex:i];
    }
}

- (BOOL)checkArrive:(CGPoint)position
{
    if(position.y <= HAUTEUR_ARRIVEE)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

- (IBAction)soundButton:(id)sender {
    NSURL *audioFile=[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"fasound" ofType:@"mp3" ]];
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:audioFile error:nil];
    player.volume = 0.80;
    [player play];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (monHero.isMoving) {
		monHero.isMoving = NO;
	}
}

- (void)moveHome:(BOOL)animated
{
	CGPoint homeCenter = CGPointMake(LARGEUR_ECRAN/2, HAUTEUR_ECRAN - (monHero.bounds.size.height/2));
	[monHero moveCenterToPosition:homeCenter animated:animated];
}


@end

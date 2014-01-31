//
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

@implementation FlyAwayViewController

- (float)valeurAleatoireCompriseEntre:(float)borne1 et:(float)borne2
{
	return (rand() * (borne2 - borne1) / RAND_MAX) + borne1;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
	[self moveHome:NO];
    [self placerObstaclesAleatoirement];
}

- (void)placerObstaclesAleatoirement
{
    listeObstacles = [[NSMutableArray alloc] init];
	for (int i = 0; i < 4; i++) {
		float x = 0.0f; //generer une position horizontale aléatoire
		float y = 0.0f; //generer une position verticale aléatoire
		Obstacle* newObstacle = [[Obstacle alloc] initWithPosition:CGPointMake(x, y)];
		[listeObstacles addObject:newObstacle];
		[self.view addSubview:newObstacle];
        
	}
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
        if(position.y <= messageHaut.frame.size.height)
        {
            [self partieGagnee];
        }

	}
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

//
//  Hero.m
//  FlyAway
//
//  Created by Maxime Britto on 20/04/10.
//  Copyright 2010 Logimax SARL. All rights reserved.
//

#import "Hero.h"

#import "Constantes.h"

@implementation Hero

@synthesize isMoving;



- (void)moveHome:(BOOL)animated
{
	CGPoint homeCenter = CGPointMake(LARGEUR_ECRAN/2, HAUTEUR_ECRAN - (HAUTEUR_HERO/2));
	[self moveCenterToPosition:homeCenter animated:animated];
}

@end

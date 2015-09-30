//
//  Farmer.h
//  Cow Invaders
//
//  Created by Eric Hodgins on 2015-05-23.
//  Copyright (c) 2015 Eric Hodgins. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Farmer : SKSpriteNode

@property(nonatomic) BOOL farmerRunning;
@property(nonatomic) BOOL farmerCanShoot;

+ (instancetype)farmerAtPosition:(CGPoint)position;
-(void)farmerStandStill;
-(void)farmerRun;

@end

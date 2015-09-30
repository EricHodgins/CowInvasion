//
//  CowNode.h
//  Cow Invaders
//
//  Created by Eric Hodgins on 2015-05-31.
//  Copyright (c) 2015 Eric Hodgins. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface CowNode : SKSpriteNode

+(instancetype)cowAtPosition:(CGPoint)position;

-(void)setupAnimation;
-(SKAction *)moveCowTowardsAlien:(CGPoint)position;

@end

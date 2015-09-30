//
//  HudNode.h
//  Cow Invaders
//
//  Created by Eric Hodgins on 2015-06-05.
//  Copyright (c) 2015 Eric Hodgins. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface HudNode : SKNode

@property (nonatomic) NSInteger lives;
@property (nonatomic) NSInteger score;

+(instancetype) hudAtPosition: (CGPoint)position;

-(BOOL)loseLife;
-(void)increaseScore;

@end
